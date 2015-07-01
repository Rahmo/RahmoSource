
declare @order table(orderid int,productid int,quantity int)
declare @product table(id int,name text)
insert into @order
select 122 as orderid, 1 as productid,10 as quantity
    union all
    select 123,1 as productid,100 as quantity
    union all
    select 124,2,20
    union all
    select 125,3 ,5
insert into @product 
select 1 ,N'乐可乐可的部落格'
    union all
    select 2,N'微软认证考试70-461'
select * from @product as product,@order as [order] where [order].productid=product.id for xml auto