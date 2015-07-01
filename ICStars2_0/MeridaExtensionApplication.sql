create table MeridaExtensionApplication
(
	ID int identity(1,1),
	CampusConnectID varchar(100),
	Name varchar(100),
	Major varchar(2000),
	SpanishLanguageCoursesCompleted varchar(2000),
	WhatCoursesPriorToMerida varchar(2000),
	InterestInMerida_Why varchar(3000),
	SkillsStrengths varchar(3000),
	Challenges_HowToOvercome varchar(3000),
	HowProgramContributeToCareer varchar(3000),
	ExperienceInMerida_HowRelatesToCSS201 varchar(3000),
	Characteristics varchar(3000),
	YearOfApplication int,
	CONSTRAINT PK_MeridaExtensionApplication_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)

select * from MeridaExtensionApplication
