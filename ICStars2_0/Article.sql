--drop table article
create table Article
(
	ID int identity(1,1),
	Title varchar(200) not null,
	Content varchar(max),
	Brief varchar(200),
	Author varchar(100),
	Thumbnail varchar(500),
	PublishDate datetime,
	CreateDate datetime,
	IsVisible bit,
	UrlTitle varchar(200),
	Keywords varchar(200),
	Layout varchar(200),
	CONSTRAINT PK_Article_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
GO
ALTER TABLE Article
add RedirectUrl varchar(200)

ALTER TABLE Article
add Redirect301Url varchar(200)
ALTER TABLE Article
add ShortTitle varchar(200)

create UNIQUE NONCLUSTERED INDEX NIX_Artilce_UrlTitle ON Article(
	UrlTitle
)
GO


drop table webpage


create table WebPage
(
	Title varchar(200) not null,
	Content varchar(max),
	[Description] varchar(155),
	Keywords varchar(155),
	CreateDate datetime,
	Url varchar(200),
	Layout varchar(200),
	CONSTRAINT PK_WebPage_Url PRIMARY KEY CLUSTERED 
	(
		Url
	)
)

ALTER TABLE WebPage
add RedirectUrl varchar(200)

ALTER TABLE WebPage
add Redirect301Url varchar(200)







--insert into usrCBSL.tblEmployee(EOnline,EActive,Fname,Lname,EEmpType,EDPUEmail,EWorkPhone,EEmpDept)
--select 'True','True','Joy','Ellison','Community Service Scholars Coordinator','JELLISO8@DEPAUL.EDU','58132','Staff'
--union all
--select 'True','True','E.L','Hunter','Academic & Community Development Coordinator','EHUNTER7@DEPAUL.EDU','57475','Staff'
--union all
--select 'True','True','Lourdes','Sullivan','Catholic School Partnerships Coordinator','lSULLI17@DEPAUL.EDU','58963','Staff'

