Create Table EventRequestForm
(
	ID int identity(1323,1) primary key,
	ContactName varchar(50) not null,
	SupervisorEmail varchar(250) not null,
	Program varchar(100),
	EventDate datetime,
	EventTime varchar(100),
	EventTitle varchar(100),
	EventLocation varchar(100),
	NumberOfAttendees int,
	ChartwellsItems varchar(MAX),
	ChartwellsNotes varchar(1000),
	StaplesItems varchar(MAX),
	StaplesNotes varchar(1000),
	PhotographerRequired varchar(50),
	PhotographerRequiredDate datetime,
	PhotographerRequiredTime varchar(100),
	PhotographerRequiredLocation varchar(100),
	DistributionServicesCopiesNeededBy datetime,
	DistributionServicesColorCopies int,
	DistributionServicesBWCopies int,
	DistributionServicesPaperSidedType varchar(100),
	DistributionServicesPaperQuality varchar(50),
	RequestDate datetime,
	[Status] int default(0)
)

ALTER TABLE EventRequestForm
add [Status] int default(0)