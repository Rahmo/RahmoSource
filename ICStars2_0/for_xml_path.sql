select 'Hui Li' for xml path
select 'Hui Li' as [name] for xml path
select 'Hui Li' as [@name] for xml path
select 'Hui' as [name/first] for xml path

select 'Hui' as [name/first],'Li' as [name/last] for xml path
select 'Hui' as [name/first],'Chicago' as [address],'Li' as [name/last] for xml path
--
select 'Hui' as [*],' ' as [*], 'Li' as [*] for xml path
select 'Hui',' ', 'Li' for xml path
declare @table table(name varchar(50), xmlcontent xml)
insert into @table select 'Hui', '<root><person></person></root>'
select name,xmlcontent as [*] from @table for xml path
------


select 'Hui' as [first/text()],'Li' as [last/node()],'Hui Li' as [fullname/comment()],'test' as "processing-instruction(PI)" for xml path


----
with T
as
(
	select 11 as id
	union all
	select 22
	union all
	select 33
)
select id as [data()] from T for xml path ('')

select 'hui' as [name],null as [address] for xml path ,ELEMENTS XSINIL


-----
WITH XMLNAMESPACES(N'乐可乐可的部落格' as a)
SELECT 1 as 'a:b'
FOR XML PATH
-----

select 'Hui' for xml path ('root')












select 'test' for xml raw,elements


select * from TestPivot for xml raw,elements
select 'aaa' for xml auto,elements