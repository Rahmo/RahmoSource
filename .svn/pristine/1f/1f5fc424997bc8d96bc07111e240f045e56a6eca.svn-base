
alter table Student2CBO
drop CONSTRAINT  DF__Student2C__Serve__1F2E9E6D

alter table Student2CBO
add ServedTotalHours float default(0)
GO

alter table student
add [Type] int

alter table student
drop column CBO_ID_bak
alter table student
drop column Quater_Year_bak
alter table student
drop column RequiredServeHours_bak
alter table student
drop column ServedHours_bak


WITH HoursTable(StudentID, TotalHours)
AS
(
	SELECT StudentID, SUM(HoursServed)
	FROM ServiceHours
	GROUP BY StudentID
)
INSERT INTO Student2CBO(StudentID,CBOID,Quater_Year,ServedTotalHours,RequiredHours)
select ID,CBO_ID_bak,Quater_Year_bak,h.TotalHours,RequiredServeHours_bak from student as s
left join HoursTable as h on h.StudentID=s.id
where NOT EXISTS(
	select * from Student2CBO where StudentID=s.id and CBOID=s.CBO_ID_bak and Quater_Year=s.Quater_Year_bak
)


select * from Student2CBO
delete from Student2CBO where studentid<>2267


select * from course
