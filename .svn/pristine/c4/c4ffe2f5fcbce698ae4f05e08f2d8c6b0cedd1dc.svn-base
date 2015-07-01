with Categories(ID,ParentID,Name)
as
(
	select ID,ParentID,Name from Category where name in ('Impact Areas','Activities','sub-activ')
	UNION ALL select a.ID,a.ParentID,a.Name from Category as a join Categories as b on a.ParentID=b.ID
)
--select * from Categories
select top 10 *,(select * from Category where exists(select null as empty from Project2Category where categoryid=Category.ID and ProjectID=project.ID) for xml path('Category')) as CategoriesXml from project where exists(
	select null as empty from Project2Category where ProjectID=project.ID
	and exists(
		select null as empty from Categories where Project2Category.CategoryID=ID
	)
)
GO
with Categories(ID,ParentID,Name)
as
(
	select ID,ParentID,Name from Category where name in ('Impact Areas','Activities','sub-activ')
	UNION ALL select a.ID,a.ParentID,a.Name from Category as a join Categories as b on a.ParentID=b.ID
)
--select * from Categories
select top 10 * from project where exists(
	select null as empty from Project2Category where ProjectID=project.ID
	and exists(
		select null as empty from Categories where Project2Category.CategoryID=ID
	)
)


select *
,(select * from Category where exists(select * from Project2Category where categoryid=Category.ID and ProjectID=project.ID) for xml path('Category') ) as CategoryXml 
from project where id=1337

select count(*) from project
create table [User]
(
	ID int identity(1322,1) not null,
	UserName varchar(100) not null,
	FirstName varchar(50),
	LastName varchar(50),
	DPUID varchar(15),
	IsActivated bit,
	Email varchar(200),
	CreateDate datetime,
	LastLoginDate datetime,
	LastLoginIP varchar(100),
	constraint User_PK primary key(
	ID
	)
)


GO
create table [Role]
(
	ID int identity(1322,1) not null,
	RoleName varchar(100) not null,
	[Description] varchar(100),
	NickName varchar(100),
	--RoleGroup varchar(100) not null,
	CreateDate datetime,
	CreatorUserID int,
	constraint Role_PK primary key(
	ID
	)
)

GO
create table User2Role
(
	UserID int not null,
	RoleID int not null,
	constraint User2Role_PK primary key(
	UserID,
	RoleID
	)
)
GO
create table Course
(
	ID int identity(1322,1) not null,
    [Subject]                VARCHAR (50)   not NULL,
    [CatalogNumber]          VARCHAR (50)   not NULL,
    [Title]                  VARCHAR (200)  NOT NULL,
    [ClassSection]           VARCHAR (50)   NULL,
    [InstructorName]         VARCHAR (100)  NULL,
	constraint Course_PK primary key(
	ID
	)
)
GO
create table Project
(
	ID int identity(1322,1) not null,
	Name varchar(100) not null,
	ProjectUniqueUrl varchar(200) not null,
	CreatorUserID int not null,
	[Description] varchar(1000),
	Thumbnail varchar(500),
	PrimaryContactName varchar(50),
	PrimaryContactEmail varchar(200),
	PrimaryContactPhone varchar(50),
	Website varchar(200),
	[Address] varchar(200),
	City varchar(50),
	County varchar(50),
	[State] varchar(50),
	Nation varchar(50),
	ZipCode varchar(50),
	StartDate datetime,
	EndDate datetime,
	
	EstimatedNumberofIndividualsServed int,
	NumberofStudentsSupportedByCNSC int,
	NumberofStudentsServedAtLeast20HoursPerTerm int,
	CreateDate datetime,
	LastModifiedDate datetime,
	LastEditorUserID int,
	constraint Project_PK primary key(
	ID
	)
)

GO
CREATE UNIQUE NONCLUSTERED INDEX [NIX_Project_ProjectUniqueUrl] ON [Project]
(
	ProjectUniqueUrl
) 
--GO
--CREATE UNIQUE NONCLUSTERED INDEX [NIX_Project_Name] ON [Project]
--(
--	Name
--) 
GO
CREATE FULLTEXT CATALOG Commengdpu_Fulltext_Catalog AS DEFAULT
GO
CREATE FULLTEXT INDEX ON Project(Name,[Address],City,County,[State],Nation,ZipCode) 
   KEY INDEX [Project_PK] 
   WITH STOPLIST = SYSTEM,CHANGE_TRACKING AUTO;
GO

select * from project
where contains(name,'test')
select * from CommunityPartner
where contains(name,'test')
select * from IndividualPartner
where contains((Firstname,LastName),'li')

--SELECT FT_TBL.ID,
--   FT_TBL.Name, 
--   KEY_TBL.RANK
--FROM Project AS FT_TBL INNER JOIN
--   CONTAINSTABLE (project,
--      name, 
--      'test OR adding OR cate'
--   ) AS KEY_TBL
--   ON FT_TBL.ID = KEY_TBL.[KEY]

--ORDER BY KEY_TBL.RANK DESC;



--select * from project
--where freetext(name,'test adding cate')

SELECT p.ID,
   p.Name, 
   k.RANK
FROM project AS p 
     INNER JOIN
     FREETEXTTABLE(project, name,
                    'test') AS k
     ON p.ID = k.[KEY]
ORDER BY k.RANK DESC

create table ProjectType(
	ID int identity(1,1) not null,
	Name varchar(100),
	TrackingTarget varchar(50),--Student;Staff;Faculty;Individual
	IsTrackingAll bit,
	OrderByID int,
	constraint ProjectType_PK primary key(
	ID
	)
)
GO
insert into projecttype(name,orderbyid,TrackingTarget,IsTrackingAll)  select 'Academic Service Learning',0,'Students',1;
insert into ProjectType(Name,orderbyid,TrackingTarget,IsTrackingAll) select 'Co-Curricular Student Service',0,'Students',1;
insert into ProjectType(Name,orderbyid,TrackingTarget,IsTrackingAll) select 'Community Engaged Scholarship',0,'Individuals',0;
insert into ProjectType(Name,orderbyid,TrackingTarget,IsTrackingAll) select 'Faculty Community Service',0,'Faculty',0;
insert into ProjectType(Name,orderbyid,TrackingTarget,IsTrackingAll) select 'Staff Community Service',0,'Staff',0;
GO
create table Project2Type(
	ProjectID int not null,
	ProjectTypeID int not null,
	NumberofParticipatingTargets int,--targets:Student;Staff;Faculty;Individual
	NumberofHoursServed float,
	
	NumberofParticipatingFaculty int,
	NumberofFacultyHoursServed float,
	NumberofParticipatingStaff int,
	NumberofStaffHoursServed float,
	constraint Project2Type_PK primary key(
	ProjectID,
	ProjectTypeID
	)
)
GO
create table Project2Course
(
	ProjectID int not null,
	CourseID int not null,
	NumberofParticipatingStudents int,
	NumberofStudentHoursServed float,
	constraint Project2Course_PK primary key(
	ProjectID,
	CourseID
	)
)
GO
create table Category
(
	ID int identity(1,1) not null,
	ParentID int,
	Name varchar(100) not null,
	OrderByID int,
	constraint Category_PK primary key(
	ID
	)
)

GO
CREATE UNIQUE NONCLUSTERED INDEX [NIX_Category_Name] ON Category
(
	Name
) 
GO
create table Project2Category
(
	ProjectID int not null,
	CategoryID int not null,
	ImpactAmount int,
	constraint Project2Category_PK primary key(
	ProjectID,
	CategoryID
	)
)
GO
create table CommunityPartner
(
	ID int identity(1322,1) not null,
	Name varchar(100) not null,
	UniqueUrl varchar(200) not null,
	CreatorUserID int not null,
	Thumbnail varchar(500),
	OrganizationType varchar(100),
	OrganizationStatement varchar(1000),
	Website varchar(200),
	[Address] varchar(200),
	City varchar(50),
	County varchar(50),
	[State] varchar(50),
	Nation varchar(50),
	ZipCode varchar(50),
	PrimaryContactName varchar(50),
	PrimaryContactEmail varchar(200),
	PrimaryContactPhone varchar(50),
	PopulationServed varchar(100),
	Mission varchar(500),
	CreateDate datetime,
	LastModifiedDate datetime,
	LastEditorUserID int,
	constraint CommunityPartner_PK primary key(
	ID
	)
)
GO
CREATE FULLTEXT INDEX ON CommunityPartner(Name) 
   KEY INDEX CommunityPartner_PK 
   WITH STOPLIST = SYSTEM,CHANGE_TRACKING AUTO;
GO
CREATE UNIQUE NONCLUSTERED INDEX [NIX_CommunityPartner_UniqueUrl] ON [CommunityPartner]
(
	UniqueUrl
) 
GO
create table Project2CommunityPartner
(
	ProjectID int not null,
	CommunityPartnerID int not null,
	PartnershipType varchar(100),
	constraint Project2CommunityPartner_PK primary key(
	ProjectID,
	CommunityPartnerID
	)
)
GO
create table IndividualPartner
(
	ID int identity(1322,1) not null,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	UniqueUrl varchar(200) not null,
	CreatorUserID int not null,
	DPUID varchar(15),
	--Title_Position varchar(100),
	Thumbnail varchar(500),
	Email varchar(200),
	Phone varchar(50),
	--Expertise_Scholarship varchar(200),
	PersonalStatement varchar(1000),
	CreateDate datetime,
	LastModifiedDate datetime,
	LastEditorUserID int,
	constraint IndividualPartner_PK primary key(
	ID
	)
)
GO
CREATE FULLTEXT INDEX ON IndividualPartner(FirstName,LastName) 
   KEY INDEX IndividualPartner_PK 
   WITH STOPLIST = SYSTEM,CHANGE_TRACKING AUTO;
GO
CREATE UNIQUE NONCLUSTERED INDEX [NIX_IndividualPartner_UniqueUrl] ON [IndividualPartner]
(
	UniqueUrl
) 
GO
create table Project2IndividualPartner
(
	ProjectID int not null,
	IndividualPartnerID int not null,
	ProjectRole varchar(50),
	constraint Project2IndividualPartner_PK primary key(
	ProjectID,
	IndividualPartnerID
	)
)
GO
create table CommunityPartner2IndividualPartner
(
	CommunityPartnerID int not null,
	IndividualPartnerID int not null,
	constraint CommunityPartner2IndividualPartner_PK primary key(
	CommunityPartnerID,
	IndividualPartnerID
	)
)