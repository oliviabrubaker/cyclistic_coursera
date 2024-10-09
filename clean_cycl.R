# Preamble: Install necessary packages
install.packages("readr", repos = "http://cran.us.r-project.org")
install.packages("tidyr", repos = "http://cran.us.r-project.org")
install.packages("dplyr", repos = "http://cran.us.r-project.org")
install.packages("lubridate", repos = "http://cran.us.r-project.org")
install.packages("ggplot2", repos = "http://cran.us.r-project.org")
library(readr)
library(tidyr)
library(dplyr)
library(lubridate)
library(ggplot2)

# Read Divvy csv, converting the dates to the DateTime datatype
twen1 <- read_csv("quarterly data/Divvy_Trips_2020_Q1.csv", 
                  col_types = cols(started_at = col_datetime(format = "%Y-%m-%d %H:%M:%S"), 
                                   ended_at = col_datetime(format = "%Y-%m-%d %H:%M:%S")))

# Check that trip_id is a unique identifier
uniq_id <- nrow(twen1 %>% distinct(ride_id))
nrow(twen1) == uniq_id

# Identify trips with N/A entries in any variables, save as na_counts
na_counts <- twen1 %>% summarise_all(~ sum(is.na(.))) 

# Checks proportion of N/A entries
twen1_no_na <- na.omit(twen1)

proportion_na <- nrow(twen1_no_na)/nrow(twen1)

# Since 99.99% of the entries are accounted for in the data, I chose to omit
# the trips that are missing variable data
rm(twen1)

# An integral part of my analysis will cover trip duration and day of the week, 
# so the following codes adds two calculated columns

# Adds trip duration as "ride_length"
twen1_add_dur <- twen1_no_na  %>% mutate(ride_length = difftime(ended_at, started_at))

# Adds weekday
twen1_calc <- twen1_add_dur  %>% mutate(day_of_week = weekdays(started_at))

rm(twen1_no_na)
rm(twen1_add_dur)

# Converts the data-type of the ride_length column to be numerical
twen1_calc$ride_length <- as.numeric(as.character(twen1_calc$ride_length))

# Some of the data includes negative ride_length, and includes trips that 
#are staff-rides coming from the HQ. We check that these are not heavily 
# influential, then remove them
twen1_no_neg_staff <- twen1_calc[!(twen1_calc$start_station_name == "HQ QR" | twen1_calc$ride_length<0),]
proportion_no_neg_staff <- nrow(twen1_no_neg_staff)/nrow(twen1)
# 99.11% of the data remains, so the exceptions are removed
twen1 <- twen1_no_neg_staff
rm(twen1_calc)
rm(twen1_no_neg_staff)

# Export cleaned and calculated data into a .csv
write.csv(twen1, "q1_2020.csv")
                                 