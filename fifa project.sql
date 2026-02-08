-- 1 How many total matches have been played in World Cup history
select  count(*) as total_matches from WorldCupMatches

---2 What is the total number of goals scored across all World Cup matches 
select sum([home_team_goals]+[away_team_goals]) as total_goals from WorldCupMatches

--3 What is the average number of goals scored per match  
select avg(cast([home_team_goals]+[away_team_goals] as float)) as avg_goals_scored from WorldCupMatches

--4 How many matches were played in each World Cup year
select YEAR, count(*) as matches_played from WorldCupMatches
group by year 
order by year;

--5 How has average match attendance changed over different World Cup years
select year, avg(attendance) as avg_attendance 
from WorldCupMatches
group by year
order by year;

-- 6 Which matches had the highest attendance? (Top 5)
select top 5 year, 
[home_team_goals],[away_team_goals], attendance
from WorldCupMatches order by  attendance desc;

-- 7 Which tournament stages have the highest average goals scored?
select 
stage,
AVG([home_team_goals] + [away_team_goals]) as avag_goals from WorldCupMatches
group by stage 
order by AVG([home_team_goals] + [away_team_goals])  desc;

-- 8 Which matches had the highest goal difference? (Top 5)
select top 5 
year,
[home_team_goals],[away_team_goals],
abs([home_team_goals]-[away_team_goals]) as goal_difference from WorldCupMatches
order by goal_difference desc ;

--9 Which stadiums hosted the most World Cup matches?
select top 5 stadium,
count(*) as matches_hosted from WorldCupMatches
group by stadium 
order by matches_hosted desc;