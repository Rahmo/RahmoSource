select * from CalendarEvent


create table CalendarEvent(
	ID int identity(1,1),
	UserID int not null,
	IsApproved bit,
	Title varchar(200) not null,
	Allday bit,
	Start datetime,
	[End] Datetime,
	Url varchar(200),
	ClassName varchar(100),
	Editable bit,
	StartEditable bit,
	DurationEditable bit,
	Color varchar(50),
	BackgroundColor varchar(50),
	BorderColor varchar(50),
	TextColor varchar(50),
	[EventType] int,
	Notes varchar(1000),
	CONSTRAINT PK_CalendarEvent_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
alter table calendarevent
add DriverInfo varchar(1000)

