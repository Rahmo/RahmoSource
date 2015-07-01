declare @myxml xml
set @myxml='<Root><Name>Hui Li</Name></Root>'
SELECT @myxml.query('/Root/Name')
---
create table testxml(id int identity(1,1),name varchar(100),xmlcontent xml)
insert into testxml(name,xmlcontent)
select 'row1',N'<Root>
	<Product ID="1" Name="乐可乐可的部落格">
		<Remark>
		  <R1>通过微软认证考试70-461</R1>
		  <R2>SQL SERVER 2012</R2>
		</Remark>
	</Product>
	<Product ID="2" Name="XML数据类型方法">
		<Remark>
		  <R1>QUERY()</R1>
		  <R2>EXIST()</R2>
		</Remark>
	</Product>
</Root>'
union all
select 'row2',N'<Root>
	<Product ID="3" Name="SQL SERVER 2012">
		<Remark>
		  <R1>高效SQL查询</R1>
		  <R2>SQL优化</R2>
		</Remark>
	</Product>
	<Product ID="4" Name="XML数据类型">
		<Remark>
		  <R1>XML命名空间</R1>
		  <R2>XML架构</R2>
		</Remark>
	</Product>
</Root>'

select xmlcontent.query('/Root/Product/Remark/R1') from testxml
GO
WITH XMLNAMESPACES (
   'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription' AS PD,
   'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain' AS wm)

select xmlcontent.query('<Product ID="{ /PD:Product[1]/@ID }" />') from testxml

select name from testxml for xml auto,xmldata

