The different code files in here, will help and support clean up of the ManagementReporter Database of Microsoft Dynamics GP 2018 (ON PREM). 


DISCLAIMER: PLEASE NOTE THIS CODE IS USER CREATED/CUSTOM AND NOT FROM THE BASE SYSTEM. USE AND EXCUTE AT YOUR OWN RISK. PLEASE CONTACT YOUR IT TEAM, AND/OR KNOW WHAT EACH QUERY DOES BEFORE EXCUTING. 

Before I begin. I want to say I have modified and retooled code from a previous author. That man's name is Steve Erbach. Sadly the forum where his old code was posted (GPUG.com), was acquired. I even contacted the company and backups of the post were lost to time of aquisitions, like tears in rain... I still want to give him the credit he deserves as he saved my butt back in 2018/19 with his forum post and helped me get back 500GB+ of space on our servers. So thank you Steve, and here is hoping this can help other people with GP clean up. 


A bit of backstory. The way Dynamics GP works, is a user on the front end creates a report. Say 'User 1' creates a report for 'Location A' for the period of 2019. Then 'User 2' comes along and creates a report for 'Location A' for the period of 2019. So of course these could be seen as two different reports because of 2 different users. Dynamics will bring in the same data twice. Now let's say 'User 1' forgot that they created 'Location A' for 2019. When they recreate that. It will bring the data once again not know about that previous report. So as you can see. Multiple users create multiple reports, for differing time periods and even potentially the same data. That will grow exponentially. The main two ways to fix the grow of the Management reporter are the following.

1. Have the front end users delete their reports. The issue with this is, users can have 100's or even 1000's of reports. Deleting multiple reports can lock up and even crash the system depending how many users you have using the box, the power of the box, how much data these reports contain. Also you will have to ask yourself if management would want these users using their time deleting these reports one by one.

2. You go into the backend and manually delete the data from the tables themselves. 


For the purposes of the following queries of course we will be going with option 2. 

What each files does:

0_HowMuchDataIsOutThere.sql
(WORK IN PROGRESS)
A couple of queries to show how much data you have out there. (Please note, some of the queries may take sometime to run, depending on how powerful your box is.)


1_CreateMetadataTables.sql
This file creates both the Database that you will store the metadata in and the tables.
The two tables will hold the:
ReportIDs and CreateDate (mm-YYYY)
RepositoryID's and CreateDate (mm-YYYY)

I choose mm-YYYY as the amount of data that will be deleted from ReportLineTransaction alone can be massive. This will make a way to easily group the data
to more manageable sizes, so deletes can happen in a more segmented way. I deleted data from Feb-2019 to Dec-2022 when running this code myself. I deleted over 2.9 billions rows from ReportLineTransaction
alone. Saving over 1 TB of space for my company. You may even want to go to mm-dd-yyyy or dd-mm-yyyy if you feel you need to do a smaller range. 

2_DeletingDataFromReportLineTransaction
(WORK IN PROGRESS)

Now we are deleting data from the main hog of the Management Reporter Database. I know I will always say this, but always be careful before running these queries. On my month runs, I was seeing between 5-20 minutes of time to delete. Again time will vary depending on your systems size. 
