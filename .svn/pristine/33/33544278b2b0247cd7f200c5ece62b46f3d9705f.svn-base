create table Test
(
	ID int identity(1,1),
	Name varchar(100) default('Hui Li'),
	Name2 as '计算列 '+Name,
	RN rowversion,
	UI uniqueidentifier,
	Note varchar(100) NULL
)
DECLARE @TMP table(id int,name varchar(100),name2 varchar(100))
INSERT INTO Test(Name,UI,Note)
OUTPUT inserted.ID,inserted.Name,inserted.Name2 INTO @TMP
VALUES('Microsoft Exam',NEWID(),'test note')
select * from @TMP

insert into test(name,note) values('jack','test'),('lily','test2')

insert into test(name,note) select 'jack','test' union all select 'lily','test2'

insert into test(name) values('test11')

SET IDENTITY_INSERT test ON
insert into test(id,name)values(10,'test10')
SET IDENTITY_INSERT test OFF

INSERT INTO Test(UI) VALUES(NEWID())
INSERT INTO TEST DEFAULT VALUES
select * from test


INSERT INTO Test(Name,UI,Note)
OUTPUT inserted.ID,inserted.Name,inserted.Name2
VALUES('Microsoft Exam',NEWID(),'test note')

SELECT * FROM TEST

UPDATE TEST SET NAME='JACKKKKKKKKKKKKKKKKK' 
OUTPUT inserted.Name,deleted.Name
WHERE ID=1 
