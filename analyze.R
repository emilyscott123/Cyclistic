#Clean Data 

#plot scatter of each attribute
#check for outliers

# library(ggplot2)
# 
# ggplot()+
#   geom_point(data=divvy_data, aes(x=usertype, y=tripduration))
# 
# plot(as.numeric(divvy_data$usertype), as.numeric(divvy_data$tripduration))

#use divvy_data from prepare.R
# library(readr)
# divvy_data <- read_csv("\\divvy_data.csv")
# divvy_data <- as.data.frame(divvy_data)
# 
# install.packages("sqldf")
library(sqldf)
library(lubridate)
#sqldf(" you can type your sql statement here")

#analyze

#create a table displaying summary information (average trip duration, max trip duration, median start day) for casual riders compared to members
sum_users <- sqldf("select [usertype],  avg([tripduration]), max([tripduration]), median([start_day_num])
      from divvy_data_18_19_2
      group by [usertype] ")
sum_users$`median([start_day_num])` <- wday(sum_users$`median([start_day_num])`, label = TRUE)
#create a table displaying daily information on average trip duration and #rides per day
sum_by_day <- sqldf("select [usertype], [start_day], avg([tripduration]), count([tripid])
                    from divvy_data_18_19_2
                    group by [usertype], [start_day] ")

#save summary files
write.csv(sum_users, "\\sum_users.csv", row.names  = TRUE)
write.csv(sum_by_day, "\\sum_by_day.csv", row.names = TRUE)


