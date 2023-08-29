DECLARE @beginDate DATETIME = '2020-07-19'
DECLARE @endDate DATETIME = '2030-07-19'
DECLARE @useStandardCost BIT = 0
DECLARE @customCostUDF VARCHAR(100) = ''--'xSpecialCost'

DECLARE @dynDB VARCHAR(24) = (SELECT TOP 1 RTRIM(DBNAME) FROM SY00100(NOLOCK))
DECLARE @sql NVARCHAR(MAX) = '
SELECT --doc.CUSTNMBR,
	COGS = SUM(
		--Make returns negative
		CASE WHEN doc.SOPTYPE = 4 THEN -1 ELSE 1 END *
		CASE
		--UDF Cost
		WHEN @customCostUDF <> '''' THEN ' + 
			CASE WHEN @customCostUDF <> '' THEN 'spx.'+@customCostUDF ELSE '0' END + ' * CASE
				WHEN doc.SOPTYPE = 4 THEN sli.QUANTITY ELSE sli.QTYREMAI
			END
		--Standard Cost
		WHEN @useStandardCost = 1 THEN CASE
			WHEN sli.NONINVEN = 1 THEN CASE doc.SOPTYPE	--Extended Cost
				WHEN 4 THEN ROUND(ISNULL(sli.UNITCOST * sli.QUANTITY, sli.EXTDCOST), ISNULL(mc.DECPLCUR -1, sysCurr.DECPLCUR -1))
						ELSE ROUND(ISNULL(sli.UNITCOST * sli.QTYREMAI, sli.EXTDCOST), ISNULL(mc.DECPLCUR -1, sysCurr.DECPLCUR -1))
			END
			ELSE im.STNDCOST * sli.QTYBSUOM * CASE WHEN doc.SOPTYPE = 4 THEN sli.QUANTITY ELSE sli.QTYREMAI
			END
		END
		--Current Cost
		ELSE CASE
			WHEN doc.SOPTYPE = 4 AND im.ITEMTYPE IN (4,5,6) THEN 0	--Services, Flat Fee, Misc Charges don''t get cost for returns
			WHEN doc.SOPTYPE = 4 AND im.ITEMTYPE = 3 THEN 0	--kit item is ignored, component lines evaluated below
			WHEN doc.SOPTYPE = 4 AND sli.CMPNTSEQ > 0 THEN CASE	--Kit component handling for Returns
				WHEN im.ITEMTYPE IN (4,5,6) THEN 0	--Services, Flat Fee, Misc Charges don''t get cost for kit components
				WHEN im.VCTNMTHD IN (4,5) THEN	--Valuation method - FIFO/LIFO PERIODIC
					--These component values are also rounded by kit (parent) line Currency_Dec, but we don''t have easy access to that here
					 im.STNDCOST * sli.QTYBSUOM * CASE WHEN doc.SOPTYPE = 4 THEN sli.QUANTITY ELSE sli.QTYREMAI END
				ELSE im.CURRCOST * sli.QTYBSUOM * CASE WHEN doc.SOPTYPE = 4 THEN sli.QUANTITY ELSE sli.QTYREMAI END
			END
			ELSE CASE doc.SOPTYPE	--Extended Cost
				WHEN 4 THEN ROUND(ISNULL(sli.UNITCOST * sli.QUANTITY, sli.EXTDCOST), ISNULL(mc.DECPLCUR -1, sysCurr.DECPLCUR -1))
						ELSE ROUND(ISNULL(sli.UNITCOST * sli.QTYREMAI, sli.EXTDCOST), ISNULL(mc.DECPLCUR -1, sysCurr.DECPLCUR -1))
			END
		END
	END)
FROM SOPVIEW_SalesPad AS doc
LEFT JOIN SOPLINEJOIN AS sli
    ON doc.SOPNUMBE = sli.SOPNUMBE
	AND doc.SOPTYPE = sli.SOPTYPE
LEFT JOIN spvSalesDocType AS sdt
	ON doc.SOPTYPE = sdt.SOPTYPE
LEFT JOIN spxSalesLineItem AS spx
	ON spx.Sales_Doc_Num = sli.SOPNUMBE
	AND spx.Sales_Doc_Type = sdt.Sales_Doc_Type
	AND spx.Line_Num = sli.LNITMSEQ
	AND spx.Component_Seq_Num = sli.CMPNTSEQ
LEFT JOIN IV00101 as im
	ON sli.ITEMNMBR = im.ITEMNMBR
LEFT JOIN ' + @dynDB + '..MC40200 AS mc
	ON mc.CURRNIDX = sli.CURRNIDX
OUTER APPLY (
    SELECT DECPLCUR = isnull((
                SELECT TOP 1 DECPLCUR
                FROM ' + @dynDB + '..MC40200 AS a(NOLOCK)
                JOIN MC40000 AS b(NOLOCK) ON a.CURNCYID = b.FUNLCURR
                ), 3)
    ) AS sysCurr
WHERE doc.true_void = 0
AND doc.SOPTYPE IN (3)
--AND PSTGSTUS = 2 
AND SOURCE = ''SOP30200''
AND sli.CMPNTSEQ = 0
AND doc.value_priority = 1
AND doc.doc_date BETWEEN @beginDate AND @endDate
--GROUP BY doc.CUSTNMBR'

--PRINT @sql

DECLARE @params NVARCHAR(100) = '@useStandardCost BIT, @customCostUDF VARCHAR(100), @beginDate DATETIME, @endDate DATETIME'
EXEC sp_executeSQL @sql, @params, @useStandardCost, @customCostUDF, @beginDate, @endDate

--SELECT im.STNDCOST * sli.QTYREMAI, doc.MSTRNUMB, doc.SOPNUMBE, sli.ITEMNMBR, sli.EXTDCOST, doc.true_void, doc.VOIDSTTS, im.STNDCOST, im.CURRCOST, sli.QTYREMAI, *
--FROM SOPVIEW_SalesPad AS doc
--LEFT JOIN SOPLINEJOIN AS sli
--    ON doc.SOPNUMBE = sli.SOPNUMBE
--    AND doc.SOPTYPE = sli.SOPTYPE
--LEFT JOIN IV00101 as im
--	ON sli.ITEMNMBR = im.ITEMNMBR
--WHERE doc.true_void = 0
--AND doc.SOPTYPE = 2
--AND doc.value_priority = 1
--AND doc.doc_date BETWEEN @beginDate AND @endDate
