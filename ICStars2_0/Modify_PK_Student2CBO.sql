
ALTER TABLE Student2CBO ALTER COLUMN Quater_year varchar(50) not null; 

declare @csname   varchar(100)  
set @csname=''  
   
select @csname=name
FROM sysobjects
WHERE xtype='PK' AND parent_obj=object_id('student2cbo') 

exec('alter   table   student2cbo  drop   constraint ' + @csname)  
alter   table   student2cbo  add   constraint   PK_Student2CBO_StudentID_CBOID_QuaterYear  primary   key   (StudentID,CBOID,Quater_Year)

