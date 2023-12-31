-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: Ingest
-- Source Schemata: Ingest
-- Created: Wed Aug 30 17:43:42 2023
-- Workbench Version: 8.0.20
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema Ingest
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `Ingest` ;
CREATE SCHEMA IF NOT EXISTS `Ingest` ;

-- ----------------------------------------------------------------------------
-- Table Ingest.SY00100
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`SY00100` (
  `CMPANYID` SMALLINT NOT NULL,
  `DBNAME` CHAR(11) NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (`CMPANYID`)
  DISTRIBUTED BY HASH (`CMPANYID`) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");
;

-- ----------------------------------------------------------------------------
-- Table Ingest.SOP30200
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`SOP30200` (
	id BIGINT NOT NULL AUTO_INCREMENT,
  `SOPTYPE` SMALLINT NOT NULL,
  `SOPNUMBE` CHAR(21) NOT NULL,
  `ORIGTYPE` SMALLINT NOT NULL,
  `ORIGNUMB` CHAR(21) NOT NULL,
  `DOCID` CHAR(15) NOT NULL,
  `DOCDATE` DATETIME NOT NULL,
  `GLPOSTDT` DATETIME NOT NULL,
  `QUOTEDAT` DATETIME NOT NULL,
  `QUOEXPDA` DATETIME NOT NULL,
  `ORDRDATE` DATETIME NOT NULL,
  `INVODATE` DATETIME NOT NULL,
  `BACKDATE` DATETIME NOT NULL,
  `RETUDATE` DATETIME NOT NULL,
  `ReqShipDate` DATETIME NOT NULL,
  `FUFILDAT` DATETIME NOT NULL,
  `ACTLSHIP` DATETIME NOT NULL,
  `DISCDATE` DATETIME NOT NULL,
  `DUEDATE` DATETIME NOT NULL,
  `REPTING` TINYINT NOT NULL,
  `TRXFREQU` SMALLINT NOT NULL,
  `TIMEREPD` SMALLINT NOT NULL,
  `TIMETREP` SMALLINT NOT NULL,
  `DYSTINCR` SMALLINT NOT NULL,
  `DTLSTREP` DATETIME NOT NULL,
  `DSTBTCH1` CHAR(15) NOT NULL,
  `DSTBTCH2` CHAR(15) NOT NULL,
  `USDOCID1` CHAR(15) NOT NULL,
  `USDOCID2` CHAR(15) NOT NULL,
  `DISCFRGT` DECIMAL(19,5) NOT NULL,
  `ORDAVFRT` DECIMAL(19,5) NOT NULL,
  `DISCMISC` DECIMAL(19,5) NOT NULL,
  `ORDAVMSC` DECIMAL(19,5) NOT NULL,
  `DISAVAMT` DECIMAL(19,5) NOT NULL,
  `ORDAVAMT` DECIMAL(19,5) NOT NULL,
  `DISCRTND` DECIMAL(19,5) NOT NULL,
  `ORDISRTD` DECIMAL(19,5) NOT NULL,
  `DISTKNAM` DECIMAL(19,5) NOT NULL,
  `ORDISTKN` DECIMAL(19,5) NOT NULL,
  `DSCPCTAM` SMALLINT NOT NULL,
  `DSCDLRAM` DECIMAL(19,5) NOT NULL,
  `ORDDLRAT` DECIMAL(19,5) NOT NULL,
  `DISAVTKN` DECIMAL(19,5) NOT NULL,
  `ORDATKN` DECIMAL(19,5) NOT NULL,
  `PYMTRMID` CHAR(21) NOT NULL,
  `PRCLEVEL` CHAR(11) NOT NULL,
  `LOCNCODE` CHAR(11) NOT NULL,
  `BCHSOURC` CHAR(15) NOT NULL,
  `BACHNUMB` CHAR(15) NOT NULL,
  `CUSTNMBR` CHAR(15) NOT NULL,
  `CUSTNAME` CHAR(65) NOT NULL,
  `CSTPONBR` CHAR(21) NOT NULL,
  `PROSPECT` SMALLINT NOT NULL,
  `MSTRNUMB` INT NOT NULL,
  `PCKSLPNO` CHAR(21) NOT NULL,
  `PICTICNU` CHAR(21) NOT NULL,
  `MRKDNAMT` DECIMAL(19,5) NOT NULL,
  `ORMRKDAM` DECIMAL(19,5) NOT NULL,
  `PRBTADCD` CHAR(15) NOT NULL,
  `PRSTADCD` CHAR(15) NOT NULL,
  `CNTCPRSN` CHAR(61) NOT NULL,
  `ShipToName` CHAR(65) NOT NULL,
  `ADDRESS1` CHAR(61) NOT NULL,
  `ADDRESS2` CHAR(61) NOT NULL,
  `ADDRESS3` CHAR(61) NOT NULL,
  `CITY` CHAR(35) NOT NULL,
  `STATE` CHAR(29) NOT NULL,
  `ZIPCODE` CHAR(11) NOT NULL,
  `CCode` CHAR(7) NOT NULL,
  `COUNTRY` CHAR(61) NOT NULL,
  `PHNUMBR1` CHAR(21) NOT NULL,
  `PHNUMBR2` CHAR(21) NOT NULL,
  `PHONE3` CHAR(21) NOT NULL,
  `FAXNUMBR` CHAR(21) NOT NULL,
  `COMAPPTO` SMALLINT NOT NULL,
  `COMMAMNT` DECIMAL(19,5) NOT NULL,
  `OCOMMAMT` DECIMAL(19,5) NOT NULL,
  `CMMSLAMT` DECIMAL(19,5) NOT NULL,
  `ORCOSAMT` DECIMAL(19,5) NOT NULL,
  `NCOMAMNT` DECIMAL(19,5) NOT NULL,
  `ORNCMAMT` DECIMAL(19,5) NOT NULL,
  `SHIPMTHD` CHAR(15) NOT NULL,
  `TRDISAMT` DECIMAL(19,5) NOT NULL,
  `ORTDISAM` DECIMAL(19,5) NOT NULL,
  `TRDISPCT` SMALLINT NOT NULL,
  `SUBTOTAL` DECIMAL(19,5) NOT NULL,
  `ORSUBTOT` DECIMAL(19,5) NOT NULL,
  `REMSUBTO` DECIMAL(19,5) NOT NULL,
  `OREMSUBT` DECIMAL(19,5) NOT NULL,
  `EXTDCOST` DECIMAL(19,5) NOT NULL,
  `OREXTCST` DECIMAL(19,5) NOT NULL,
  `FRTAMNT` DECIMAL(19,5) NOT NULL,
  `ORFRTAMT` DECIMAL(19,5) NOT NULL,
  `MISCAMNT` DECIMAL(19,5) NOT NULL,
  `ORMISCAMT` DECIMAL(19,5) NOT NULL,
  `TXENGCLD` TINYINT NOT NULL,
  `TAXEXMT1` CHAR(25) NOT NULL,
  `TAXEXMT2` CHAR(25) NOT NULL,
  `TXRGNNUM` CHAR(25) NOT NULL,
  `TAXSCHID` CHAR(15) NOT NULL,
  `TXSCHSRC` SMALLINT NOT NULL,
  `BSIVCTTL` TINYINT NOT NULL,
  `FRTSCHID` CHAR(15) NOT NULL,
  `FRTTXAMT` DECIMAL(19,5) NOT NULL,
  `ORFRTTAX` DECIMAL(19,5) NOT NULL,
  `FRGTTXBL` SMALLINT NOT NULL,
  `MSCSCHID` CHAR(15) NOT NULL,
  `MSCTXAMT` DECIMAL(19,5) NOT NULL,
  `ORMSCTAX` DECIMAL(19,5) NOT NULL,
  `MISCTXBL` SMALLINT NOT NULL,
  `BKTFRTAM` DECIMAL(19,5) NOT NULL,
  `ORBKTFRT` DECIMAL(19,5) NOT NULL,
  `BKTMSCAM` DECIMAL(19,5) NOT NULL,
  `ORBKTMSC` DECIMAL(19,5) NOT NULL,
  `BCKTXAMT` DECIMAL(19,5) NOT NULL,
  `OBTAXAMT` DECIMAL(19,5) NOT NULL,
  `TXBTXAMT` DECIMAL(19,5) NOT NULL,
  `OTAXTAMT` DECIMAL(19,5) NOT NULL,
  `TAXAMNT` DECIMAL(19,5) NOT NULL,
  `ORTAXAMT` DECIMAL(19,5) NOT NULL,
  `ECTRX` TINYINT NOT NULL,
  `DOCAMNT` DECIMAL(19,5) NOT NULL,
  `ORDOCAMT` DECIMAL(19,5) NOT NULL,
  `PYMTRCVD` DECIMAL(19,5) NOT NULL,
  `ORPMTRVD` DECIMAL(19,5) NOT NULL,
  `DEPRECVD` DECIMAL(19,5) NOT NULL,
  `ORDEPRVD` DECIMAL(19,5) NOT NULL,
  `CODAMNT` DECIMAL(19,5) NOT NULL,
  `ORCODAMT` DECIMAL(19,5) NOT NULL,
  `ACCTAMNT` DECIMAL(19,5) NOT NULL,
  `ORACTAMT` DECIMAL(19,5) NOT NULL,
  `SALSTERR` CHAR(15) NOT NULL,
  `SLPRSNID` CHAR(15) NOT NULL,
  `UPSZONE` CHAR(3) NOT NULL,
  `TIMESPRT` SMALLINT NOT NULL,
  `PSTGSTUS` SMALLINT NOT NULL,
  `VOIDSTTS` SMALLINT NOT NULL,
  `ALLOCABY` SMALLINT NOT NULL,
  `NOTEINDX` DECIMAL(19,5) NOT NULL,
  `CURNCYID` CHAR(15) NOT NULL,
  `CURRNIDX` SMALLINT NOT NULL,
  `RATETPID` CHAR(15) NOT NULL,
  `EXGTBLID` CHAR(15) NOT NULL,
  `XCHGRATE` DECIMAL(19,7) NOT NULL,
  `DENXRATE` DECIMAL(19,7) NOT NULL,
  `EXCHDATE` DATETIME NOT NULL,
  `TIME1` DATETIME NOT NULL,
  `RTCLCMTD` SMALLINT NOT NULL,
  `MCTRXSTT` SMALLINT NOT NULL,
  `TRXSORCE` CHAR(13) NOT NULL,
  `SOPHDRE1` BINARY(4) NOT NULL,
  `SOPHDRE2` BINARY(4) NOT NULL,
  `SOPLNERR` BINARY(4) NOT NULL,
  `SOPHDRFL` BINARY(4) NOT NULL,
  `COMMNTID` CHAR(15) NOT NULL,
  `REFRENCE` CHAR(31) NOT NULL,
  `POSTEDDT` DATETIME NOT NULL,
  `PTDUSRID` CHAR(15) NOT NULL,
  `USER2ENT` CHAR(15) NOT NULL,
  `CREATDDT` DATETIME NOT NULL,
  `MODIFDT` DATETIME NOT NULL,
  `Tax_Date` DATETIME NOT NULL,
  `APLYWITH` TINYINT NOT NULL,
  `WITHHAMT` DECIMAL(19,5) NOT NULL,
  `SHPPGDOC` TINYINT NOT NULL,
  `CORRCTN` TINYINT NOT NULL,
  `SIMPLIFD` TINYINT NOT NULL,
  `DOCNCORR` CHAR(21) NOT NULL,
  `SEQNCORR` SMALLINT NOT NULL,
  `SALEDATE` DATETIME NOT NULL,
  `EXCEPTIONALDEMAND` TINYINT NOT NULL,
  `Flags` SMALLINT NOT NULL,
  `SOPSTATUS` SMALLINT NOT NULL,
  `SHIPCOMPLETE` TINYINT NOT NULL,
  `DIRECTDEBIT` TINYINT NOT NULL,
  `WorkflowApprStatCreditLm` SMALLINT NOT NULL,
  `WorkflowPriorityCreditLm` SMALLINT NOT NULL,
  `WorkflowApprStatusQuote` SMALLINT NOT NULL,
  `WorkflowPriorityQuote` SMALLINT NOT NULL,
  `Workflow_Status` SMALLINT NOT NULL,
  `ContractExchangeRateStat` SMALLINT NOT NULL,
  `Print_Phone_NumberGB` SMALLINT NOT NULL,
  `DEX_ROW_TS` DATETIME NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.IV00101
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`IV00101` (
  id BIGINT NOT NULL AUTO_INCREMENT, 
  `ITEMNMBR` CHAR(31) NOT NULL,
  `ITEMDESC` CHAR(101) NOT NULL,
  `NOTEINDX` DECIMAL(19,5) NOT NULL,
  `ITMSHNAM` CHAR(15) NOT NULL,
  `ITEMTYPE` SMALLINT NOT NULL,
  `ITMGEDSC` CHAR(11) NOT NULL,
  `STNDCOST` DECIMAL(19,5) NOT NULL,
  `CURRCOST` DECIMAL(19,5) NOT NULL,
  `ITEMSHWT` INT NOT NULL,
  `DECPLQTY` SMALLINT NOT NULL,
  `DECPLCUR` SMALLINT NOT NULL,
  `ITMTSHID` CHAR(15) NOT NULL,
  `TAXOPTNS` SMALLINT NOT NULL,
  `IVIVINDX` INT NOT NULL,
  `IVIVOFIX` INT NOT NULL,
  `IVCOGSIX` INT NOT NULL,
  `IVSLSIDX` INT NOT NULL,
  `IVSLDSIX` INT NOT NULL,
  `IVSLRNIX` INT NOT NULL,
  `IVINUSIX` INT NOT NULL,
  `IVINSVIX` INT NOT NULL,
  `IVDMGIDX` INT NOT NULL,
  `IVVARIDX` INT NOT NULL,
  `DPSHPIDX` INT NOT NULL,
  `PURPVIDX` INT NOT NULL,
  `UPPVIDX` INT NOT NULL,
  `IVRETIDX` INT NOT NULL,
  `ASMVRIDX` INT NOT NULL,
  `ITMCLSCD` CHAR(11) NOT NULL,
  `ITMTRKOP` SMALLINT NOT NULL,
  `LOTTYPE` CHAR(11) NOT NULL,
  `KPERHIST` TINYINT NOT NULL,
  `KPTRXHST` TINYINT NOT NULL,
  `KPCALHST` TINYINT NOT NULL,
  `KPDSTHST` TINYINT NOT NULL,
  `ALWBKORD` TINYINT NOT NULL,
  `VCTNMTHD` SMALLINT NOT NULL,
  `UOMSCHDL` CHAR(11) NOT NULL,
  `ALTITEM1` CHAR(31) NOT NULL,
  `ALTITEM2` CHAR(31) NOT NULL,
  `USCATVLS_1` CHAR(11) NOT NULL,
  `USCATVLS_2` CHAR(11) NOT NULL,
  `USCATVLS_3` CHAR(11) NOT NULL,
  `USCATVLS_4` CHAR(11) NOT NULL,
  `USCATVLS_5` CHAR(11) NOT NULL,
  `USCATVLS_6` CHAR(11) NOT NULL,
  `MSTRCDTY` SMALLINT NOT NULL,
  `MODIFDT` DATETIME NOT NULL,
  `CREATDDT` DATETIME NOT NULL,
  `WRNTYDYS` SMALLINT NOT NULL,
  `PRCLEVEL` CHAR(11) NOT NULL,
  `LOCNCODE` CHAR(11) NOT NULL,
  `PINFLIDX` INT NOT NULL,
  `PURMCIDX` INT NOT NULL,
  `IVINFIDX` INT NOT NULL,
  `INVMCIDX` INT NOT NULL,
  `CGSINFLX` INT NOT NULL,
  `CGSMCIDX` INT NOT NULL,
  `ITEMCODE` CHAR(15) NOT NULL,
  `TCC` CHAR(31) NOT NULL,
  `PriceGroup` CHAR(11) NOT NULL,
  `PRICMTHD` SMALLINT NOT NULL,
  `PRCHSUOM` CHAR(9) NOT NULL,
  `SELNGUOM` CHAR(9) NOT NULL,
  `KTACCTSR` SMALLINT NOT NULL,
  `LASTGENSN` CHAR(21) NOT NULL,
  `ABCCODE` SMALLINT NOT NULL,
  `Revalue_Inventory` TINYINT NOT NULL,
  `Tolerance_Percentage` INT NOT NULL,
  `Purchase_Item_Tax_Schedu` CHAR(15) NOT NULL,
  `Purchase_Tax_Options` SMALLINT NOT NULL,
  `ITMPLNNNGTYP` SMALLINT NOT NULL,
  `STTSTCLVLPRCNTG` SMALLINT NOT NULL,
  `CNTRYORGN` CHAR(7) NOT NULL,
  `INACTIVE` TINYINT NOT NULL,
  `MINSHELF1` SMALLINT NOT NULL,
  `MINSHELF2` SMALLINT NOT NULL,
  `INCLUDEINDP` TINYINT NOT NULL,
  `LOTEXPWARN` TINYINT NOT NULL,
  `LOTEXPWARNDAYS` SMALLINT NOT NULL,
  `LASTGENLOT` CHAR(21) NOT NULL,
  `Lot_Split_Quantity` DECIMAL(19,5) NOT NULL,
  `UseQtyOverageTolerance` TINYINT NOT NULL,
  `UseQtyShortageTolerance` TINYINT NOT NULL,
  `QtyOverTolerancePercent` INT NOT NULL,
  `QtyShortTolerancePercent` INT NOT NULL,
  `IVSCRVIX` INT NOT NULL,
  `USERID` CHAR(15) NOT NULL,
  `DEX_ROW_TS` DATETIME NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.spSalesLineItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`spSalesLineItem` (
	id BIGINT NOT NULL AUTO_INCREMENT, 
  `Sales_Doc_Num` VARCHAR(21) NOT NULL,
  `Sales_Doc_Type` VARCHAR(15) NOT NULL,
  `Line_Num` INT NOT NULL,
  `Component_Seq_Num` INT NOT NULL,
  `Previous_Qty` DECIMAL(19,5) NOT NULL,
  `Previous_UofM` VARCHAR(15) NULL,
  `Price_Source` VARCHAR(30) NULL,
  `Qty_Unblocked` DECIMAL(19,5) NOT NULL,
  `Contract_Num` INT NOT NULL,
  `Contract_Detail_Num` INT NOT NULL,
  `Inventory_Account` VARCHAR(129) NULL,
  `Cost_Of_Sales_Account` VARCHAR(129) NULL,
  `Sales_Account` VARCHAR(129) NULL,
  `Markdowns_Account` VARCHAR(129) NULL,
  `Returns_Account` VARCHAR(129) NULL,
  `In_Use_Account` VARCHAR(129) NULL,
  `In_Service_Account` VARCHAR(129) NULL,
  `Damaged_Account` VARCHAR(129) NULL,
  `Assembly_Created` TINYINT(1) NULL,
  `Configuration_ID` INT NOT NULL,
  `Configuration_String_Code` VARCHAR(500) NULL,
  `Returned_From_Invoice` TINYINT(1) NULL,
  `Equipment_Item_Num` VARCHAR(31) NULL,
  `Equipment_Serial_Num` VARCHAR(21) NULL,
  `Item_Promo_ID` INT NOT NULL,
  `Is_Promo_Item` TINYINT(1) NULL,
  `Item_Promo_Type` INT NOT NULL,
  `EDI_Type` VARCHAR(10) NULL,
  `Restriction_Override_Code` VARCHAR(32) NULL,
  `Combined_From` VARCHAR(500) NULL,
  `Configuration_Flat_Fee` DECIMAL(19,5) NULL,
  `Alt_Sell_Type` VARCHAR(15) NULL,
  `External_ID` VARCHAR(50) NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.SOP30300
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`SOP30300` (
	id BIGINT NOT NULL AUTO_INCREMENT,
  `SOPTYPE` SMALLINT NOT NULL,
  `SOPNUMBE` CHAR(21) NOT NULL,
  `LNITMSEQ` INT NOT NULL,
  `CMPNTSEQ` INT NOT NULL,
  `ITEMNMBR` CHAR(31) NOT NULL,
  `ITEMDESC` CHAR(101) NOT NULL,
  `NONINVEN` SMALLINT NOT NULL,
  `DROPSHIP` SMALLINT NOT NULL,
  `UOFM` CHAR(9) NOT NULL,
  `LOCNCODE` CHAR(11) NOT NULL,
  `UNITCOST` DECIMAL(19,5) NOT NULL,
  `ORUNTCST` DECIMAL(19,5) NOT NULL,
  `UNITPRCE` DECIMAL(19,5) NOT NULL,
  `ORUNTPRC` DECIMAL(19,5) NOT NULL,
  `XTNDPRCE` DECIMAL(19,5) NOT NULL,
  `OXTNDPRC` DECIMAL(19,5) NOT NULL,
  `REMPRICE` DECIMAL(19,5) NOT NULL,
  `OREPRICE` DECIMAL(19,5) NOT NULL,
  `EXTDCOST` DECIMAL(19,5) NOT NULL,
  `OREXTCST` DECIMAL(19,5) NOT NULL,
  `MRKDNAMT` DECIMAL(19,5) NOT NULL,
  `ORMRKDAM` DECIMAL(19,5) NOT NULL,
  `MRKDNPCT` SMALLINT NOT NULL,
  `MRKDNTYP` SMALLINT NOT NULL,
  `INVINDX` INT NOT NULL,
  `CSLSINDX` INT NOT NULL,
  `SLSINDX` INT NOT NULL,
  `MKDNINDX` INT NOT NULL,
  `RTNSINDX` INT NOT NULL,
  `INUSINDX` INT NOT NULL,
  `INSRINDX` INT NOT NULL,
  `DMGDINDX` INT NOT NULL,
  `ITMTSHID` CHAR(15) NOT NULL,
  `IVITMTXB` SMALLINT NOT NULL,
  `BKTSLSAM` DECIMAL(19,5) NOT NULL,
  `ORBKTSLS` DECIMAL(19,5) NOT NULL,
  `TAXAMNT` DECIMAL(19,5) NOT NULL,
  `ORTAXAMT` DECIMAL(19,5) NOT NULL,
  `TXBTXAMT` DECIMAL(19,5) NOT NULL,
  `OTAXTAMT` DECIMAL(19,5) NOT NULL,
  `BSIVCTTL` TINYINT NOT NULL,
  `TRDISAMT` DECIMAL(19,5) NOT NULL,
  `ORTDISAM` DECIMAL(19,5) NOT NULL,
  `DISCSALE` DECIMAL(19,5) NOT NULL,
  `ORDAVSLS` DECIMAL(19,5) NOT NULL,
  `QUANTITY` DECIMAL(19,5) NOT NULL,
  `ATYALLOC` DECIMAL(19,5) NOT NULL,
  `QTYINSVC` DECIMAL(19,5) NOT NULL,
  `QTYINUSE` DECIMAL(19,5) NOT NULL,
  `QTYDMGED` DECIMAL(19,5) NOT NULL,
  `QTYRTRND` DECIMAL(19,5) NOT NULL,
  `QTYONHND` DECIMAL(19,5) NOT NULL,
  `QTYCANCE` DECIMAL(19,5) NOT NULL,
  `QTYCANOT` DECIMAL(19,5) NOT NULL,
  `QTYORDER` DECIMAL(19,5) NOT NULL,
  `QTYPRBAC` DECIMAL(19,5) NOT NULL,
  `QTYPRBOO` DECIMAL(19,5) NOT NULL,
  `QTYPRINV` DECIMAL(19,5) NOT NULL,
  `QTYPRORD` DECIMAL(19,5) NOT NULL,
  `QTYPRVRECVD` DECIMAL(19,5) NOT NULL,
  `QTYRECVD` DECIMAL(19,5) NOT NULL,
  `QTYREMAI` DECIMAL(19,5) NOT NULL,
  `QTYREMBO` DECIMAL(19,5) NOT NULL,
  `QTYTBAOR` DECIMAL(19,5) NOT NULL,
  `QTYTOINV` DECIMAL(19,5) NOT NULL,
  `QTYTORDR` DECIMAL(19,5) NOT NULL,
  `QTYFULFI` DECIMAL(19,5) NOT NULL,
  `QTYSLCTD` DECIMAL(19,5) NOT NULL,
  `QTYBSUOM` DECIMAL(19,5) NOT NULL,
  `EXTQTYAL` DECIMAL(19,5) NOT NULL,
  `EXTQTYSEL` DECIMAL(19,5) NOT NULL,
  `ReqShipDate` DATETIME NOT NULL,
  `FUFILDAT` DATETIME NOT NULL,
  `ACTLSHIP` DATETIME NOT NULL,
  `SHIPMTHD` CHAR(15) NOT NULL,
  `SALSTERR` CHAR(15) NOT NULL,
  `SLPRSNID` CHAR(15) NOT NULL,
  `PRCLEVEL` CHAR(11) NOT NULL,
  `COMMNTID` CHAR(15) NOT NULL,
  `BRKFLD1` SMALLINT NOT NULL,
  `BRKFLD2` SMALLINT NOT NULL,
  `BRKFLD3` SMALLINT NOT NULL,
  `CURRNIDX` SMALLINT NOT NULL,
  `TRXSORCE` CHAR(13) NOT NULL,
  `SOPLNERR` BINARY(4) NOT NULL,
  `DOCNCORR` CHAR(21) NOT NULL,
  `ORGSEQNM` INT NOT NULL,
  `ITEMCODE` CHAR(15) NOT NULL,
  `PURCHSTAT` SMALLINT NOT NULL,
  `DECPLQTY` SMALLINT NOT NULL,
  `DECPLCUR` SMALLINT NOT NULL,
  `ODECPLCU` SMALLINT NOT NULL,
  `EXCEPTIONALDEMAND` TINYINT NOT NULL,
  `TAXSCHID` CHAR(15) NOT NULL,
  `TXSCHSRC` SMALLINT NOT NULL,
  `PRSTADCD` CHAR(15) NOT NULL,
  `ShipToName` CHAR(65) NOT NULL,
  `CNTCPRSN` CHAR(61) NOT NULL,
  `ADDRESS1` CHAR(61) NOT NULL,
  `ADDRESS2` CHAR(61) NOT NULL,
  `ADDRESS3` CHAR(61) NOT NULL,
  `CITY` CHAR(35) NOT NULL,
  `STATE` CHAR(29) NOT NULL,
  `ZIPCODE` CHAR(11) NOT NULL,
  `CCode` CHAR(7) NOT NULL,
  `COUNTRY` CHAR(61) NOT NULL,
  `PHONE1` CHAR(21) NOT NULL,
  `PHONE2` CHAR(21) NOT NULL,
  `PHONE3` CHAR(21) NOT NULL,
  `FAXNUMBR` CHAR(21) NOT NULL,
  `Flags` SMALLINT NOT NULL,
  `CONTNBR` CHAR(11) NOT NULL,
  `CONTLNSEQNBR` DECIMAL(19,5) NOT NULL,
  `CONTSTARTDTE` DATETIME NOT NULL,
  `CONTENDDTE` DATETIME NOT NULL,
  `CONTITEMNBR` CHAR(31) NOT NULL,
  `CONTSERIALNBR` CHAR(21) NOT NULL,
  `ISLINEINTRA` TINYINT NOT NULL,
  `Print_Phone_NumberGB` SMALLINT NOT NULL,
  `DEX_ROW_TS` DATETIME NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.SOP10100
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`SOP10100` (
	id BIGINT NOT NULL AUTO_INCREMENT,
  `SOPTYPE` SMALLINT NOT NULL,
  `SOPNUMBE` CHAR(21) NOT NULL,
  `ORIGTYPE` SMALLINT NOT NULL,
  `ORIGNUMB` CHAR(21) NOT NULL,
  `DOCID` CHAR(15) NOT NULL,
  `DOCDATE` DATETIME NOT NULL,
  `GLPOSTDT` DATETIME NOT NULL,
  `QUOTEDAT` DATETIME NOT NULL,
  `QUOEXPDA` DATETIME NOT NULL,
  `ORDRDATE` DATETIME NOT NULL,
  `INVODATE` DATETIME NOT NULL,
  `BACKDATE` DATETIME NOT NULL,
  `RETUDATE` DATETIME NOT NULL,
  `ReqShipDate` DATETIME NOT NULL,
  `FUFILDAT` DATETIME NOT NULL,
  `ACTLSHIP` DATETIME NOT NULL,
  `DISCDATE` DATETIME NOT NULL,
  `DUEDATE` DATETIME NOT NULL,
  `REPTING` TINYINT NOT NULL,
  `TRXFREQU` SMALLINT NOT NULL,
  `TIMEREPD` SMALLINT NOT NULL,
  `TIMETREP` SMALLINT NOT NULL,
  `DYSTINCR` SMALLINT NOT NULL,
  `DTLSTREP` DATETIME NOT NULL,
  `DSTBTCH1` CHAR(15) NOT NULL,
  `DSTBTCH2` CHAR(15) NOT NULL,
  `USDOCID1` CHAR(15) NOT NULL,
  `USDOCID2` CHAR(15) NOT NULL,
  `DISCFRGT` DECIMAL(19,5) NOT NULL,
  `ORDAVFRT` DECIMAL(19,5) NOT NULL,
  `DISCMISC` DECIMAL(19,5) NOT NULL,
  `ORDAVMSC` DECIMAL(19,5) NOT NULL,
  `DISAVAMT` DECIMAL(19,5) NOT NULL,
  `ORDAVAMT` DECIMAL(19,5) NOT NULL,
  `DISCRTND` DECIMAL(19,5) NOT NULL,
  `ORDISRTD` DECIMAL(19,5) NOT NULL,
  `DISTKNAM` DECIMAL(19,5) NOT NULL,
  `ORDISTKN` DECIMAL(19,5) NOT NULL,
  `DSCPCTAM` SMALLINT NOT NULL,
  `DSCDLRAM` DECIMAL(19,5) NOT NULL,
  `ORDDLRAT` DECIMAL(19,5) NOT NULL,
  `DISAVTKN` DECIMAL(19,5) NOT NULL,
  `ORDATKN` DECIMAL(19,5) NOT NULL,
  `PYMTRMID` CHAR(21) NOT NULL,
  `PRCLEVEL` CHAR(11) NOT NULL,
  `LOCNCODE` CHAR(11) NOT NULL,
  `BCHSOURC` CHAR(15) NOT NULL,
  `BACHNUMB` CHAR(15) NOT NULL,
  `CUSTNMBR` CHAR(15) NOT NULL,
  `CUSTNAME` CHAR(65) NOT NULL,
  `CSTPONBR` CHAR(21) NOT NULL,
  `PROSPECT` SMALLINT NOT NULL,
  `MSTRNUMB` INT NOT NULL,
  `PCKSLPNO` CHAR(21) NOT NULL,
  `PICTICNU` CHAR(21) NOT NULL,
  `MRKDNAMT` DECIMAL(19,5) NOT NULL,
  `ORMRKDAM` DECIMAL(19,5) NOT NULL,
  `PRBTADCD` CHAR(15) NOT NULL,
  `PRSTADCD` CHAR(15) NOT NULL,
  `CNTCPRSN` CHAR(61) NOT NULL,
  `ShipToName` CHAR(65) NOT NULL,
  `ADDRESS1` CHAR(61) NOT NULL,
  `ADDRESS2` CHAR(61) NOT NULL,
  `ADDRESS3` CHAR(61) NOT NULL,
  `CITY` CHAR(35) NOT NULL,
  `STATE` CHAR(29) NOT NULL,
  `ZIPCODE` CHAR(11) NOT NULL,
  `CCode` CHAR(7) NOT NULL,
  `COUNTRY` CHAR(61) NOT NULL,
  `PHNUMBR1` CHAR(21) NOT NULL,
  `PHNUMBR2` CHAR(21) NOT NULL,
  `PHONE3` CHAR(21) NOT NULL,
  `FAXNUMBR` CHAR(21) NOT NULL,
  `COMAPPTO` SMALLINT NOT NULL,
  `COMMAMNT` DECIMAL(19,5) NOT NULL,
  `OCOMMAMT` DECIMAL(19,5) NOT NULL,
  `CMMSLAMT` DECIMAL(19,5) NOT NULL,
  `ORCOSAMT` DECIMAL(19,5) NOT NULL,
  `NCOMAMNT` DECIMAL(19,5) NOT NULL,
  `ORNCMAMT` DECIMAL(19,5) NOT NULL,
  `SHIPMTHD` CHAR(15) NOT NULL,
  `TRDISAMT` DECIMAL(19,5) NOT NULL,
  `ORTDISAM` DECIMAL(19,5) NOT NULL,
  `TRDISPCT` SMALLINT NOT NULL,
  `SUBTOTAL` DECIMAL(19,5) NOT NULL,
  `ORSUBTOT` DECIMAL(19,5) NOT NULL,
  `REMSUBTO` DECIMAL(19,5) NOT NULL,
  `OREMSUBT` DECIMAL(19,5) NOT NULL,
  `EXTDCOST` DECIMAL(19,5) NOT NULL,
  `OREXTCST` DECIMAL(19,5) NOT NULL,
  `FRTAMNT` DECIMAL(19,5) NOT NULL,
  `ORFRTAMT` DECIMAL(19,5) NOT NULL,
  `MISCAMNT` DECIMAL(19,5) NOT NULL,
  `ORMISCAMT` DECIMAL(19,5) NOT NULL,
  `TXENGCLD` TINYINT NOT NULL,
  `TAXEXMT1` CHAR(25) NOT NULL,
  `TAXEXMT2` CHAR(25) NOT NULL,
  `TXRGNNUM` CHAR(25) NOT NULL,
  `TAXSCHID` CHAR(15) NOT NULL,
  `TXSCHSRC` SMALLINT NOT NULL,
  `BSIVCTTL` TINYINT NOT NULL,
  `FRTSCHID` CHAR(15) NOT NULL,
  `FRTTXAMT` DECIMAL(19,5) NOT NULL,
  `ORFRTTAX` DECIMAL(19,5) NOT NULL,
  `FRGTTXBL` SMALLINT NOT NULL,
  `MSCSCHID` CHAR(15) NOT NULL,
  `MSCTXAMT` DECIMAL(19,5) NOT NULL,
  `ORMSCTAX` DECIMAL(19,5) NOT NULL,
  `MISCTXBL` SMALLINT NOT NULL,
  `BKTFRTAM` DECIMAL(19,5) NOT NULL,
  `ORBKTFRT` DECIMAL(19,5) NOT NULL,
  `BKTMSCAM` DECIMAL(19,5) NOT NULL,
  `ORBKTMSC` DECIMAL(19,5) NOT NULL,
  `BCKTXAMT` DECIMAL(19,5) NOT NULL,
  `OBTAXAMT` DECIMAL(19,5) NOT NULL,
  `TXBTXAMT` DECIMAL(19,5) NOT NULL,
  `OTAXTAMT` DECIMAL(19,5) NOT NULL,
  `TAXAMNT` DECIMAL(19,5) NOT NULL,
  `ORTAXAMT` DECIMAL(19,5) NOT NULL,
  `ECTRX` TINYINT NOT NULL,
  `DOCAMNT` DECIMAL(19,5) NOT NULL,
  `ORDOCAMT` DECIMAL(19,5) NOT NULL,
  `PYMTRCVD` DECIMAL(19,5) NOT NULL,
  `ORPMTRVD` DECIMAL(19,5) NOT NULL,
  `DEPRECVD` DECIMAL(19,5) NOT NULL,
  `ORDEPRVD` DECIMAL(19,5) NOT NULL,
  `CODAMNT` DECIMAL(19,5) NOT NULL,
  `ORCODAMT` DECIMAL(19,5) NOT NULL,
  `ACCTAMNT` DECIMAL(19,5) NOT NULL,
  `ORACTAMT` DECIMAL(19,5) NOT NULL,
  `SALSTERR` CHAR(15) NOT NULL,
  `SLPRSNID` CHAR(15) NOT NULL,
  `UPSZONE` CHAR(3) NOT NULL,
  `TIMESPRT` SMALLINT NOT NULL,
  `PSTGSTUS` SMALLINT NOT NULL,
  `VOIDSTTS` SMALLINT NOT NULL,
  `ALLOCABY` SMALLINT NOT NULL,
  `NOTEINDX` DECIMAL(19,5) NOT NULL,
  `CURNCYID` CHAR(15) NOT NULL,
  `CURRNIDX` SMALLINT NOT NULL,
  `RATETPID` CHAR(15) NOT NULL,
  `EXGTBLID` CHAR(15) NOT NULL,
  `XCHGRATE` DECIMAL(19,7) NOT NULL,
  `DENXRATE` DECIMAL(19,7) NOT NULL,
  `EXCHDATE` DATETIME NOT NULL,
  `TIME1` DATETIME NOT NULL,
  `RTCLCMTD` SMALLINT NOT NULL,
  `MCTRXSTT` SMALLINT NOT NULL,
  `TRXSORCE` CHAR(13) NOT NULL,
  `SOPHDRE1` BINARY(4) NOT NULL,
  `SOPHDRE2` BINARY(4) NOT NULL,
  `SOPLNERR` BINARY(4) NOT NULL,
  `SOPHDRFL` BINARY(4) NOT NULL,
  `SOPMCERR` BINARY(4) NOT NULL,
  `COMMNTID` CHAR(15) NOT NULL,
  `REFRENCE` CHAR(31) NOT NULL,
  `POSTEDDT` DATETIME NOT NULL,
  `PTDUSRID` CHAR(15) NOT NULL,
  `USER2ENT` CHAR(15) NOT NULL,
  `CREATDDT` DATETIME NOT NULL,
  `MODIFDT` DATETIME NOT NULL,
  `Tax_Date` DATETIME NOT NULL,
  `APLYWITH` TINYINT NOT NULL,
  `WITHHAMT` DECIMAL(19,5) NOT NULL,
  `SHPPGDOC` TINYINT NOT NULL,
  `CORRCTN` TINYINT NOT NULL,
  `SIMPLIFD` TINYINT NOT NULL,
  `CORRNXST` TINYINT NOT NULL,
  `DOCNCORR` CHAR(21) NOT NULL,
  `SEQNCORR` SMALLINT NOT NULL,
  `SALEDATE` DATETIME NOT NULL,
  `SOPHDRE3` BINARY(4) NOT NULL,
  `EXCEPTIONALDEMAND` TINYINT NOT NULL,
  `Flags` SMALLINT NOT NULL,
  `BackoutTradeDisc` DECIMAL(19,5) NOT NULL,
  `OrigBackoutTradeDisc` DECIMAL(19,5) NOT NULL,
  `GPSFOINTEGRATIONID` CHAR(31) NOT NULL,
  `INTEGRATIONSOURCE` SMALLINT NOT NULL,
  `INTEGRATIONID` CHAR(31) NOT NULL,
  `SOPSTATUS` SMALLINT NOT NULL,
  `SHIPCOMPLETE` TINYINT NOT NULL,
  `DIRECTDEBIT` TINYINT NOT NULL,
  `WorkflowApprStatCreditLm` SMALLINT NOT NULL,
  `WorkflowPriorityCreditLm` SMALLINT NOT NULL,
  `WorkflowApprStatusQuote` SMALLINT NOT NULL,
  `WorkflowPriorityQuote` SMALLINT NOT NULL,
  `Workflow_Status` SMALLINT NOT NULL,
  `ContractExchangeRateStat` SMALLINT NOT NULL,
  `Print_Phone_NumberGB` SMALLINT NOT NULL,
  `DEX_ROW_TS` DATETIME NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.spxSalesLineItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`spxSalesLineItem` (
  `Sales_Doc_Num` VARCHAR(21) NOT NULL,
  `Sales_Doc_Type` VARCHAR(15) NOT NULL,
  `Line_Num` INT NOT NULL,
  `Component_Seq_Num` INT NOT NULL)
  PRIMARY KEY (`Sales_Doc_Num`, `Sales_Doc_Type`, `Line_Num`, `Component_Seq_Num`)
  DISTRIBUTED BY HASH (`Sales_Doc_Num`, `Sales_Doc_Type`, `Line_Num`, `Component_Seq_Num`) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");

-- ----------------------------------------------------------------------------
-- Table Ingest.SOP10200
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingest`.`SOP10200` (
	id BIGINT NOT NULL AUTO_INCREMENT,
  `SOPTYPE` SMALLINT NOT NULL,
  `SOPNUMBE` CHAR(21) NOT NULL,
  `LNITMSEQ` INT NOT NULL,
  `CMPNTSEQ` INT NOT NULL,
  `ITEMNMBR` CHAR(31) NOT NULL,
  `ITEMDESC` CHAR(101) NOT NULL,
  `NONINVEN` SMALLINT NOT NULL,
  `DROPSHIP` SMALLINT NOT NULL,
  `UOFM` CHAR(9) NOT NULL,
  `LOCNCODE` CHAR(11) NOT NULL,
  `UNITCOST` DECIMAL(19,5) NOT NULL,
  `ORUNTCST` DECIMAL(19,5) NOT NULL,
  `UNITPRCE` DECIMAL(19,5) NOT NULL,
  `ORUNTPRC` DECIMAL(19,5) NOT NULL,
  `XTNDPRCE` DECIMAL(19,5) NOT NULL,
  `OXTNDPRC` DECIMAL(19,5) NOT NULL,
  `REMPRICE` DECIMAL(19,5) NOT NULL,
  `OREPRICE` DECIMAL(19,5) NOT NULL,
  `EXTDCOST` DECIMAL(19,5) NOT NULL,
  `OREXTCST` DECIMAL(19,5) NOT NULL,
  `MRKDNAMT` DECIMAL(19,5) NOT NULL,
  `ORMRKDAM` DECIMAL(19,5) NOT NULL,
  `MRKDNPCT` SMALLINT NOT NULL,
  `MRKDNTYP` SMALLINT NOT NULL,
  `INVINDX` INT NOT NULL,
  `CSLSINDX` INT NOT NULL,
  `SLSINDX` INT NOT NULL,
  `MKDNINDX` INT NOT NULL,
  `RTNSINDX` INT NOT NULL,
  `INUSINDX` INT NOT NULL,
  `INSRINDX` INT NOT NULL,
  `DMGDINDX` INT NOT NULL,
  `ITMTSHID` CHAR(15) NOT NULL,
  `IVITMTXB` SMALLINT NOT NULL,
  `BKTSLSAM` DECIMAL(19,5) NOT NULL,
  `ORBKTSLS` DECIMAL(19,5) NOT NULL,
  `TAXAMNT` DECIMAL(19,5) NOT NULL,
  `ORTAXAMT` DECIMAL(19,5) NOT NULL,
  `TXBTXAMT` DECIMAL(19,5) NOT NULL,
  `OTAXTAMT` DECIMAL(19,5) NOT NULL,
  `BSIVCTTL` TINYINT NOT NULL,
  `TRDISAMT` DECIMAL(19,5) NOT NULL,
  `ORTDISAM` DECIMAL(19,5) NOT NULL,
  `DISCSALE` DECIMAL(19,5) NOT NULL,
  `ORDAVSLS` DECIMAL(19,5) NOT NULL,
  `QUANTITY` DECIMAL(19,5) NOT NULL,
  `ATYALLOC` DECIMAL(19,5) NOT NULL,
  `QTYINSVC` DECIMAL(19,5) NOT NULL,
  `QTYINUSE` DECIMAL(19,5) NOT NULL,
  `QTYDMGED` DECIMAL(19,5) NOT NULL,
  `QTYRTRND` DECIMAL(19,5) NOT NULL,
  `QTYONHND` DECIMAL(19,5) NOT NULL,
  `QTYCANCE` DECIMAL(19,5) NOT NULL,
  `QTYCANOT` DECIMAL(19,5) NOT NULL,
  `QTYONPO` DECIMAL(19,5) NOT NULL,
  `QTYORDER` DECIMAL(19,5) NOT NULL,
  `QTYPRBAC` DECIMAL(19,5) NOT NULL,
  `QTYPRBOO` DECIMAL(19,5) NOT NULL,
  `QTYPRINV` DECIMAL(19,5) NOT NULL,
  `QTYPRORD` DECIMAL(19,5) NOT NULL,
  `QTYPRVRECVD` DECIMAL(19,5) NOT NULL,
  `QTYRECVD` DECIMAL(19,5) NOT NULL,
  `QTYREMAI` DECIMAL(19,5) NOT NULL,
  `QTYREMBO` DECIMAL(19,5) NOT NULL,
  `QTYTBAOR` DECIMAL(19,5) NOT NULL,
  `QTYTOINV` DECIMAL(19,5) NOT NULL,
  `QTYTORDR` DECIMAL(19,5) NOT NULL,
  `QTYFULFI` DECIMAL(19,5) NOT NULL,
  `QTYSLCTD` DECIMAL(19,5) NOT NULL,
  `QTYBSUOM` DECIMAL(19,5) NOT NULL,
  `EXTQTYAL` DECIMAL(19,5) NOT NULL,
  `EXTQTYSEL` DECIMAL(19,5) NOT NULL,
  `ReqShipDate` DATETIME NOT NULL,
  `FUFILDAT` DATETIME NOT NULL,
  `ACTLSHIP` DATETIME NOT NULL,
  `SHIPMTHD` CHAR(15) NOT NULL,
  `SALSTERR` CHAR(15) NOT NULL,
  `SLPRSNID` CHAR(15) NOT NULL,
  `PRCLEVEL` CHAR(11) NOT NULL,
  `COMMNTID` CHAR(15) NOT NULL,
  `BRKFLD1` SMALLINT NOT NULL,
  `BRKFLD2` SMALLINT NOT NULL,
  `BRKFLD3` SMALLINT NOT NULL,
  `CURRNIDX` SMALLINT NOT NULL,
  `TRXSORCE` CHAR(13) NOT NULL,
  `SOPLNERR` BINARY(4) NOT NULL,
  `ORGSEQNM` INT NOT NULL,
  `ITEMCODE` CHAR(15) NOT NULL,
  `PURCHSTAT` SMALLINT NOT NULL,
  `DECPLQTY` SMALLINT NOT NULL,
  `DECPLCUR` SMALLINT NOT NULL,
  `ODECPLCU` SMALLINT NOT NULL,
  `QTYTOSHP` DECIMAL(19,5) NOT NULL,
  `XFRSHDOC` TINYINT NOT NULL,
  `EXCEPTIONALDEMAND` TINYINT NOT NULL,
  `TAXSCHID` CHAR(15) NOT NULL,
  `TXSCHSRC` SMALLINT NOT NULL,
  `PRSTADCD` CHAR(15) NOT NULL,
  `ShipToName` CHAR(65) NOT NULL,
  `CNTCPRSN` CHAR(61) NOT NULL,
  `ADDRESS1` CHAR(61) NOT NULL,
  `ADDRESS2` CHAR(61) NOT NULL,
  `ADDRESS3` CHAR(61) NOT NULL,
  `CITY` CHAR(35) NOT NULL,
  `STATE` CHAR(29) NOT NULL,
  `ZIPCODE` CHAR(11) NOT NULL,
  `CCode` CHAR(7) NOT NULL,
  `COUNTRY` CHAR(61) NOT NULL,
  `PHONE1` CHAR(21) NOT NULL,
  `PHONE2` CHAR(21) NOT NULL,
  `PHONE3` CHAR(21) NOT NULL,
  `FAXNUMBR` CHAR(21) NOT NULL,
  `Flags` SMALLINT NOT NULL,
  `BackoutTradeDisc` DECIMAL(19,5) NOT NULL,
  `OrigBackoutTradeDisc` DECIMAL(19,5) NOT NULL,
  `GPSFOINTEGRATIONID` CHAR(31) NOT NULL,
  `INTEGRATIONSOURCE` SMALLINT NOT NULL,
  `INTEGRATIONID` CHAR(31) NOT NULL,
  `CONTNBR` CHAR(11) NOT NULL,
  `CONTLNSEQNBR` DECIMAL(19,5) NOT NULL,
  `CONTSTARTDTE` DATETIME NOT NULL,
  `CONTENDDTE` DATETIME NOT NULL,
  `CONTITEMNBR` CHAR(31) NOT NULL,
  `CONTSERIALNBR` CHAR(21) NOT NULL,
  `BULKPICKPRNT` TINYINT NOT NULL,
  `INDPICKPRNT` TINYINT NOT NULL,
  `ISLINEINTRA` TINYINT NOT NULL,
  `SOFULFILLMENTBIN` CHAR(15) NOT NULL,
  `MULTIPLEBINS` TINYINT NOT NULL,
  `Print_Phone_NumberGB` SMALLINT NOT NULL,
  `DEX_ROW_TS` DATETIME NOT NULL,
  `DEX_ROW_ID` INT NOT NULL)
  PRIMARY KEY (id)
  DISTRIBUTED BY HASH (id) 
  BUCKETS 4 
  PROPERTIES("replication_num" = "1", "enable_persistent_index" = "true");
 ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.zDT_SOP30200U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER dbo.zDT_SOP30200U ON dbo.SOP30200 AFTER UPDATE AS  set nocount on BEGIN UPDATE dbo.SOP30200 SET DEX_ROW_TS = GETUTCDATE() FROM dbo.SOP30200, inserted WHERE SOP30200.SOPTYPE = inserted.SOPTYPE AND SOP30200.SOPNUMBE = inserted.SOPNUMBE END set nocount off    ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.tr_SVC_IV00101_U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER tr_SVC_IV00101_U ON IV00101  FOR UPDATE  AS declare @old_type smallint,@new_type smallint declare @old_desc char(51),@new_desc char(51) declare @old_short char(15),@new_short char(15) declare @old_track smallint,@new_track smallint declare @old_price numeric(19,5), @new_price numeric(19,5) declare @item char(31) declare @datechange datetime  if not exists(select * from SVC00998) return  if (select SVC_ItemDelta from SVC00998) = 1 BEGIN  select @old_type=ITEMTYPE,@old_desc = ITEMDESC,@old_short = ITMSHNAM,@old_track = ITMTRKOP,@old_price = 0 from deleted  select @item=ITEMNMBR,@new_type=ITEMTYPE,@new_desc = ITEMDESC,@new_short = ITMSHNAM,@new_track = ITMTRKOP,@new_price = 0 from inserted  if  @old_type <> @new_type or  @old_desc <> @new_desc or  @old_short <> @new_short or  @old_track <> @new_track or  @old_price <> @new_price  begin  select @datechange = CONVERT(varchar(10),GETDATE(),102) + ' 00:00:00'   if exists(select * from SVC00501 where ITEMNMBR = @item)  begin  update SVC00501 set ITEMTYPE=@new_type,ITEMDESC=@new_desc,ITMSHNAM=@new_short,ITMTRKOP=@new_track,LISTPRCE=@new_price,  SVC_Delta_Type=2,MODIFDT = @datechange  where ITEMNMBR = @item  end  ELSE  begin  insert SVC00501  ( ITEMNMBR,  ITEMTYPE,  ITEMDESC,  ITMSHNAM,  ITMTRKOP,  LISTPRCE,  RTRNABLE,  METERED,  SVC_Delta_Type,  MODIFDT)   select ITEMNMBR,ITEMTYPE,ITEMDESC,ITMSHNAM,ITMTRKOP,0,0,0,1,  @datechange from inserted  end  end END   ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.zDT_IV00101U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER dbo.zDT_IV00101U ON dbo.IV00101 AFTER UPDATE AS  set nocount on BEGIN   UPDATE dbo.IV00101 SET DEX_ROW_TS = GETUTCDATE() FROM dbo.IV00101, inserted WHERE IV00101.ITEMNMBR = inserted.ITEMNMBR  END  set nocount off    ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.tr_SVC_Item_Ext_U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER tr_SVC_Item_Ext_U ON dbo.IV00101  FOR INSERT AS declare @rows int  select @rows = @@rowcount if @rows = 0   return if not exists(select * from SVC00998) return  if @rows <> (select count(*)  from inserted i, SVC00951 s  where i.ITEMNMBR = s.ITEMNMBR)  if @@error <> 0  begin  raiserror ('Error Inserting Item Extension', 16, 1)  rollback tran end begin  insert SVC00951 (ITEMNMBR,UOMSCHDL,METERED,RTRNABLE,PRDLINE,WARRCDE,MTBF,MTBI,MTTR,RETCOST,SVC_PM_Allowed,SVC_Contractible,SLRWARR,VENDORID, SVC_Use_CurrentCost)  select distinct ITEMNMBR,'',0,0,'','',0,0,0,0,1,1,'','',1  from inserted  where ITEMNMBR <> ''  and ITEMNMBR not in  (select ITEMNMBR  from SVC00951)  if @@error <> 0   begin  raiserror ('Error Inserting Item Extension', 16, 1)  rollback tran  end end return   ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.tr_SVC_IV00101_D
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER tr_SVC_IV00101_D ON IV00101  FOR DELETE  AS declare @item char(31) declare @datechange datetime  if not exists(select * from SVC00998) return  select @item=ITEMNMBR from deleted if exists(select * from SVC00951 where ITEMNMBR = @item)  delete from SVC00951 where ITEMNMBR = @item if exists(select * from SVC00501 where ITEMNMBR = @item)  begin  select @datechange = CONVERT(varchar(10),GETDATE(),102) + ' 00:00:00'   update SVC00501 set SVC_Delta_Type = 3,MODIFDT = @datechange where ITEMNMBR = @item  end   return    ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.zDT_SOP30300U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER dbo.zDT_SOP30300U ON dbo.SOP30300 AFTER UPDATE AS  set nocount on BEGIN UPDATE dbo.SOP30300 SET DEX_ROW_TS = GETUTCDATE() FROM dbo.SOP30300, inserted WHERE SOP30300.SOPTYPE = inserted.SOPTYPE AND SOP30300.SOPNUMBE = inserted.SOPNUMBE AND SOP30300.LNITMSEQ = inserted.LNITMSEQ AND SOP30300.CMPNTSEQ = inserted.CMPNTSEQ END set nocount off    ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.zDT_SOP10100U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER dbo.zDT_SOP10100U ON dbo.SOP10100 AFTER UPDATE AS  set nocount on BEGIN UPDATE dbo.SOP10100 SET DEX_ROW_TS = GETUTCDATE() FROM dbo.SOP10100, inserted WHERE SOP10100.SOPTYPE = inserted.SOPTYPE AND SOP10100.SOPNUMBE = inserted.SOPNUMBE END set nocount off    ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.sopWFupdateSOP10104
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
-- CREATE TRIGGER [sopWFupdateSOP10104] ON SOP10100  FOR UPDATE  AS  declare @creditlimitholdid char(15) if update(WorkflowApprStatCreditLm) and (select WorkflowApprStatCreditLm from inserted)=6 begin  if (select SOPTYPE from inserted)=6   select @creditlimitholdid = isnull((select CREDITLIMITHOLDID from SOP40200 a,inserted where a.DOCID=inserted.DOCID and a.SOPTYPE=3),'')   else  select @creditlimitholdid = isnull((select CREDITLIMITHOLDID from SOP40200 a,inserted where a.DOCID=inserted.DOCID and a.SOPTYPE=inserted.SOPTYPE),'')    if @creditlimitholdid<>''  begin   if (select count(*) from SOP10104 a, inserted where a.SOPTYPE=inserted.SOPTYPE and a.SOPNUMBE = inserted.SOPNUMBE and a.PRCHLDID=@creditlimitholdid)>0  begin  update SOP10104  set DELETE1=1, HOLDDATE=convert(char(10),GETDATE(),120),TIME1=convert(char(10),GETDATE(),114)  from inserted  where SOP10104.SOPTYPE=inserted.SOPTYPE and SOP10104.SOPNUMBE = inserted.SOPNUMBE and SOP10104.PRCHLDID=@creditlimitholdid   end  end end   ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.tr_SVC_SOP10100_D
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER tr_SVC_SOP10100_D ON dbo.SOP10100 FOR DELETE  AS  declare @SOPType smallint declare @SOPNumber char(17)  select @SOPType = SOPTYPE, @SOPNumber = SOPNUMBE from deleted  if not exists( select * from SOP30200 where SOPNUMBE = @SOPNumber and SOPTYPE  = @SOPType )  begin  if exists( select * from SVC00660 where SOPNUMBE = @SOPNumber and SOPTYPE  = @SOPType )  BEGIN  if @SOPType = 3  delete SVC00660 where SOPNUMBE = @SOPNumber and SOPTYPE  = @SOPType   delete from SVC00661 where SOPNUMBE = @SOPNumber and SOPTYPE  = @SOPType   END  end return   ;

-- ----------------------------------------------------------------------------
-- Trigger Ingest.zDT_SOP10200U
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `Ingest`$$
--  CREATE TRIGGER dbo.zDT_SOP10200U ON dbo.SOP10200 AFTER UPDATE AS  set nocount on BEGIN UPDATE dbo.SOP10200 SET DEX_ROW_TS = GETUTCDATE() FROM dbo.SOP10200, inserted WHERE SOP10200.SOPTYPE = inserted.SOPTYPE AND SOP10200.SOPNUMBE = inserted.SOPNUMBE AND SOP10200.LNITMSEQ = inserted.LNITMSEQ AND SOP10200.CMPNTSEQ = inserted.CMPNTSEQ END set nocount off    ;
SET FOREIGN_KEY_CHECKS = 1;
