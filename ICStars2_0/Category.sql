Create table Category
(
	ID int Identity(1,1),
	Name varchar(100) not null,
	ParentID int not null,
	CONSTRAINT PK_Category_ID PRIMARY KEY CLUSTERED 
	(
		ID
	)
)
create table Article2Category
(
	CategoryID int not null,
	ArticleID int not null
	CONSTRAINT PK_Article2Category PRIMARY KEY CLUSTERED 
	(
		CategoryID,
		ArticleID
	)
)