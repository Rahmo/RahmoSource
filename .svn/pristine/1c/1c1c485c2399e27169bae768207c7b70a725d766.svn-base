USE [ICStars2_0]
GO

SET IDentity_insert Member ON
INSERT INTO [dbo].[Member]
           (
		   id,
		   CampusConnectID
           ,[Status]
           ,[Email]
           ,[IP]
           ,[Phone]
           ,[OfficeHours]
           ,[RegisterDate]
           ,[LastLoginDate])
     SELECT id,username
           ,[Status]
           ,[Email]
           ,[IP]
           ,[Phone]
           ,[OfficeHours]
           ,[RegisterDate]
           ,[LastLoginDate] from member_bak
SET IDentity_insert Member Off
          
GO

select * from member

update memeber set campus