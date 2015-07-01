	--create table owssvr
	--(
	--CourseName varchar(100),
	--Slots_Enrolled_Cap	varchar(50),
	--CBO1Name varchar(100),	
	--CBO1Slots int,
	--CBO2Name varchar(100),	
	--CBO2Slots int,
	--CBO3Name varchar(100),	
	--CBO3Slots int,
	--CBO4Name varchar(100),	
	--CBO4Slots int,
	--CBO5Name varchar(100),	
	--CBO5Slots int,
	--CBO6Name varchar(100),	
	--CBO6Slots int,
	--CBO7Name varchar(100),	
	--CBO7Slots int,
	--CBO8Name varchar(100),	
	--CBO8Slots int,
	--)

	--insert into owssvr(CourseName,CBO1Name,CBO1Slots,CBO2Name,CBO2Slots,CBO3Name,CBO3Slots,CBO4Name,CBO4Slots,CBO5Name,CBO5Slots,CBO6Name,CBO6Slots,CBO7Name,CBO7Slots,CBO8Name,CBO8Slots) SELECT 

	with cbo
	as
	(
	select Coursename,CBO1Name as CBOName,CBO1Slots as CBOSlots from owssvr
	union all
	select Coursename,CBO2Name,CBO2Slots from owssvr
	union all
	select Coursename,CBO3Name,CBO3Slots from owssvr
	union all
	select Coursename,CBO4Name,CBO4Slots from owssvr
	union all
	select Coursename,CBO5Name,CBO5Slots from owssvr
	union all
	select Coursename,CBO6Name,CBO6Slots from owssvr
	union all
	select Coursename,CBO7Name,CBO7Slots from owssvr
	union all
	select Coursename,CBO8Name,CBO8Slots from owssvr
	)
	select cboname,totalslots,STUFF(
	(select ','+LEFT(Coursename,11) from cbo where cboname=a.CBOName for xml path(''))
	,1,1,'') from
	(
	select cboname,SUM(cboslots) as totalslots from cbo
	where cboname <> '' and cboname<>'.'
	group by cboname
	) a
	order by cboname


	
	



