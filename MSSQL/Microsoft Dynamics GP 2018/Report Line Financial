/*
Please note, as said previously. USE CAUTION WHEN RUNNING THESE COMMANDS

*/


--The following command will be using the Metadata tables from before. 


--In the follwing query you will notice there will be 3 different way you can run it

--Select count will tell you how many rows you will be deleting (This could be a massive range. For my system it was from 10 Million to 110 Million +)
select count(*)
from 
reporting.ReportLineFinancial
where
Reportid in (Select id from DeleteMetadata.dbo.ReportID where CreateDate='01-2022')


--Delete will delete all records based on your where filter (I would recommend 1 month at a time)
BEGIN TRAN
delete
from 
reporting.ReportLineFinancial
where
Reportid in (Select id from DeleteMetadata.dbo.ReportID where CreateDate='01-2022')
COMMIT TRAN


-- Delete Top (#). I used this because depending on how your system is setup the delete will create a transactions and that could error out if your log drive is not big enough. So I usually used 
-- Top 50 Million. This did not error out. Though it really depends on your system and how it is installed. Maybe for you 50 Million will error due to log file fill up. So then go to 30 Million 
--Keep going until it runs successfully then run it as many times as Number of Rows from the count/the top number you did that run succesfully rounded up. You can also run a delete statement
--Then once you recieve (0) rows affected, you know you are done
Begin TRAN
delete top(50000000)
from 
reporting.ReportLineFinancial
where
Reportid in (Select id from DeleteMetadata.dbo.ReportID where CreateDate='01-2022')
COMMIT TRAN


-- I still have more code to come to clean up more metadata. This code will be a good place to start so you can free up space. This is usually the biggest table. After deleting data from 2018-2021 
-- I got back 600GB on the server
