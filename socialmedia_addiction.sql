use project;

#1. Count/Percent of total students who are addicted (addicted_score >= 7 as addicted).
select count(*) 
from socialmedia_addiction
where addicted_score >= 7;

WITH addicted_count AS (
SELECT COUNT(*) AS addicted
FROM socialmedia_addiction
WHERE addicted_score >= 7),
total_count AS (
SELECT COUNT(*) AS total
FROM socialmedia_addiction)
SELECT (a.addicted * 100.0) / t.total AS addiction_percentage
FROM addicted_count a, total_count t;

#2. What is the average addicted score and average daily usage across all students?
select avg(addicted_score) as avg_addicted_score
from socialmedia_addiction;

select round(avg(avg_daily_usage_hours), 1) as avg_daily_usage
from socialmedia_addiction;

#3. What is the average addiction score and usage hours by gender?
select gender, avg(addicted_score) as avg_addicted_score
from socialmedia_addiction
group by gender;

select gender, round(avg(avg_daily_usage_hours), 1) as avg_daily_usage
from socialmedia_addiction
group by gender;

#4.What is the addiction rate across different academic levels?
select academic_level, avg(addicted_score) as avg_addicted_score
from socialmedia_addiction
group by academic_level;

select academic_level, round(avg(avg_daily_usage_hours), 1) as avg_daily_usage
from socialmedia_addiction
group by academic_level;

#5.What are the average addiction and usage hours by age group?
select age, avg(addicted_score) as avg_addicted_score
from socialmedia_addiction
group by age;

select age, round(avg(avg_daily_usage_hours), 1) as avg_daily_usage
from socialmedia_addiction
group by age;

#6.Which social media platforms are most used by addicted students?
select distinct most_used_platform
from socialmedia_addiction
where addicted_score >= 7;

#8. What is the average sleep and usage hours for each platform?
select most_used_platform, avg(sleep_hours_per_night) as avg_sleep
from socialmedia_addiction
group by most_used_platform;

select most_used_platform, round(avg(avg_daily_usage_hours), 1) as avg_usage
from socialmedia_addiction
group by most_used_platform;

#9. Which platform users have the highest average mental health scores?
select  most_used_platform, max(mental_health_score)
from socialmedia_addiction
group by most_used_platform;

#10. Compare average addicted scores by sleep category.
select sleep_category, avg(addicted_score) as avg_score
from socialmedia_addiction
group by sleep_category;

#11. Do students who sleep <6 hours have higher mental health risk?
select sleep_hours_per_night, avg(mental_health_score)
from socialmedia_addiction
where sleep_hours_per_night < 6
group by sleep_hours_per_night;

#12. How many addicted students say social media affects academics?
select count(*)  
from socialmedia_addiction
where addicted_score >=7 and affects_academic_performance = "Yes";

#13. What’s the average usage time of students who report academic impact?
select round(avg(avg_daily_usage_hours), 1)
from socialmedia_addiction
where affects_academic_performance = "Yes";

#14.  Breakdown of academic impact by platform.
select most_used_platform, count(affects_academic_performance)
from socialmedia_addiction
where affects_academic_performance = "yes"
group by most_used_platform;

#15. Do addicted students report more social conflicts?
select round(avg(conflicts_over_social_media), 1)  as avg_conflicts
from socialmedia_addiction
where addicted_score>=7;

select round(avg(conflicts_over_social_media), 1)  as avg_conflicts
from socialmedia_addiction
where addicted_score<7;

#16. Which relationship status has the highest conflict average?
select relationship_status, round(avg(conflicts_over_social_media), 1)  as avg_conflicts
from socialmedia_addiction
group by relationship_status;

#17.  Identify high-risk students based on these conditions
select student_id, gender, academic_level, most_used_platform
from socialmedia_addiction
where avg_daily_usage_hours > 5;

select student_id, gender, academic_level, most_used_platform
from socialmedia_addiction
where sleep_hours_per_night < 6;

select student_id, gender, academic_level, most_used_platform
from socialmedia_addiction
where mental_health_score >= 7;

select student_id, gender, academic_level, most_used_platform
from socialmedia_addiction
where addicted_score >= 7;

#18. What usage categories have the most addicted students?
select usage_category, max(addicted_score) as max_score
from socialmedia_addiction
group by usage_category
having max(addicted_score) >= 7;

#19.Which country has the highest average addicted score?
select country, avg(addicted_score) as avg_score
from socialmedia_addiction
group by country
order by avg_score desc
limit 1;

select * from socialmedia_addiction;