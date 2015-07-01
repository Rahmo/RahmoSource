

WITH HoursTable(StudentID,CBOID,CourseID, TotalHours)
AS
(
	SELECT StudentID,CBO_ID AS CBOID,CourseID, SUM(HoursServed)
	FROM ServiceHours
	GROUP BY StudentID,CBO_ID,CourseID
)
UPDATE Student2CBO SET ServedTotalHours=h.TotalHours
FROM Student2CBO as s2c 
inner JOIN HoursTable AS h 
ON h.StudentID=s2c.StudentID AND h.CBOID=s2c.CBOID 
inner join Student as s
on s.ID=s2c.StudentID and s.CourseID=h.CourseID


update Student2CBO set ServedTotalHours=0 

FROM Student2CBO as s2c
WHERE NOT EXISTS
(
	select null as empty from ServiceHours as sh inner join student as s on s.ID=sh.StudentID where s2c.CBOID=sh.CBO_ID and s2c.StudentID=sh.StudentID and sh.CourseID=s.CourseID
)


