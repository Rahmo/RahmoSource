

CREATE TABLE [dbo].[SurveyQuestion](
	[ID] [int] IDENTITY(1323,3) NOT NULL,
	[SurveyID] [int] NOT NULL,
	[QuestionMark] [nvarchar](10) NULL,
	[QuestionOrderBy] [int] NULL,
	[Question] [nvarchar](500) NOT NULL,
	[OptionRows] [int] NULL,
	[OptionCols] [int] NULL,
	[IsRadio] [bit] NULL,
	[IsCheckBox] [bit] NULL,
	[IsMatrix] [bit] NULL,
	[AnswerUpperLimit] [int] NULL,
	[AnswerLowerLimit] [int] NULL,
	[IsTextBox] [bit] NULL,
	[IsCompulsory] [bit] NULL,
	[IsLogical] [bit] NULL,
	[LogcalLowerLimit] [int] NULL,
	[IsNested] [bit] NULL,
	[IsShow] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)) 
GO

CREATE TABLE [dbo].[SurveyOption2Question](
	[OptionID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_SurveyOption2Question] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC,
	[QuestionID] ASC
)) 
GO

CREATE TABLE [dbo].[SurveyOption](
	[ID] [int] IDENTITY(1323,3) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionMark] [nvarchar](10) NULL,
	[Option] [nvarchar](200) NULL,
	[IsTextBox] [bit] NULL,
	[MatrixRowName] [nvarchar](100) NULL,
	[MatrixRowIndex] [int] NULL,
	[MatrixColName] [nvarchar](100) NULL,
	[MatrixColIndex] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)) 
GO

CREATE TABLE [dbo].[SurveyAnswer](
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionID] [int] NOT NULL,
	[OtherAnswer] [nvarchar](200) NULL,
	[AnswerDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)) 
GO

CREATE TABLE [dbo].[Survey2User](
	[SurveyID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserIP] [varchar](200) NULL,
	[SurveyDate] [datetime] NULL,
	[SubmitDate] [datetime] NULL,
	[IsSubmited] [bit] NULL,
 CONSTRAINT [PK_Survey2User] PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC,
	[UserID] ASC
))

GO

CREATE TABLE [dbo].[Survey](
	[ID] [int] IDENTITY(1323,3) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CreateUser] [varchar](50) NULL,
	[ModifyUser] [varchar](50) NULL,
	[IsNeedLogin] [bit] NULL,
	[IsOnlyOneMachine] [bit] NULL,
	[IsNeedOrderID] [bit] NULL,
	[IsShow] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[UserCount] [int] NULL,
	[FinishedTip] [nvarchar](200) NULL,
	[ModifyDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO

