--WITH test
--as
--(
--	select '乐可乐可的部落格' as name,10 as score
--	UNION ALL
--	select '乐可乐可的部落格',15
--	UNION ALL
--	select '乐可乐可的部落格',20
--	UNION ALL
--	select '微软认证',30
--	UNION ALL
--	select '微软认证',40
--	UNION ALL
--	select '微软认证',40
--)
--select name,score
--,FIRST_VALUE(score)over(order by name) as fst
--,LAST_VALUE(score)over(order by name) as Lst
--from test

--select ROW_NUMBER() over(order by score) as rownum
--,score
--,LEAD(score) over(order by score) as nextscore1
--,LEAD(score,1) over(order by score) as nextscore2
--,LEAD(score,1,0) over(order by score) as nextscore3
--,LEAD(score,2) over(order by score) as nextscore4
--from test


--select ROW_NUMBER() over(order by score) as rownum
--,score,cume_dist()over(order by score) as cum
--,PERCENT_RANK() over(order by score) as per_rnk
--,RANK() over(order by score) as rnk
--from test
/*
GO
WITH test
as
(
    select NULL as score
    UNION ALL
    select 10
    UNION ALL
    select 20
    UNION ALL
    select 30
    UNION ALL
    select 40
    UNION ALL
    select 50
)
select ROW_NUMBER() over(order by score) as rownum
,score
,LEAD(score) over(order by score) as nextscore1
,LEAD(score,1) over(order by score) as nextscore2
,LEAD(score,1,0) over(order by score) as nextscore3
,LEAD(score,2) over(order by score) as nextscore4
,LAG(score) over(order by score) as previousscore1
,LAG(score,1) over(order by score) as previousscore2
,LAG(score,1,0) over(order by score) as previousscore3
,LAG(score,2) over(order by score) as previousscore4
from test

*/
WITH test
as
(
	select N'乐可乐可的部落格' as name,10 as score
	UNION ALL
	select N'乐可乐可的部落格',20
	UNION ALL
	select N'乐可乐可的部落格',30
	UNION ALL
	select N'乐可乐可的部落格',40
	UNION ALL
	select N'乐可乐可的部落格',50
	UNION ALL
	select N'微软认证',60
	UNION ALL
	select N'微软认证',70
	UNION ALL
	select N'微软认证',80
	UNION ALL
	select N'微软认证',90
	UNION ALL
	select N'微软认证',100
)
select name,score
,PERCENT_RANK() over(partition by name order by score) as per_rnk
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY score) over(partition by name) as percont0_5
,PERCENTILE_CONT(0.6) WITHIN GROUP (ORDER BY score) over(partition by name) as percont0_6
,PERCENTILE_CONT(0.7) WITHIN GROUP (ORDER BY score) over(partition by name) as percont0_7
,PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY score) over(partition by name) as percont0_75
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY score) over(partition by name) as perdist0_5
,PERCENTILE_DISC(0.6) WITHIN GROUP (ORDER BY score) over(partition by name) as perdist0_6
,PERCENTILE_DISC(0.7) WITHIN GROUP (ORDER BY score) over(partition by name) as perdist0_7
,PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY score) over(partition by name) as perdist0_75
from test

select 10/0.25*0.1
select 10/(0.75-0.5)*(0.7-0.5)
select 10/(0.75-0.5) * 0.10
select (40-30)/(0.75-0.5)*0.1
--ALTER DATABASE ICStars2_0
--SET COMPATIBILITY_LEVEL = 110
