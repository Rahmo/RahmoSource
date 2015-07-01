

--DECLARE @DROPSQL VARCHAR(MAX);
--SET @DROPSQL='';
--SELECT @DROPSQL =@DROPSQL + 'IF OBJECT_ID ('''+name+''') IS NOT NULL DROP TABLE ['+name+'];' FROM sys.tables
--ORDER BY name
--EXEC (@DROPSQL)
--IF OBJECT_ID('cbo') IS NOT NULL
--DROP table cbo
--GO
CREATE TABLE [CBO] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (200) NOT NULL,
    [SLC]              VARCHAR (100) DEFAULT ('') NOT NULL,
    [ContactFristName] VARCHAR (50)  NULL,
    [ContactLastName]  VARCHAR (50)  NULL,
    [ContactEmail]     VARCHAR (250) NULL,
    [ContactPhone]     VARCHAR (250) NULL,
    [Address]          VARCHAR (250) NULL,
	Mission varchar(1000),
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

--alter table cbo
--add Mission varchar(1000)
GO
--IF OBJECT_ID('Course') IS NOT NULL
--DROP table Course
--GO
CREATE TABLE [Course] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [TermDescription]        VARCHAR (100)  NULL,
    [Subject]                VARCHAR (50)   NULL,
    [CatalogNumber]          VARCHAR (50)   NULL,
    [ClassSection]           VARCHAR (50)   NULL,
    [Title]                  VARCHAR (200)  NOT NULL,
    [InstructorName]         VARCHAR (100)  NULL,
    [BestEmail]              VARCHAR (200)  NULL,
    [Staff]                  VARCHAR (100)  NOT NULL,
    [Type]                   INT            NULL,
    [Term]                   VARCHAR (50)   NULL,
    [College]                VARCHAR (100)  NULL,
    [Career]                 VARCHAR (50)   NULL,
    [CrseCareerDescr]        VARCHAR (100)  NULL,
    [SessionCode]            VARCHAR (50)   NULL,
    [SessionCodeDescr]       VARCHAR (100)  NULL,
    [SubjectDescr]           VARCHAR (100)  NULL,
    [ClassNumber]            VARCHAR (50)   NULL,
    [Component]              VARCHAR (50)   NULL,
    [RequirementDesignation] VARCHAR (50)   NULL,
    [RqmntDesigDescr]        VARCHAR (100)  NULL,
    [CrseAttr]               VARCHAR (50)   NULL,
    [CrseAttrValue]          VARCHAR (50)   NULL,
    [CrseTypoffCd]           VARCHAR (50)   NULL,
    [CrseTypoffDescr]        VARCHAR (500)  NULL,
    [InstructorEmplid]       VARCHAR (50)   NULL,
    [InstructionMode]        VARCHAR (50)   NULL,
    [Location]               VARCHAR (50)   NULL,
    [LocationDescr]          VARCHAR (500)  NULL,
    [FacilityRoom]           VARCHAR (50)   NULL,
    [StartDate]              DATETIME       NULL,
    [EndDate]                DATETIME       NULL,
    [Days]                   VARCHAR (50)   NULL,
    [MeetingTimeStart]       VARCHAR (50)   NULL,
    [MeetingTimeEnd]         VARCHAR (50)   NULL,
    [EnrlStatus]             VARCHAR (50)   NULL,
    [CrseTopicId]            FLOAT (53)     NULL,
    [CrseTopicDescr]         VARCHAR (500)  NULL,
    [ClassNotesDescrlong]    VARCHAR (1000) NULL,
    [DateAddedIntoPS]        DATETIME       NULL,
    [Capacity]               INT            NULL,
    [Enrlollment]            INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);
alter table course
add PlacementDate varchar(100)



GO
--IF OBJECT_ID('Student') IS NOT NULL
--Drop table Student
--GO

/*StudentInformationSheet*/
CREATE TABLE Student
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CourseID INT not null,/*Course Name and Number*/
	CBO_ID int not null,/*Service Site*/
	Staff varchar(100) not null,
	SLC varchar(100) not null,
	CreateDate datetime DEFAULT(getdate()),
	Quater_Year VARCHAR(50),
	AvailableDateTime VARCHAR(1000),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DPU_ID int NOT NULL,
	Email VARCHAR(200),
	PrimaryPhone VARCHAR(50),
	AlternatePhone VARCHAR(50),
	ReachMethod VARCHAR(50),/*Phone Email*/
	Gender VARCHAR(50),
	PermanentAddress VARCHAR(250),
	City VARCHAR(50),
	[State] VARCHAR(50),
	ZipCode VARCHAR(50),
	Name_Of_Emergency_Contact VARCHAR(200),
	TelephoneNumber VARCHAR(200),
	School VARCHAR(200),
	Major VARCHAR(200),
	Expected_Graduation_Date Datetime,
	ClassStanding VARCHAR(200),
	CommunityServiceStudies VARCHAR(50),/*Minor   Scholar*/
	I_have_taken_Service_Learning_Course VARCHAR(500),
	I_would_like_to_add_my_email_to_Steans_Center_listserv BIT,
	RequiredServeHours int not null default(0),
	Orientation varchar(50),
	[Type] int,
	LastUpdateTime datetime DEFAULT(GETDATE())
	
)
GO


/****** Object:  Index [NIX_Student_CourseID_DPU_ID]    Script Date: 11/20/2012 2:15:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [NIX_Student_CourseID_DPU_ID] ON [dbo].[Student]
(
	[CourseID] ASC,
	[DPU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


--IF OBJECT_ID('Student2CBO') IS NOT NULL
--DROP table Student2CBO
--GO
CREATE TABLE [Student2CBO](
	[StudentID] [int] NOT NULL,
	[CBOID] [int] NOT NULL,
	RequiredHours int,
	Quater_Year varchar(50),
    ServedTotalHours float default(0),
	CreateDate datetime,

	PRIMARY KEY 
	(
		[StudentID] ,
		[CBOID]
	)
) 

GO

create table Program
(
	ID int identity(1300,1) not null,
	Abbr varchar(100),
	Name varchar(100) not null,
	PRIMARY KEY 
	(
		ID
	)
)
--insert into program (Abbr, Name) select 'SLC','Service Learning Course'
--insert into program (Abbr, Name) select 'CSI','Catholic Schools Internship'
--insert into program (Abbr, Name) select 'CPI','Community Partners Internship'
--insert into program (Abbr, Name) select 'CSS','Community Service Scholarship'
--insert into program (Abbr, Name) select 'CSIIS','CSI - Intern Section'
--insert into program (Abbr, Name) select 'CSSSS','CSS - Scholar Section'
--insert into program (Abbr, Name) select 'CSSPAXI','CSS/PAX Internship'
--insert into program (Abbr, Name) select 'IC','Intercambio'
--insert into program (Abbr, Name) select 'JS','Jumpstart'
--insert into program (Abbr, Name) select 'MCI','McCormick Community Internship'
--insert into program (Abbr, Name) select 'MI','Merida Internship'
--insert into program (Abbr, Name) select 'PSP','Public Schools Partnership'
--insert into program (Abbr, Name) select 'Other','Other'
GO
create table Student2Program
(
	[StudentID] [int] NOT NULL, 
	[ProgramID] [int] NOT NULL,
	PRIMARY KEY 
	(
		[StudentID] ,
		[ProgramID]
	)
)

--IF OBJECT_ID('ServiceHours') IS NOT NULL
--DROP table ServiceHours
--GO
CREATE TABLE [dbo].[ServiceHours] (
    [ID]                    INT            IDENTITY (1, 1) NOT NULL,
    [CBO_ID]                INT            NOT NULL,
    [CourseID]              INT            NOT NULL,
    [StudentID]             INT            NOT NULL,
    [ServiceDate]           DATETIME       NULL,
    [HoursServed]           FLOAT (53)     NOT NULL,
    [ContactType]           VARCHAR (50)   NULL,
    [Notes]                 VARCHAR (1000) NULL,
    [Quater_Year]           VARCHAR (50)   NULL,
    [EngagementDescription] VARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);
ALTER table servicehours
add MemberID int
alter table servicehours
add LastEditorID int
select sh.*,m1.FirstName+' '+m1.LastName+'('+m1.Email+')' as Creator,m2.FirstName+' '+m2.LastName+'('+m2.Email+')' as LastEditor from ServiceHours as sh 
left join Member as m1 on m1.ID=sh.MemberID left join Member as m2 on m2.ID=sh.LastEditorID
where StudentID=3157
GO
--IF OBJECT_ID('Member') IS NOT NULL
--Drop table Member
--GO
/*
CREATE TABLE Member
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	UserName VARCHAR(100) NOT NULL,
	[Password] VARCHAR(50) NOT NULL,
	[Status] BIT NOT NULL DEFAULT(0),
	Email VARCHAR(200),
	IP VARCHAR(200),
	RegisterDate DATETIME NOT NULL DEFAULT(GETDATE()),
	LastLoginDate DATETIME NOT NULL DEFAULT(GETDATE())
)*/
/*Modify 10-25-12*/
CREATE TABLE Member
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
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


CREATE UNIQUE NONCLUSTERED INDEX [NIX_Member_CampusConnectID] ON [Member] 
(
	CampusConnectID ASC
)
GO
--IF OBJECT_ID('[Role]') IS NOT NULL
--DROP table [Role]
--GO
CREATE TABLE [Role]
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	RoleType varchar(50)
)
GO
--IF OBJECT_ID('[Member2Role]') IS NOT NULL
--DROP TAble Member2Role
--GO
CREATE TABLE Member2Role
(
	MemberID INT NOT NULL,
	RoleID INT NOT NULL,
	PRIMARY KEY
	(
		MemberID,
		RoleID
	)
	
)

select * from CalendarEventRepeatSettings

create table CalendarEventRepeatSettings(
	CalendarEventID int not null,
	StartDate Datetime not null,
	EndDate Datetime,
	FrequencyType int not null,
	FrequencyValue int not null,
	WeekdaysIfWeekly varchar(100),
	PRIMARY KEY
	(
		CalendarEventID
	)
)
create table CalendarEventDeletedDates
(
	DeletedDate datetime not null,
	CalendarEventID int not null,
	PRIMARY KEY
	(
		DeletedDate,
		CalendarEventID
	)

)
select * from CalendarEventRepeatSettings
