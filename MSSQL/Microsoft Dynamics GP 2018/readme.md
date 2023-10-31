The different code files in here, will help and support clean up of the ManagementReporter Database of Microsoft Dynamics GP 2018. 


A bit of backstory. The way Dynamics GP works, is a user on the front end creates a report. 
Say 'User 1' creates a report for 'Location A' for the period of 2019. Then 'User 2' comes along and 
creates a report for 'Location A' for the period of 2019. So of course these could be seen as two different 
reports because of 2 different users. Dynamics will bring in the same data twice. Now let's say 'User 1' forgot that they
created 'Location A' for 2019. When they recreate that. It will bring the data once again not know about that previous report. 
So as you can see. Multiple users create multiple reports, for differing time periods and even potentially the same data. That
will grow exponentially. The main two ways to fix the grow of the Management reporter are the following.

1. Have the front end users delete their reports. The issue with this is, users can have 100's or even 1000's of reports.
Deleting multiple reports can lock up and even crash the system depending how many users you have using the box, the power of the box,
how much data these reports contain. Also you will have to ask yourself if management would want these users using their time deleting these 
reports one by one.


2. You go into the backend and manually delete the data from the tables themselves. 


For the purposes of the following queries of course we will be going with option 2. 
