
--select c.ID as CBOID,c.Name as CBOName,cs.id as CourseID, cs.TermDescription+'-'+cs.Subject+'-'+cs.CatalogNumber+'-'+cs.ClassSection+'-'+cs.InstructorName as CourseName, cs.Title as CourseTitle from cbo c
--left join student2cbo s2c
--on c.id=s2c.CBOID
--inner join student s
--on s.id=s2c.StudentID
--inner join course cs
--on s.CourseID=cs.ID
--where c.ID in (903,1204,1125,1130,1091,845,1122,1266,1253,977)


WITH tmp
as
(
select c.ID as CBOID,c.Name as CBOName,s.CourseID from cbo c
left join student2cbo s2c
on c.id=s2c.CBOID
inner join student s
on s.id=s2c.StudentID
where c.ID in (903,1204,1125,1130,1091,845,1122,1266,1253,977)
group by c.id,c.name,s.CourseID
)
select t.CBOID,t.CBOName,c2.totalstudent,cs.TermDescription+'-'+cs.Subject+'-'+cs.CatalogNumber+'-'+cs.ClassSection+'-'+cs.InstructorName as CourseName,cs.Title from tmp t
inner join course cs
on t.courseid=cs.id
inner join (select courseid,count(*) as totalstudent from student group by courseid) c2
on c2.CourseID=cs.id
order by t.cboname



select courseid from student where id in
(select studentid from Student2CBO where cboid=1130)


select * from course where id in(71,22,298)










