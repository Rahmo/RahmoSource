ALTER TABLE Student
Add Orientation2 varchar(50)
GO
update student set Orientation2= CASE WHEN Orientation=0 then 'No'  when Orientation=1 then 'Yes' End FROM Student 
GO
EXEC sp_rename
    @objname = 'Student.Orientation',
    @newname = 'Orientation3',
    @objtype = 'COLUMN'
GO

EXEC sp_rename
    @objname = 'Student.Orientation2',
    @newname = 'Orientation',
    @objtype = 'COLUMN'
    GO
select  orientation From student

