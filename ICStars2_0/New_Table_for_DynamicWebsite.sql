create table WebsiteNav
(
		ID int identity(1,1),
		Name varchar(100) not null,
		Link varchar(250),
		LinkTitle varchar(100),
		IsTargetBlank BIT not null default(0),
		OrderByID int,
		ParentID int not null default(0),
		CONSTRAINT [PK_WebsiteNav_ID] Primary Key
		(
			ID
		)
)
alter table WebsiteNav
add IsVisible Bit
--update websitenav set IsVisible=1
