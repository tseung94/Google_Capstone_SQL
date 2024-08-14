-- Distance/Calories/Steps per Day
SELECT FORMAT_DATE('%A', ActivityDate) AS day,
SUM(TotalDistance) AS DistancePerDay,
SUM(Calories) AS CaloriesPerDay, 
SUM(TotalSteps) as StepsPerDay,
FROM bellabeat-sql.Bellabeat_data.daily_activity 
GROUP BY day      

-- Types of Activity by ID         
SELECT Distinct Id, 
SUM(SedentaryMinutes) as sedentary_mins,
SUM(LightlyActiveMinutes) as lightly_active_mins,
SUM(FairlyActiveMinutes) as fairly_active_mins, 
SUM(VeryActiveMinutes) as very_active_mins
From bellabeat-sql.Bellabeat_data.daily_activity 
Group by Id

-- Average Sleep per Day
SELECT FORMAT_DATE('%A', SleepDay) AS day,
AVG(TotalMinutesAsleep) AS SleepPerDay,
FROM bellabeat-sql.Bellabeat_data.daily_sleep
GROUP BY day   

-- Average Weight (LBs) & BMI Overtime
SELECT DATE as Date, 
AVG(WeightPounds) as AverageWeight,
AVG(BMI) as AverageBMI, 
FROM bellabeat-sql.Bellabeat_data.daily_weight
GROUP BY Date
ORDER BY Date
