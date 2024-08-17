-- Average Distance/Calories/Steps per Day
SELECT FORMAT_DATE('%A', ActivityDate) AS day,
AVG(TotalDistance) AS AvgDistancePerDay,
AVG(Calories) AS AvgCaloriesPerDay, 
AVG(TotalSteps) as AvgStepsPerDay,
FROM bellabeat-sql.Bellabeat_data.daily_activity 
GROUP BY day      

-- Types of Activity by Day         
SELECT FORMAT_DATE('%A', ActivityDate) AS day,
AVG(SedentaryMinutes) as AvgSedMins,
AVG(LightlyActiveMinutes) as AvgLightActiveMins,
AVG(FairlyActiveMinutes) as AvgFairActiveMins, 
AVG(VeryActiveMinutes) as AvgVeryActiveMins,
From bellabeat-sql.Bellabeat_data.daily_activity 
Group by day

-- Average Sleep per Day (Mins)
SELECT FORMAT_DATE('%A', SleepDay) AS day,
AVG(TotalMinutesAsleep) AS AvgSleepPerDayMins,
FROM bellabeat-sql.Bellabeat_data.daily_sleep
GROUP BY day   

-- Average Weight (LBs) & BMI 
SELECT DATE as Date, 
AVG(WeightPounds) as AvgWeightLBs,
AVG(BMI) as AverageBMI, 
FROM bellabeat-sql.Bellabeat_data.daily_weight
GROUP BY Date
ORDER BY Date
