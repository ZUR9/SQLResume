/* 
    Greetings.

    Thank you for taking the time to review this data.

    To run these commands in a safe environment, I recommend:
    http://rextester.com/l/sql_server_online_compiler
*/

/************************
> > > Create Tables < < <
*************************/

/*
    prefer normalization over denormalization for flexibility
*/
CREATE TABLE Person
(
    ID                      int             NOT NULL IDENTITY(000000001,1)
,   FirstName               nvarchar(50)    NOT NULL DEFAULT ( N'' ) --prefer empty strings 
,   LastName                nvarchar(50)    NOT NULL DEFAULT ( N'' ) --over null where applicable
,   CONSTRAINT PkPerson                     
        PRIMARY KEY (ID)
);

CREATE TABLE Email
(
    PersonID                int             NOT NULL                --prefer to avoid artificial key
,   Email                   nvarchar(100)   NOT NULL DEFAULT ( N'' ) --when natural key could cause problems
,   CONSTRAINT Pk_Email               
        PRIMARY KEY (PersonID)
,   CONSTRAINT Fk_Email_Person        
        FOREIGN KEY (PersonID) 
        REFERENCES Person(ID)
);

CREATE TABLE Address
(
    ID                      int             NOT NULL IDENTITY (000000001,1)
,   PersonID                int             NOT NULL
,   Address1                nvarchar(100)   NOT NULL DEFAULT ( N'' ) -- Address Line 1
,   Address2                nvarchar(100)   NOT NULL DEFAULT ( N'' ) -- Address Line 2
,   City                    nvarchar(100)   NOT NULL DEFAULT ( N'' )
,   State                   nchar(2)        NOT NULL DEFAULT ( N'' )
,   Zipcode                 nchar(5)        NOT NULL DEFAULT ( N'' )
,   Country                 nvarchar(255)   NOT NULL DEFAULT ( N'' )
,   CONSTRAINT Pk_Address                    
        PRIMARY KEY (ID)
,   CONSTRAINT Fk_Address_Person             
        FOREIGN KEY (PersonID) 
        REFERENCES Person(ID)
);

CREATE TABLE Education
(
    ID                     int              NOT NULL IDENTITY (000000001,1)
,   PersonID               int              NOT NULL  
,   Degreed                bit              NOT NULL DEFAULT ( 0 )  --default 0 because people
,   DegreeEarned           nvarchar(100)    NOT NULL DEFAULT ( N'' ) --don't inherently have a degree
,   DegreeFrom             nvarchar(100)    NOT NULL DEFAULT ( N'' )
,   GraduatedDate          date
,   CONSTRAINT Pk_Education             
        PRIMARY KEY (ID)
,   CONSTRAINT FkEducation_Person       
        FOREIGN KEY (PersonID) 
        REFERENCES Person(ID)
);

CREATE TABLE WorkHistory
(
    ID                      int              NOT NULL IDENTITY (000000001,1)
,   PersonID                int              NOT NULL
,   Position                nvarchar(100)    NOT NULL DEFAULT ( N'' )
,   PositionDescription     nvarchar(max)    NOT NULL DEFAULT ( N'' )
,   Company                 nvarchar(100)    NOT NULL DEFAULT ( N'' )
,   PositionStart           date             NOT NULL
,   PositionEnd             date
,   CONSTRAINT Pk_WorkHistory             
        PRIMARY KEY (ID)
,   CONSTRAINT Fk_WorkHistory_Person      
        FOREIGN KEY (PersonID) 
        REFERENCES Person(ID)
);

CREATE TABLE SkillList
(
    ID                      int             NOT NULL IDENTITY(001,1) 
,   SkillName               varchar(100)    NOT NULL UNIQUE
,   CONSTRAINT Pk_SkillList           
        PRIMARY KEY (ID)
); 

CREATE TABLE SkillLevel
(
    ID                      int             NOT NULL IDENTITY(001,1) 
,   SkillLevelName          varchar(100)    NOT NULL UNIQUE
,   CONSTRAINT Pk_SkillLevel             
        PRIMARY KEY (ID)
);

CREATE TABLE Skill
(
    ID                      int             NOT NULL IDENTITY (000000001,1)
,   PersonID                int             NOT NULL
,   SkillListID             int             NOT NULL
,   SkillLevelID            int             NOT NULL 
,   CONSTRAINT Pk_Skill                  
        PRIMARY KEY (ID)
,   CONSTRAINT Fk_Skill_Person           
        FOREIGN KEY (PersonID) 
        REFERENCES Person(ID)
,   CONSTRAINT Fk_Skill_SkillList        
        FOREIGN KEY (SkillListID) 
        REFERENCES SkillList(ID)
,   CONSTRAINT Fk_Skill_SkillLevel       
        FOREIGN KEY (SkillLevelID) 
        REFERENCES SkillLevel(ID)
);



/**************************
> > > Populate Tables < < <
***************************/

INSERT INTO Person 
VALUES
(
    N'Matthew'
,   N'Henchey'
);

INSERT INTO Email
VALUES
(
    000000001
,   N'Henchey.Matthew@Gmail.com'
);

INSERT INTO Address
VALUES
(
    000000001
,   N''
,   N''
,   N'Manorville'
,   N'NY'
,   N'11949'
,   N'United States'
);

INSERT INTO Education
VALUES
(
    000000001
,   1
,   N'Bachelor Of Fine Arts in Photography'
,   N'State University of NY at Plattsburgh'
,   N'2013-05-18'
);

INSERT INTO WorkHistory
VALUES
(
    000000002
,   N'Data Conversion Specialist'
,   N'Independently manage multiple software conversions,
        including tracking deadlines and schedules and communicating 
        status with clients, other Conversions Team members, and 
        other teams within MINDBODY.
        Assist Data Conversion Coordinators with the pre-conversion 
        client assessment process.
        Independently complete client contact import and client 
        contact copy projects.
        Complete software conversions, including data analysis, data mapping, 
        data conversion and follow-up work.'
,   N'MINDBODY, Inc'
,   N'2016-09-16'
,   NULL
);
INSERT INTO WorkHistory
VALUES
(
    000000001
,   N'Technical Support Specialist'
,   N'Resolve client problems related to services or the software product via: 
        phone, chat, email, and web forums.
        Whenever possible, resolve issues on the first contact. 
        If issues cannot be resolved on the first contact, ensure that follow through 
        is completed according an agreed upon day and time.
        Educate clients on product features or additional services to meet their needs.'
,   N'MINDBODY, Inc'
,   N'2014-08-17'
,   N'2016-09-16'
);

INSERT INTO SkillList VALUES (N'Microsoft SQL Server');
INSERT INTO SkillList VALUES (N'T-SQL');
INSERT INTO SkillList VALUES (N'SSMS');
INSERT INTO SkillList VALUES (N'SSIS');
INSERT INTO SkillList VALUES (N'SQL Report Writing');
INSERT INTO SkillList VALUES (N'NoSQL');
INSERT INTO SkillList VALUES (N'MongoDB');
INSERT INTO SkillList VALUES (N'C');
INSERT INTO SkillList VALUES (N'C++');
INSERT INTO SkillList VALUES (N'C#');
INSERT INTO SkillList VALUES (N'.Net Framework');
INSERT INTO SkillList VALUES (N'Java');
INSERT INTO SkillList VALUES (N'JavaScript');
INSERT INTO SkillList VALUES (N'jQuery');
INSERT INTO SkillList VALUES (N'HTML');
INSERT INTO SkillList VALUES (N'CSS');
INSERT INTO SkillList VALUES (N'PHP');
INSERT INTO SkillList VALUES (N'Perl');
INSERT INTO SkillList VALUES (N'Ruby');
INSERT INTO SkillList VALUES (N'MEAN-Stack');
INSERT INTO SkillList VALUES (N'MEAN-MongoDB');
INSERT INTO SkillList VALUES (N'MEAN-Express');
INSERT INTO SkillList VALUES (N'MEAN-Angular');
INSERT INTO SkillList VALUES (N'MEAN-Node.JS');
INSERT INTO SkillList VALUES (N'Relational Databases');
INSERT INTO SkillList VALUES (N'Non-relational Databases');
INSERT INTO SkillList VALUES (N'Database Design');

INSERT INTO SkillLevel VALUES (N'Basic Understanding');   --1
INSERT INTO SkillLevel VALUES (N'Familiar');              --2
INSERT INTO SkillLevel VALUES (N'Moderate Understanding');--3
INSERT INTO SkillLevel VALUES (N'Working Knowledge');     --4
INSERT INTO SkillLevel VALUES (N'Proficient');            --5
INSERT INTO SkillLevel VALUES (N'Deep Understanding');    --6
INSERT INTO SkillLevel VALUES (N'Expert');                --7

INSERT INTO Skill VALUES (000000001,001,6);--('Microsoft SQL Server')
INSERT INTO Skill VALUES (000000001,002,6);--('T-SQL')
INSERT INTO Skill VALUES (000000001,003,4);--('SSMS')
INSERT INTO Skill VALUES (000000001,004,4);--('SSIS')
INSERT INTO Skill VALUES (000000001,005,6);--('SQL Report Writing')
INSERT INTO Skill VALUES (000000001,006,4);--('NoSQL')
INSERT INTO Skill VALUES (000000001,007,4);--('MongoDB')
INSERT INTO Skill VALUES (000000001,008,3);--('C')
INSERT INTO Skill VALUES (000000001,009,3);--('C++')
INSERT INTO Skill VALUES (000000001,010,4);--('C#')
INSERT INTO Skill VALUES (000000001,011,4);--('.Net Framework')
INSERT INTO Skill VALUES (000000001,012,2);--('Java')
INSERT INTO Skill VALUES (000000001,013,4);--('JavaScript')
INSERT INTO Skill VALUES (000000001,014,3);--('jQuery')
INSERT INTO Skill VALUES (000000001,015,4);--('HTML')
INSERT INTO Skill VALUES (000000001,016,4);--('CSS')
INSERT INTO Skill VALUES (000000001,017,3);--('PHP')
INSERT INTO Skill VALUES (000000001,018,4);--('Perl')
INSERT INTO Skill VALUES (000000001,019,3);--('Ruby')
INSERT INTO Skill VALUES (000000001,020,3);--('MEAN-Stack')
INSERT INTO Skill VALUES (000000001,021,4);--('MEAN-MongoDB')
INSERT INTO Skill VALUES (000000001,022,2);--('MEAN-Express')
INSERT INTO Skill VALUES (000000001,023,3);--('MEAN-Angular')
INSERT INTO Skill VALUES (000000001,024,3);--('MEAN-Node.JS')
INSERT INTO Skill VALUES (000000001,025,5);--('Relational Databases')
INSERT INTO Skill VALUES (000000001,026,4);--('Non-relational Databases')
INSERT INTO Skill VALUES (000000001,027,6);--('Database Design')



/*********************
> > > Query Data < < <
**********************/

--
--Query Education History
--
/*
    prefer ANSI
*/
SELECT
    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]                 AS [Name]
,   [dbo].[Email].[Email]
,   [dbo].[Address].[City] + ', ' + [dbo].[Address].[State]                      AS [Location]
,   [dbo].[Education].[DegreeEarned]
,   [dbo].[Education].[DegreeFrom]
,   CAST([dbo].[Education].[GraduatedDate] AS nvarchar(10))                      AS [Graduated]
FROM [dbo].[Person]
    INNER JOIN [dbo].[Email]
        ON [dbo].[Person].[ID] = [dbo].[Email].[PersonID]
    INNER JOIN [dbo].[Address]
        ON [dbo].[Person].[ID] = [dbo].[Address].[PersonID]
    INNER JOIN [dbo].[Education]
        ON [dbo].[Person].[ID] = [dbo].[Education].[PersonID]
ORDER BY [dbo].[Education].[GraduatedDate] DESC;


--
--Query WorkHistory
SELECT
    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]                  AS [Name]
,   [dbo].[WorkHistory].[Position]
,   [dbo].[WorkHistory].[Company]
,   CAST([dbo].[WorkHistory].[PositionStart]        AS nvarchar(10))              AS [PositionStart]
,   COALESCE(CAST([dbo].[WorkHistory].[PositionEnd] AS nvarchar(10)), N'Current') AS [PositionEnd]
FROM [dbo].[Person]
    INNER JOIN [dbo].[WorkHistory]
        ON [dbo].[Person].[ID] = [dbo].[WorkHistory].[PersonID]
ORDER BY [dbo].[WorkHistory].[PositionStart] DESC;


--
--Query Skills
--
SELECT
    CASE
        WHEN [info].[RowNum] = 1
           THEN [info].[PersonName]
        ELSE ''
    END                                     AS [Person]
,   [info].[SkillName]                      AS [Skill]
,   REPLICATE('*',[info].[SkillLevelID])    AS [SkillLevel]
,   [info].[SkillLevelName]                 AS [SkillDescription]
FROM (
    SELECT 
         [dbo].[Person].[ID]
    ,    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]   AS [PersonName]
    ,    ROW_NUMBER() OVER(PARTITION BY [dbo].[Person].[ID] 
                      ORDER BY [dbo].[Skill].[SkillLevelID] DESC)       AS [RowNum]
    ,    [dbo].[SkillList].[SkillName]
    ,    [dbo].[Skill].[SkillLevelID]
    ,    [dbo].[SkillLevel].[SkillLevelName]
    ,    [dbo].[SkillList].[ID]                                         AS [SkillListID]
    FROM [dbo].[Person]
        INNER JOIN [dbo].[Skill]
            ON [dbo].[Person].[ID]    = [dbo].[Skill].[PersonID]
        INNER JOIN [dbo].[SkillList]
            ON [dbo].[Skill].[SkillListID]  = [dbo].[SkillList].[ID]
        INNER JOIN [dbo].[SkillLevel]
            ON [dbo].[Skill].[SkillLevelID] = [dbo].[SkillLevel].[ID]
    WHERE [dbo].[Skill].[SkillLevelID] > 2
    ) AS  [info]
ORDER BY  [info].[RowNum] ASC,
          [info].[SkillLevelID] DESC,
          [info].[SkillName] DESC;
