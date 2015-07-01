select c.Name,c.ID as CBOID,cr.Subject,cr.CatalogNumber,cr.ClassSection,cr.InstructorName,cr.TermDescription,ServiceDate,HoursServed,ContactType, Quater_Year from servicehours as s
inner join cbo as c
on c.id=s.CBO_ID
inner join course as cr
on cr.id=s.CourseID
 where studentid=2205 
 and not exists(select * from Student2CBO where StudentID=s.StudentID and CBOID=c.ID)
 order by courseid,Quater_Year,cbo_id




 