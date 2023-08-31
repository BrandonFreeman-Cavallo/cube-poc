USE Ingest;

CREATE MATERIALIZED VIEW SOP_Transfers
DISTRIBUTED BY HASH(MSTRNUMB, SOPNUMBE, SOPTYPE, DOCDATE)
REFRESH ASYNC
AS
SELECT 
	parent.MSTRNUMB,
	parent.SOPNUMBE,
	parent.SOPTYPE,
	parent.DOCDATE,
	--doc is listed as a child of a type greater than itself
	CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN 1 ELSE 0 END AS `transferred`,	
	--mins in case there are more than one - take the first
	CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.DOCDATE) END AS `transfer_date`,
	CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.SOPNUMBE) END AS `transfer_doc_num`,
	CASE WHEN MAX(child.SOPTYPE) > parent.SOPTYPE THEN MIN(child.SOPTYPE) END AS `transfer_doc_type`,
	--doc is listed as a child of a type greater than itself AND a type the same as itself
	CASE WHEN MIN(child.SOPTYPE) = parent.SOPTYPE AND MAX(child.SOPTYPE) > parent.SOPTYPE THEN 1 ELSE 0 END AS `partial_invoice`,
	--doc is ONLY listed as a child of types the same as itself
	CASE WHEN MAX(child.SOPTYPE) = parent.SOPTYPE THEN 1 ELSE 0 END AS `split`,
	--if voided and no children exist, it is a "true" void
	--note that partial invoicing a split sets ORIGNUMB to itself :/ so if all splits are partial invoiced, this could be a false positive on the parent doc
	CASE WHEN parent.VOIDSTTS = 1 AND MAX(child.SOPNUMBE) IS NULL THEN 1 ELSE 0 END AS `true_void`
FROM SOPJOIN AS parent
LEFT JOIN SOPJOIN AS child
	ON parent.SOPNUMBE = child.ORIGNUMB
	AND parent.SOPTYPE = child.ORIGTYPE
GROUP BY parent.SOPNUMBE, parent.SOPTYPE, parent.MSTRNUMB, parent.DOCDATE, parent.VOIDSTTS