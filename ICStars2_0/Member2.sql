CREATE TABLE Member2
(
	ID INT IDENTITY(1999,1) PRIMARY KEY,
	CampusConnectID VARCHAR(100) NOT NULL,
	[Status] BIT NOT NULL DEFAULT(0),
	Email VARCHAR(200),
	IP VARCHAR(200),
	Phone varchar(50),
	OfficeHours varchar(100),
	/*new*/
	FirstName varchar(50),
	LastName varchar(50),
	EmplID varchar(50),
	Department varchar(200),
	Location varchar(200),
	JobTitle varchar(200),
	OfficePhone varchar(50),
	Fax varchar(50),
	SupervisorFirstName varchar(50),
	SupervisorLastName varchar(50),
	SupervisorEmail varchar(200),
	/*new end*/
	RegisterDate DATETIME NOT NULL DEFAULT(GETDATE()),
	LastLoginDate DATETIME
)


CREATE UNIQUE NONCLUSTERED INDEX [NIX_Member2_CampusConnectID] ON [Member2] 
(
	CampusConnectID ASC
)