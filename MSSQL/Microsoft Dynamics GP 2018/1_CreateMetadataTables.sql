/*
==================================================================================================================================
Title: 1_CreateMetadataTables.sql
Author:  William Thomsen
Created: 10-31-2023
==================================================================================================================================

----------------------------------------------------------------------------------------------------------------------------------
Purpose: 
----------------------------------------------------------------------------------------------------------------------------------

1  - (Optional) Create A Database to store the metadata.
2  - Get a List of Report ID's and their Create Month and Year (mm-YYYY). 
	2a - (Optional, depends on step 1). Create a Table from the data above in 2
3  - Get a List of Repository ID's and their Create Month and Year (mm-YYYY)
	3a - (Optional, depends on step 1). Create a Table from the data above in 3


----------------------------------------------------------------------------------------------------------------------------------
Input Parameters:
----------------------------------------------------------------------------------------------------------------------------------
None


----------------------------------------------------------------------------------------------------------------------------------
Output Parameters:
----------------------------------------------------------------------------------------------------------------------------------
None


----------------------------------------------------------------------------------------------------------------------------------
Program Used: 
----------------------------------------------------------------------------------------------------------------------------------
SQL Server Management Studio
Microsoft Dynamics GP 2018 (ON PREM)


----------------------------------------------------------------------------------------------------------------------------------
Purpose:
----------------------------------------------------------------------------------------------------------------------------------
 Using the Microsoft Dynamics GP 2018 SQL Server
 These queries will bring back the ReportID's and the RepositoryID's that have been created within 
 a certain time period. Managing the ManagementReporter can be a pain as that database can grow in size
 fast if not managed correctly. 
 
 Please read the ReadMe.md file for backstory on the purpose of the Microsoft Dynamics GP 2018 code block


----------------------------------------------------------------------------------------------------------------------------------
TIPS:
----------------------------------------------------------------------------------------------------------------------------------
Remember when in the ManagementReporter database the main schema used is [reporting] and not the usual
default of dbo. So you will have to add that to your query unless you change your default schema for
the user you will be logged in as. 
 
CORRECT: SELECT * FROM reporting.report
 
WRONG(Unless changed default schema): SELECT * FROM report

 
----------------------------------------------------------------------------------------------------------------------------------
 WARNING: 
----------------------------------------------------------------------------------------------------------------------------------
 Please note, you will be working with production data, so please use caution when running any of this code
 Some of this code maybe use CUD of CRUD (Create, Update, Delete). Always USE CAUTION.
 Know what you are running and understand the code before you execute. Since you can break the system. 
 As always use Creates, Updates, or, Deletes. If allowed by your IT Team, ensure they have made proper backups.


==================================================================================================================================
Modification History

2023-10-31:  Will Thomsen        Initial Build.  
==================================================================================================================================
*/
--Run this code if you want to create a database on the server with this metadata.
--If for some reason MetaData_temp already exsists and you had no idea it did,
--check to see what is in the database. You can either use it, or delete it and recreate.


--IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MetaData_Temp')
--BEGIN
--  CREATE DATABASE MetaData_Temp;
--END;
--GO


--This is the Report Query
SELECT R.ID, 
FORMAT(re.CreateDate, 'MM-yyyy') AS CreateDate 


--Create DB needs to be run for this section to work
--INTO 
--MetaData_Temp.dbo.ReportID

FROM
Reporting.Report R 
INNER JOIN Reporting.ReportRepositoryLink RRL
ON 
R.ID = RRL.ReportID
INNER JOIN reporting.Repository RE
ON 
RRL.RepositoryID = RE.ID
WHERE RE.CreateDate < '2023-01-01' --Change this to whatever you want
AND RE.StatusType=0




--This is the Repository Query
SELECT R.ID, 
FORMAT(re.CreateDate, 'MM-yyyy') AS CreateDate 

--You will need to have run, the create code above for this part to work.
--INTO 
--MetaData_Temp.dbo.RepositoryID  --You can also change this table to whatever you want. 


FROM
Reporting.Report R 
INNER JOIN Reporting.ReportRepositoryLink RRL
ON 
R.ID = RRL.ReportID
INNER JOIN reporting.Repository RE
ON 
RRL.RepositoryID = RE.ID
WHERE RE.CreateDate < '2023-01-01' --Change this to whatever you want
AND RE.StatusType=0
