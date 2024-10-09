## Obtain descriptive statistics on ride_length data
mean(twen1$ride_length)
median(twen1$ride_length)
max(twen1$ride_length)
min(twen1$ride_length) 

# Compare ride_length statistics based on member classification
# This code generates four tibbles, one for each descriptive stat
aggregate(twen1$ride_length ~ twen1$member_casual, FUN = mean)
aggregate(twen1$ride_length ~ twen1$member_casual, FUN = median)
aggregate(twen1$ride_length ~ twen1$member_casual, FUN = max)
aggregate(twen1$ride_length ~ twen1$member_casual, FUN = min)

# Compares mean of ride_length based on member class and day of the week
# This creates a tibble of 14x3
aggregate(twen1$ride_length ~ twen1$member_casual + twen1$day_of_week, FUN = mean)

# The weekdays are out of order, so this correct it
twen1$day_of_week <- ordered(twen1$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# The following is the same table, with some additional ordering by member 
# class, and the addition of the number of rides per day
twen1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) 
    %>% group_by(member_casual, weekday) 
    %>% summarise(number_of_rides = n(),average_duration = mean(ride_length)) 
    %>% arrange(member_casual, weekday)	


# Generates bar graph for number of rides by weekday, splitting on member class
twen1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

# Generates bar graph for trip duration by weekdady, splitting on member class
twen1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

# Creates summary tibble 
