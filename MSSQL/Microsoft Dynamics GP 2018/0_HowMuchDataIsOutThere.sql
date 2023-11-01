--This code will give you an idea about how many reports out there could have ReportLineTransaction Records. Not all of them necessarily will have data in that table. 
SELECT 
YEAR(RE.CreateDate), 
COUNT(R.ID) AS ReportCount
FROM Reporting.Report R 
INNER JOIN Reporting.ReportRepositoryLink RR
ON 
R.ID = RR.ReportID
INNER JOIN Reporting.Repository RE
ON 
RR.RepositoryID = RE.ID
GROUP BY YEAR(CreateDate)


--Here is are two similar queries to get actually how many rows are per the reports. 
--As every system is unique to the company. The amount of rows per report will be different.
--My stats for a single month with 1174 unique reports that have records in ReportLineTransaction
--Min 5 Rows
--Max 320553 Rows
--Median 19386 Rows
--Average 39416.417 Rows

--Use this code to get the count of rows per report for a given period. Within ReportLineTransaction
Select 
ReportID, 
COUNT(*)
FROM
Reporting.ReportLineTransaction
WHERE ReportID IN 
( 
  SELECT 
  R.ID
  FROM Reporting.Report R 
  INNER JOIN Reporting.ReportRepositoryLink RR
  ON 
  R.ID = RR.ReportID
  INNER JOIN Reporting.Repository RE
  ON 
  RR.RepositoryID = RE.ID
  WHERE CAST(CreateDate AS Date) BETWEEN '2019-07-01' and '2019-07-31'
)
GROUP BY ReportID
  
--This code uses the MetaData tables that are created in 1_CreateMetadataTables.sql
SELECT 
ReportID, 
COUNT(*)
FROM
Reporting.ReportLineTransaction
WHERE ReportID IN 
( 
  SELECT 
  ID 
  FROM  
  DeleteMetaData.dbo.Reportid1
  WHERE CreateDate='07-2019'
)
GROUP BY ReportID



