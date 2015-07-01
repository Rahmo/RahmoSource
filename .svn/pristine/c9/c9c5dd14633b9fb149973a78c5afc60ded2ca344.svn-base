select * from course

alter table course
add Term varchar(50)
alter table course
add College varchar(100)
alter table course
add Career varchar(50)
alter table course
add CrseCareerDescr varchar(100)
alter table course
add SessionCode varchar(50)
alter table course
add SessionCodeDescr varchar(100)
alter table course
add SubjectDescr varchar(100)
alter table course
add ClassNumber varchar(50)
alter table course
add Component varchar(50)
alter table course
add RequirementDesignation varchar(50)
alter table course
add RqmntDesigDescr varchar(100)
alter table course
add CrseAttr varchar(50)
alter table course
add CrseAttrValue varchar(50)
alter table course
add CrseTypoffCd varchar(50)
alter table course
add CrseTypoffDescr varchar(500)
alter table course
add InstructorEmplid varchar(50)
alter table course
add InstructionMode varchar(50)
alter table course
add Location varchar(50)
alter table course
add LocationDescr varchar(500)
alter table course
add FacilityRoom varchar(50)
alter table course
add StartDate datetime
alter table course
add EndDate datetime
alter table course
add [Days] varchar(50)
alter table course
add MeetingTimeStart varchar(50)
alter table course
add MeetingTimeEnd varchar(50)
alter table course
add EnrlStatus varchar(50)
alter table course
add CrseTopicId float
alter table course
add CrseTopicDescr varchar(500)
alter table course
add ClassNotesDescrlong varchar(1000)
alter table course
add DateAddedIntoPS datetime
alter table course
add Capacity int
alter table course
add Enrlollment int


	
	CREATE UNIQUE NONCLUSTERED INDEX [NIX_Course] ON course
(
	TermDescription,
	[Subject],
	CatalogNumber,
	ClassSection,
	ClassNumber,
	InstructorName
)