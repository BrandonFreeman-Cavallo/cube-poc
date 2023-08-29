USE [Ingest]

IF OBJECT_ID('dbo.SOP_Recombine', 'V') IS NOT NULL
    DROP VIEW dbo.SOP_Recombine
GO

CREATE VIEW SOP_Recombine
AS
	-- Sidenote: the value ORIGNUMB on recombined docs appears to just be copied from the originating doc, so this value isn't accurate
	-- I'm not sure how we could improve on this anyways since there are multiple ORIG docs
	SELECT 
		SOPNUMBE = lineComp.Sales_Doc_Num
		,sdt.SOPTYPE
		-- latest_combine means the document is not used in any other recombines
		,latest_combine = CASE WHEN MAX(ISNULL(multipleRecombines.Sales_Doc_Num, '')) <> '' THEN 0 ELSE 1 END
	FROM spSalesLineItem AS lineComp

	JOIN spvSalesDocType AS sdt
		ON lineComp.Sales_Doc_Type = sdt.Sales_Doc_Type
	JOIN SOPJOIN AS doc						--Join to doc to get MasterNum for below check
		ON doc.SOPNUMBE = lineComp.Sales_Doc_Num
		AND doc.SOPTYPE = sdt.SOPTYPE
			
	-- If any line has a non-empty Combined_From value, it should mean the document was recombined.
	-- Note that COPYING a recombined document does not appear to clear these fields, so some false positives are possible.
	--	To handle this, we join the SOP table back to the Combined_From doc (with same docType) 
	--	and check if the master number is the same, else ignore the Combined_From value.
	-- By using JOIN instead of LEFT JOIN, we clear out any records that don't match up
	JOIN SOPJOIN AS fromDoc
		ON fromDoc.SOPNUMBE = lineComp.Combined_From
		AND fromDoc.SOPTYPE = sdt.SOPTYPE	--Should have same DocType to be valid
		AND fromDoc.MSTRNUMB = doc.MSTRNUMB	--Should have same MasterNum to be valid

	-- In order to handle multiple recombines, we join back to companion table 
	--  and check if the recombined document is listed as the source of any other recombined docs.
	LEFT JOIN spSalesLineItem AS multipleRecombines
		ON lineComp.Sales_Doc_Num = multipleRecombines.Combined_From
		AND lineComp.Sales_Doc_Type = multipleRecombines.Sales_Doc_Type

	GROUP BY lineComp.Sales_Doc_Num, sdt.SOPTYPE, multipleRecombines.Sales_Doc_Num