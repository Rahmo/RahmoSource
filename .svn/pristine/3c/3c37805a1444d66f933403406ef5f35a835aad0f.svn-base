create table MCI_TimeLog
(
	ID int identity(1,1),
	UserID int not null,
	[HoursAtSite] float,
	[Training_Reflection_Hours] float,
	LogDate datetime,
	[Description] varchar(1000),
	SupervisorInitials varchar(50),
	IsAuthorized BIT,
	CONSTRAINT PK_MCI_TimeLog_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)

create table MCI_Period(
	ID int identity(1,1),
	FromDate datetime,
	ToDate datetime,
	CONSTRAINT PK_MCI_Period_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)