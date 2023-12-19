/*
	This SQL file has DDL statements of tables creation of the StackOverflow Data Warehouse.

	The data schema of the data warehouse is a Snowflake.
	Fact Table : [fact_post]
	Dimension Tables :
					- [Dim_Tags]
					- [Dim_Vote]
					- [Dim_Comments]
					- [Dim_User]
					- [Dim_Date]

*/
USE [StackOverflow_DWH]


-------------------------
--- Create Dimentions ---
-------------------------


-- Dimension User
CREATE TABLE [Dim_User] (
	[id] INT PRIMARY KEY,
    [creation_date] DATE,
	[DisplayName] NVARCHAR(40),
	[location] NVARCHAR(100),
	[DownVotes] INT,
	[UpVotes] INT,
	[Reputation] INT,
	[views] INT
);
GO
CREATE TABLE [User_Badge] (
	[badge_id] INT  PRIMARY KEY,
	[badge_name] NVARCHAR(40),
	[badge_userid] INT,
	CONSTRAINT [fk_badge_user] FOREIGN KEY (badge_userid) REFERENCES Dim_User(id)
);
GO


-------------------------
------ Create Fact ------
-------------------------


-- Fact Post
CREATE TABLE [Fact_Post] (
	[id] INT PRIMARY KEY,
	[post_type] NVARCHAR(50),	
	[creation_date] DATE,
	[answer_count] INT,
	[comment_count] INT,
	[view_count] INT,
	[favourite_count] INT,
	[bounty_amount] INT,
	[comments_score] INT,
	[userid] INT,
	[DateK] INT,
	CONSTRAINT [fk_post_user] FOREIGN KEY (userid) REFERENCES Dim_User(id),
	CONSTRAINT [fk_post_date] FOREIGN KEY (DateK) REFERENCES DimDate(DateSK)
);
GO


-------------------------
--- Create Dimentions ---
-------------------------


-- Dimension Post Tags
CREATE TABLE [Dim_Tags] (
    [tag_id] INT PRIMARY KEY identity (1,1),
	[post_id] INT,
    [tags] NVARCHAR(50),
	CONSTRAINT [fk_post_pTags] FOREIGN KEY (post_id) REFERENCES Fact_Post(id)
);
GO
-- Dimension Vote Type
CREATE TABLE [Dim_Vote] (
	[vote_type_id] INT PRIMARY KEY,
	[creation_date] DATE,
    [vote_type] NVARCHAR(50),
	[post_id] INT,
	CONSTRAINT [fk_post_vote] FOREIGN KEY (post_id) REFERENCES Fact_Post(id)
);
GO
-- Dimension Comment
CREATE TABLE [Dim_Comments] (
	[comment_id] INT PRIMARY KEY,
	[creation_date] DATE,
	[comment_userid] INT,
	[post_id] INT,
	CONSTRAINT [fk_post_comment] FOREIGN KEY (post_id) REFERENCES Fact_Post(id)
);
GO




/*
drop table Fact_Post
drop table User_Badge
GO
drop table Dim_Tags
drop table Dim_User
drop table Dim_Vote
drop table Dim_Comments
*/