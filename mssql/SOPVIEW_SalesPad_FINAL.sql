USE [Ingest]

IF OBJECT_ID('dbo.SOPVIEW_SalesPad', 'V') IS NOT NULL
    DROP VIEW dbo.SOPVIEW_SalesPad
GO

CREATE VIEW SOPVIEW_SalesPad
AS

WITH cte AS
(
	SELECT 		
		--flag all siblings (same parent/child/recombine level) if partial invoiced so we don't count any of them
		partial_invoiced_sibling = MAX(partial_invoice) OVER (PARTITION BY MSTRNUMB, SOPTYPE, is_parent, is_child, is_recombine),
		* 
	FROM 
	(
		SELECT	
			is_parent = CASE WHEN doc.SOPTYPE <> doc.ORIGTYPE THEN 1 ELSE 0 END,
			is_child = CASE WHEN doc.SOPTYPE = doc.ORIGTYPE AND comb.SOPNUMBE IS NULL THEN 1 ELSE 0 END,
			is_recombine = CASE WHEN comb.SOPNUMBE IS NOT NULL THEN 1 ELSE 0 END,
			comb.latest_combine,
			trx.transferred, 
			trx.transfer_date,
			trx.transfer_doc_num,
			trx.transfer_doc_type,
			trx.partial_invoice,
			trx.split,
			trx.true_void,
			doc.*
		FROM SOPJOIN AS doc
		JOIN SOP_Transfers AS trx
			ON doc.SOPNUMBE = trx.SOPNUMBE
			AND doc.SOPTYPE = trx.SOPTYPE
		LEFT JOIN SOP_Recombine AS comb
			ON doc.SOPNUMBE = comb.SOPNUMBE
			AND doc.SOPTYPE = comb.SOPTYPE
	) AS a
)

SELECT 
	value_priority = DENSE_RANK() OVER (PARTITION BY MSTRNUMB, SOPTYPE ORDER BY 
		CASE
			WHEN partial_invoiced_sibling = 1 AND is_parent = 1 THEN 1	--if parent has been partial invoiced, parent will be moved to history as is and can be counted for value
			WHEN partial_invoiced_sibling = 1 OR partial_invoiced_parent = 1 THEN 99	--if any other sibling or parent is partial invoiced, priority should be last, since qtys / lines will be changed and won't have original value
			WHEN is_recombine = 1 AND latest_combine = 1 THEN 2		--if no partial invoicing, count any final recombines first
			WHEN is_child = 1 THEN 3			--then children
			WHEN is_parent = 1 THEN 4			--lastly parents
			ELSE 9		-- *shrug* in case of anything else
		END)
	--,earliest_doc_date = MIN(CASE WHEN SOPTYPE = 3 AND PSTGSTUS = 2 THEN GLPOSTDT ELSE DOCDATE END) OVER (PARTITION BY MSTRNUMB, SOPTYPE)
	--TODO: should returns do the same?
	,doc_date = CASE WHEN SOPTYPE = 3 AND PSTGSTUS = 2 THEN GLPOSTDT ELSE DOCDATE END
	,*
	FROM
	(
		SELECT 
			--I don't like this, but unsure how to improve at the moment.  I think this is the worst hit to performance for this view...
			--Need to look at parents (parent for child, both for recombine), and if any are partial invoiced then we can't count the children either
			partial_invoiced_parent = CASE
				WHEN is_recombine = 1 AND EXISTS (SELECT 1 FROM cte AS child WHERE main.MSTRNUMB = child.MSTRNUMB AND main.SOPTYPE = child.SOPTYPE AND ((child.is_child = 1 AND child.partial_invoice = 1) OR (child.is_parent = 1 AND child.partial_invoice = 1))) THEN 1
				WHEN is_child = 1 AND EXISTS (SELECT 1 FROM cte AS child WHERE main.MSTRNUMB = child.MSTRNUMB AND main.SOPTYPE = child.SOPTYPE AND ((child.is_parent = 1 AND child.partial_invoice = 1))) THEN 1
				ELSE 0 
			END,
			* 
		FROM cte AS main
	) AS b
	
GO

--SELECT SOPNUMBE, SUBTOTAL, VOIDSTTS, SOURCE, * FROM SOPVIEW_SalesPad
--WHERE MSTRNUMB = 735
--SELECT SOPNUMBE, SUBTOTAL, VOIDSTTS, SOURCE, * FROM SOPVIEW_SalesPad
--WHERE MSTRNUMB = 733
--SELECT SOPNUMBE, SUBTOTAL, VOIDSTTS, SOURCE, * FROM SOPVIEW_SalesPad
--WHERE MSTRNUMB = 726