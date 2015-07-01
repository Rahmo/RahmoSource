Create table ProjectRequestForm
(
	ID int identity(1344,2) PRIMAry KEY,
	Title varchar(200) not null,
	ContactName varchar(100) not null,
	Program varchar(100),
	DateNeeded datetime,
	Email varchar(200),
	Phone varchar(50),
	IsTechnology BIT,
	IsDesign BIT,

	Technology varchar(1000),
	Design varchar(1000),
	CreateDate datetime

)
select * from ProjectRequestForm
