


declare @i int
set @i=1
while @i<=1000
begin
	insert into tester(ID,Name) select @i,'tester'+CAST(@i as varchar)
	set @i+=1
end

declare @i int
set @i=1
while @i<=100000
begin
	insert into TestAsNoTracking(ID,TesterID,Name,Email,CreateDate) select @i,@i/100,'Name'+CAST(@i as varchar),'Email@leewhoee.com'+CAST(@i as varchar),DATEADD(hour,@i, getdate())
	set @i+=1
end

select DATEADD(hour,1, getdate())

select * from TestAsNoTracking

GO

create table TestAsNoTracking(
ID int not null,
TesterID int,
Name varchar(50) not null,
Email varchar(200),
CreateDate datetime,
CONSTRAINT PK_TestAsNoTracking_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
create table Tester(
ID int not null,
Name varchar(50) not null,
CONSTRAINT PK_Tester_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
