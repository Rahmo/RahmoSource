with [order]
as
(
	select 122 as orderid, 1 as productid,10 as quantity
	union all
	select 125,1 as productid,100 as quantity
	union all
	select 123,2,20
	union all
	select 124,3 ,5
),
 product
as
(
	select 1 as id,N'乐可乐可的部落格' as name
	union all
	select 2,N'微软认证考试70-461'
)
select * from product,[order] where [order].productid=product.id 
order by orderid for xml auto
--declare @xml table(xid int,xname varchar(50),xmlcol xml);
--insert into @xml select 1,'第一行','<myroot>
--  <row id="1" name="乐可乐可的部落格" />
--  <row id="2" name="微软认证考试70-461" />
--  <row id="3" />
--</myroot>'
--insert into @xml select 2,'第二行','<myroot>
--  <row id="4" name="XML数据" />
--  <row id="5" name="微软考试" />
--</myroot>'
--select xid,xname,xmlcol.query('/myroot') from @xml for xml raw

