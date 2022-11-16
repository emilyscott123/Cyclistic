#Prepare Data frame

#Grouping data by attriutes reported

######### 1
# Divvy_Trips_2020_Q1, 
# X202004_divvy_tripdata to X202012_divvy_tripdata, 
# X202101_divvy_tripdata to X202112_divvy_tripdata, 
# X202201_divvy_publictripdata to X202208_divvy_tripdata,  
# X202209_divvy_publictripdata  
# The column attributes are as follows:
# "ride_id" 
# "rideable_type"                                            - "electric_bike" "classic_bike"  "docked_bike" 
# "started_at"        
# "ended_at"  
# "start_station_name"
# "start_station_id"  
# "end_station_name" 
# "end_station_id"  
# "start_lat"         
# "start_lng"  
# "end_lat"      
# "end_lng"           
# member_casual"                                            - "casual" "member"

############## 2
# Divvy_Trips_2018_Q1, 
# Divvy_Trips_2019_Q2
#The column attriutes are as follows:
# [1] "01 - Rental Details Rental ID"                   
# [2] "01 - Rental Details Local Start Time"            
# [3] "01 - Rental Details Local End Time"              
# [4] "01 - Rental Details Bike ID"                     
# [5] "01 - Rental Details Duration In Seconds Uncapped"
# [6] "03 - Rental Start Station ID"                    
# [7] "03 - Rental Start Station Name"                  
# [8] "02 - Rental End Station ID"                      
# [9] "02 - Rental End Station Name"                    
# [10] "User Type"                                         - "Subscriber" "Customer"                                     
# [11] "Member Gender"                                     - "Male"   "Female" NA                               
# [12] "05 - Member Details Member Birthday Year"

############# 3
# Divvy_Trips_2018_Q2 to Divvy_Trips_2019_Q1, 
# Divvy_Trips_2019_Q3, Divvy_Trips_2019_Q4
# "trip_id"   
# "start_time"   
# "end_time"         
# "bikeid"   
# "tripduration"  
# "from_station_id"  
# "from_station_name"
# "to_station_id"  
# "to_station_name"  
# "usertype"                                               - "Subscriber" "Customer"  
# "gender"                                                 - "Male"   "Female" NA
# "birthyear"        

#Wanted columns:
#tripid
#start_station_name
#start_station_id 
#end_station_name
#end_station_id
#tripduration
#usertype

# 1.
# Group 2 and 3 have the same columns. Combine data from the (both groups) following times together:
#
# Divvy_Trips_2018_Q1
# Divvy_Trips_2018_Q2 
# Divvy_Trips_2018_Q3
# Divvy_Trips_2018_Q4
#
# Divvy_Trips_2019_Q1
# Divvy_Trips_2019_Q2
# Divvy_Trips_2019_Q3
# Divvy_Trips_2019_Q4

#change column names to match
colnames(Divvy_Trips_2018_Q1) <- colnames(Divvy_Trips_2019_Q4)
colnames(Divvy_Trips_2019_Q2) <- colnames(Divvy_Trips_2019_Q4)
#combine files with same columns
divvy_data_18_19 <-  rbind( Divvy_Trips_2018_Q1,
                       Divvy_Trips_2018_Q2, 
                       Divvy_Trips_2018_Q3,  
                       Divvy_Trips_2018_Q4,
                       
                       Divvy_Trips_2019_Q1, 
                       Divvy_Trips_2019_Q2,
                       Divvy_Trips_2019_Q3, 
                       Divvy_Trips_2019_Q4 )
#combine files with same columns
# divvy_data_20_21_22 <- rbind( Divvy_Trips_2020_Q1,
#                               X202004_divvy_tripdata,
#                               X202005_divvy_tripdata, 
#                               X202006_divvy_tripdata, 
#                               X202007_divvy_tripdata, 
#                               X202008_divvy_tripdata, 
#                               X202009_divvy_tripdata, 
#                               X202010_divvy_tripdata, 
#                               X202011_divvy_tripdata, 
#                               X202012_divvy_tripdata,
#                               
#                               X202101_divvy_tripdata, 
#                               X202102_divvy_tripdata, 
#                               X202103_divvy_tripdata, 
#                               X202104_divvy_tripdata, 
#                               X202105_divvy_tripdata, 
#                               X202106_divvy_tripdata, 
#                               X202107_divvy_tripdata, 
#                               X202108_divvy_tripdata, 
#                               X202109_divvy_tripdata, 
#                               X202110_divvy_tripdata, 
#                               X202111_divvy_tripdata,
#                               X202112_divvy_tripdata,
#                               
#                               X202201_divvy_tripdata, 
#                               X202202_divvy_tripdata, 
#                               X202203_divvy_tripdata, 
#                               X202204_divvy_tripdata, 
#                               X202205_divvy_tripdata, 
#                               X202206_divvy_tripdata, 
#                               X202207_divvy_tripdata, 
#                               X202208_divvy_tripdata, 
#                               X202209_divvy_publictripdata )

#Wanted columns:
#tripid
#start_time           - class is difftime
#end_time
#start_station_name
#start_station_id 
#end_station_name
#end_station_id
#tripduration         - converted to numeric class in seconds, for 2020, 2021, 2022 calculate the trip duration from the start and end time
#usertype             - converted to member or casual
#start_day            - convert start time to day of the week using weekdays()  (1=sunday, 7=saturday)
#end_day              - " 

#correct usertype names
divvy_data_18_19$usertype <- ifelse(divvy_data_18_19$usertype=="Subscriber", "member", "casual")
#pare down columns
divvy_data_18_19_2 <- data.frame(tripid = divvy_data_18_19$trip_id, 
                               start_time = divvy_data_18_19$start_time,
                               end_time = divvy_data_18_19$end_time,
                               start_station_name = divvy_data_18_19$from_station_name, 
                               start_station_id = divvy_data_18_19$from_station_id,
                               end_station_name = divvy_data_18_19$to_station_name,
                               end_station_id = divvy_data_18_19$to_station_id,
                               tripduration = as.numeric(divvy_data_18_19$tripduration), 
                               usertype = divvy_data_18_19$usertype,
                               start_day = weekdays(divvy_data_18_19$start_time),
                               start_day_num = as.matrix(as.integer(factor(weekdays(divvy_data_18_19$start_time),levels=c("Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"),ordered=TRUE))))

#test all trips have a unique id
#length(unique(divvy_data_18_19$trip_id))==nrow(divvy_data_18_19_2)
#pare down columns, calc tripduration
# tripid <- divvy_data_20_21_22$ride_id
# start_time <- divvy_data_20_21_22$started_at
# end_time <- divvy_data_20_21_22$ended_at
# start_station_name <- divvy_data_20_21_22$start_station_name
# start_station_id <- divvy_data_20_21_22$start_station_id
# end_station_name <- divvy_data_20_21_22$end_station_name
# end_station_id <- divvy_data_20_21_22$end_station_id
# tripduration <- as.numeric((divvy_data_20_21_22$ended_at - divvy_data_20_21_22$started_at)) #this returns time in seconds
# usertype <- divvy_data_20_21_22$member_casual
# #pare down columns
# divvy_data_20_21_22_2 <- data.frame(tripid,
#                                     start_time,
#                                     end_time, 
#                                     start_station_name, 
#                                     start_station_id, 
#                                     end_station_name, 
#                                     end_station_id,
#                                     tripduration, #min
#                                     usertype ) #member/casual 
# 
# #save and read
# write.csv(divvy_data_18_19_2, "\\divvy_data_18_19_2.csv", row.names = TRUE)
# write.csv(divvy_data_20_21_22_2 , "\\divvy_data_20_21_22_2.csv", row.names = TRUE)
# divvy_data_18_19_2 <- read_csv("\\divvy_data_18_19_2.csv")
# divvy_data_18_19_2 <- as.data.frame(divvy_data_18_19_2)
# divvy_data_20_21_22_2 <- read_csv("\\divvy_data_20_21_22_2.csv")
# divvy_data_20_21_22_2 <- as.data.frame(divvy_data_20_21_22_2)
# 
# #combine 2018,2019,2020,2021,and 2022 dataframes
# divvy_data <- rbind(divvy_data_18_19_2, divvy_data_20_21_22_2)
# 
# #convert day to number
# start_time <- data.frame(weekdays(divvy_data$start_time))
# end_time <- data.frame(weekdays(divvy_data$end_time))
# start_day_num <- as.matrix(as.integer(factor(start_time,levels=c("Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"),ordered=TRUE)))
# end_day_num <- as.matrix(as.integer(factor(end_time,levels=c("Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"),ordered=TRUE)))
# 
# 
# #add day of week info
# divvy_data <- data.frame(divvy_data,
#                          start_day = start_time,
#                          end_day = end_time,
#                          start_day_num = start_day_num, 
#                          end_day_num = end_day_num )
# 
# #remove trip duration outliers
# outliers <- boxplot(divvy_data$tripduration, plot=FALSE)$out
# divvy_data<- divvy_data[-which(divvy_data$tripduration %in% outliers),]
# 
# #create data file
# write.csv(divvy_data, "\\divvy_data.csv", row.names = TRUE)
#  


#start here for shorter version
# start_time_18 <- data.frame(weekdays(divvy_data_18_19_2$start_time))
# #end_time_18 <- data.frame(weekdays(divvy_data_18_19_2$end_time))
# start_day_num_18 <-  as.matrix(as.integer(factor(start_time_18,levels=c("Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"),ordered=TRUE)))
# #end_day_num_18 <- as.matrix(as.integer(factor(end_time_18,levels=c("Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"),ordered=TRUE)))
# 
# divvy_data_18 <- data.frame(divvy_data_18_19_2,
#                          start_day = start_time_18,
#                          end_day = end_time_18,
#                          start_day_num = start_day_num_18 )
# 
 outliers_18 <- boxplot(divvy_data_18_19_2$tripduration, plot=FALSE)$out
 divvy_data_18_19_2 <- divvy_data_18_19_2[-which(divvy_data_18_19_2$tripduration %in% outliers_18),]

