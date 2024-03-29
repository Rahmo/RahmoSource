﻿CREATE TABLE UniverseCourse (
    TermDesc        VARCHAR (100)  NULL,
    [Subject]                VARCHAR (50)   NULL,
    [CatalogNumber]          VARCHAR (50)   NULL,
    [ClassSection]           VARCHAR (50)   NULL,
    [Title]                  VARCHAR (200)  NULL,
    [InstructorName]         VARCHAR (100)  NULL,
    [InstructorFirstName]         VARCHAR (100)  NULL,
    [InstructorLastName]         VARCHAR (100)  NULL,
    [BestEmail]              VARCHAR (200)  NULL,
    [Staff]                  VARCHAR (100)  NULL,
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
    [Enrlollment]            INT            NULL
);
