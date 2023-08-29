USE [Ingest]

IF OBJECT_ID('dbo.SOP_Transfers', 'V') IS NOT NULL
    DROP VIEW dbo.SOP_Transfers
GO

CREATE VIEW SOP_Transfers
AS
SELECT 
	parent.MSTRNUMB,
	parent.SOPNUMBE,
	parent.SOPTYPE,
	parent.DOCDATE,
	--doc is listed as a child of a type greater than itself
	transferred = CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN 1 ELSE 0 END,	
	--mins in case there are more than one - take the first
	transfer_date = CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.DOCDATE) END,
	transfer_doc_num = CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.SOPNUMBE) END,
	transfer_doc_type = CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.SOPTYPE) END,
	--doc is listed as a child of a type greater than itself AND a type the same as itself
	partial_invoice = CASE WHEN MIN(child.SOPTYPE) = parent.SOPTYPE AND MAX(child.SOPTYPE) > parent.SOPTYPE THEN 1 ELSE 0 END,
	--doc is ONLY listed as a child of types the same as itself
	split = CASE WHEN MAX(child.SOPTYPE) = parent.SOPTYPE THEN 1 ELSE 0 END,
	--if voided and no children exist, it is a "true" void
	--note that partial invoicing a split sets ORIGNUMB to itself :/ so if all splits are partial invoiced, this could be a false positive on the parent doc
	true_void = CASE WHEN parent.VOIDSTTS = 1 AND MAX(child.SOPNUMBE) IS NULL THEN 1 ELSE 0 END
FROM SOPJOIN AS parent
LEFT JOIN SOPJOIN AS child
	ON parent.SOPNUMBE = child.ORIGNUMB
	AND parent.SOPTYPE = child.ORIGTYPE
GROUP BY parent.SOPNUMBE, parent.SOPTYPE, parent.MSTRNUMB, parent.DOCDATE, parent.VOIDSTTS