select FirstName,LastName,DPU_ID,Email, ISNULL(ServedTotalHours,0),quater_year as 'Quarter' from student as s
inner join student2cbo as s2c
on s.ID=s2c.StudentID
where Quater_Year in ('Winter 2013','Fall 2012')
and [type]=0
--order by ServedTotalHours desc
