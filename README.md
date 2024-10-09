# cyclistic_coursera
The capstone project from the Google Data Analytics Professional Certificate on Coursera

Cyclistic, a bike rental company located in Chicago, Illinois, has noticed an increased profit margin for individuals who are subscribed to the annual membership. In an effort to craft a campaign to convert the everyday consumer into a member, this report seeks to capture recent trends of the "casual" customer through data analysis.

The data analyzed in this project covers [Cyclistic's rental data](https://divvy-tripdata.s3.amazonaws.com/index.html) from the first quarter of 2020. The data has been made available through the following [license](https://divvybikes.com/data-license-agreement). 

In the repository, the data is divided by quarter, and includes the following categories: 

* Unique trip identifier

* Bicycle type: Electric or Classic

* Trip Starting Location: Includes name of the cross streets, latitude and longitude

* Trip End Location: Includes name of cross streets, latitude, and longitude

* The trip's date and when the trip began and ended

* Member Classification: If the member is an annual subscriber, the data assigns "member". To the other classification, it is labeled "casual", and that represents consumers who have rented a bicycle for their one-time, daily, or monthly passes.

To approach this project, I used RStudio to clean, analyze, and visualize my data. The requried packages for my code include: readr, tidyr, dplyr, lubridate, ggplot2.

The code that documents the cleaning process of Divvy_Trips_2020_Q1.csv is stored in this repository under **clean_cycl.R**. The original .csv was stored in a local file on my computer labeled 'quarterly data'. The resultant is stored as cycl_q1_2020.csv, which is too large to store in this repository.

Next, I cleaned the descriptive statistics from the cleaned data, stored in **cycl_analyze.R**. This code includes the information gleaning and data visualization crafting that led to the presentation **cyclistic_analytics_2020q1.pptx**. My analysis and recommendations can be found in the presentation notes.






