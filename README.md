## cyclistic-membership

Google Analytics Capstone Project using Cyclistic (divvy bike) data to conduct a case study. 

1. Objective (Ask Phase) : A clear statement of the business task

Determine the differences in annual member and casual rider use of Cyclistic bike to develop a business strategy that will recruit more annual members from the already existing casual rider clients.

################################################

2. Prepare Phase : A description of all data sources used 

The data was downloaded from the divvy website where the licensing agreement can also be found. The credibility of the data can be found here as well. 

data : https://divvy-tripdata.s3.amazonaws.com/index.html
website : https://ride.divvybikes.com/
data license agreement: https://ride.divvybikes.com/data-license-agreement

The data files are organized in the folder location here:
Home/Documents/Data Analytics Google Coursera/Data Analytics/cyclistic/cyclistic

The column attributes are as follows(more info in the prepare.R file):
 "ride_id" 
 "rideable_type" - "electric_bike" "classic_bike"  "docked_bike" 
 "started_at"        
 "ended_at"  
 "start_station_name"
 "start_station_id"  
 "end_station_name" 
 "end_station_id"  
 "start_lat"         
 "start_lng"  
 "end_lat"      
 end_lng"           
 member_casual" - "casual" "member"
 
Problems: 
-The column titles are not uniform 
-The usertype label for non/member is not consistent 
-The time doesn't give you day of the week

################################################

3. Process Phase : Documentation of any cleaning or manipulation of data 

Fixed the problems identified in the prepare phase. 
-make column titles uniform
-make usertypes uniform
-transform time to a new column for day of week 

To do:
-remove outliers
-check for errors
-convert day to number

Tools:
RStudio will be used for the prepare and process phase.
SQL within R (sqldf()) will be used for the analyze phase.
Tableau will be used for the share phase.



################################################
  
4. Analysis Phase : A summary of your analysis 

Use SQL to analyze with sqldf().

Export Summary Files:
-sum_users = create a table displaying summary information (average trip duration, max trip duration, median start day) for casual riders compared to members
-sum_by_day = create a table displaying daily information on average trip duration and #rides per day

################################################

5. Share Phase: Supporting visualizations and key findings 

Import summary files to Tableau. Create bar plots of sum_users and area plots of sum_by_day. 

Insights:
1. Wednesday is the most popular day for members to ride while the weekend is most popular for casual riders.
2. Casual rides ride almost twice as long as members.
3. All users ride longer on the weekend.

https://public.tableau.com/app/profile/emily.scott7214/viz/CyclisticBikeShareAnalysistoIncreaseMembership/Dashboard1#1

################################################

6. Act Phase : Your top three recommendations based on your analysis 

Recommendations:
1. Give an incentive to get people to ride more during the week : Give a discount for casual riders riding on the week days.
2. Try to get them to use bikes for shorter trips : Create a deal, for every 3 rides, you get a free 10min. 
3. Connect people riding on the weekend together for a sense of community and motivation : Create group rides/events(ride party's, music, races) on weekends to get people riding together. 
