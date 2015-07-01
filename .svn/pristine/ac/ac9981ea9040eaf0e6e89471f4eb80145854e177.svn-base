
create table son_student
(
	StudentID int not null,
	Name varchar(100),
	ClassSection varchar(50),
	Languages varchar(100),
	[Address] varchar(200),
	City varchar(50),
	Zipcode varchar(50),
	Notes varchar(500),
	CPID1 int,
	Placement1 BIT,
	CPID2 int,
	Placement2 BIT,
	CPID3 int,
	Placement3 BIT,
	constraint PK_son_studdent_StudentID primary key
	(
		StudentID
	)
)
create table son_cboprogram
(
	CPID int identity(1,1),
	CBOName varchar(200),
	ProgramName varchar(200),
	Slots int,
	Location varchar(200),
	Bilingual varchar(100),

	constraint PK_son_cbo_CPID primary key
	(
		CPID
	)
)

create table son_cbochoice
(
	CPID int not null,
	StudentID int not null,
	Placement BIT,
	constraint PK_son_cbochoice_CPID_StudentID primary key
	(
		CPID,
		StudentID
	)
)

alter table son_cbochoice
add IsASL BIT

update son_cbochoice set IsAsl=0

