# Google Data Analytics Capstone: Bellabeat Case Study Using SQL 

## Introduction 
Bellabeat is a high-tech company that has a specialization in producing health-focused smart products. The company has an emphasis in empowering women and marketing itself towards women. It's founder and CEO is Urška Sršen. 

Bellabeat has an app that provides users with health related data based on acitivty, sleep, stress, menstrual cycle, and mindfulness habits. The data can be used by consumers to make healthier decisions. The app is connected the wellness products such as Leaf (worn tracker that tracks activity, sleep, and stress), Time (wellness watch that tracks activity, sleep, and stress), and Spring (water bottle that tracks daily water intake).

The company has been investing extensively into digital marketing such as Google Search and Facebook pages

## Business Task 
I am a junior data analyst on the marketing analytics team and have been tasked to gain insight on how consumers are using their devices. With this insight, it is my task to provide recommendations for the Bellabeat marketing team to grow the company. 

## Ask
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## Prepare 

### Data Information 
The data is located on a public domain [here](https://www.kaggle.com/datasets/arashnic/fitbit). This dataset is made available through Mobius on Kaggle. 

The license is available [here](https://creativecommons.org/publicdomain/zero/1.0/).

This dataset includes data from thirty individuals that were gathered via Amazon Mechanical Turk between 03.12.2016-05.12.2016. These individuals consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. Individual data can be indetified by the unique session ID that each data has. Different types of Fitbit trackers and individual tracking preferences caused variations between ouputs.

Response bias is a legitimate concern as data was gathered from individuals that consented to have their data collected from the Bellabeat app. 

### ROCCC 
#### Reliable
This data is reliable as it is complete and accurate. 
#### Original 
This is a primary data as the data was collected directly from thirty individuals. 
#### Comprehensive
Data is comprehensive since it contains two months worth of data. 
####  Current
Data is current as it was collected in 2016.
#### Cited
The data is cited and gathered directly from the thirty individuals. 

Out of the available data, I chose "dailyActivity_merged.csv", "sleepDay_merged.csv", and "weightLogInfo_merged.csv" to use for this analysis. 

## Process 
Before importing the three datasets into Bigquery, I had to change the format of the dates in "sleepDay_merged.csv", and "weightLogInfo_merged.csv" into standard “yyyy-mm-dd" format using Excel format. 

I checked for any duplicate values in "dailyActivity_merged.csv" by checking to see if any Id and ActivityDate have repeated entries.

```
SELECT Id, ActivityDate, COUNT(*)
FROM bellabeat-sql.Bellabeat_data.daily_activity 
GROUP BY Id, ActivityDate 
HAVING COUNT(*) > 1
```

No results were returned, confirming that there are no duplicated rows in the database. 

I checked for duplicated rows in "sleepDay_merged.csv" using the same procedure. 

```
SELECT Id, SleepDay, COUNT(*)
FROM bellabeat-sql.Bellabeat_data.daily_sleep
GROUP BY Id, SleepDay 
HAVING COUNT(*) > 1
```

This code returned the values below. 

| Id	| SleepDay	| f0_ |
| :---: | :---: | :---: |
| 4388161847 |	2016-05-05 |	2 |
| 4702921684 |	2016-05-07 |	2 |
| 8378563200 |	2016-04-25 |	2 |

Since duplicate rows were confirmed, I ran the code below to remove any duplicated rows. 

```
CREATE OR REPLACE TABLE bellabeat-sql.Bellabeat_data.daily_sleep
AS
SELECT DISTINCT * FROM bellabeat-sql.Bellabeat_data.daily_sleep
```

Finally, checked for duplicated rows in "weightLogInfo_merged.csv".

```
SELECT Id, Date, COUNT(*)
FROM bellabeat-sql.Bellabeat_data.daily_weight
GROUP BY Id, Date 
HAVING COUNT(*) > 1
```

There were no duplicated rows in "weightLogInfo_merged.csv"

### Cleaning & Transformation 
https://github.com/Tayyaba-Abro/Google-Case-Study-Bellabeat-Smart-Device-Usage?tab=readme-ov-file
https://www.kaggle.com/code/sayantanbagchi/bellabeat-case-study-sql-and-tableau
