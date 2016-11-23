/* 
    Greetings.

    As you may have noticed, I will take advantage of
    any and all opportunites to experiment with SQL.

    To run these commands in a safe environment, I recommend:
    http://rextester.com/l/sql_server_online_compiler
    
    Thank you for taking the time to review this data.
*/

/************************
> > > Create Tables < < <
*************************/
CREATE TABLE Person
(
    PersonID                int             NOT NULL IDENTITY(000000001,1)
,   FirstName               nvarchar(50)    NOT NULL DEFAULT ( '' )
,   LastName                nvarchar(50)    NOT NULL DEFAULT ( '' )
,   CONSTRAINT PkPerson                     PRIMARY KEY (PersonID)
);

CREATE TABLE EmailAddress
(
    PersonID                int             NOT NULL 
,   EmailAddress            nvarchar(100)   NOT NULL DEFAULT ( '' )
,   CONSTRAINT PkEmailAddress               PRIMARY KEY (PersonID)
,   CONSTRAINT FkEmailAddress_Person        FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Address
(
    AddressID               int             NOT NULL IDENTITY (000000001,1)
,   PersonID                int             NOT NULL
,   Address1                nvarchar(100)   NOT NULL DEFAULT ( '' )
,   Address2                nvarchar(100)   NOT NULL DEFAULT ( '' )
,   City                    nvarchar(100)   NOT NULL DEFAULT ( '' )
,   State                   nchar(2)        NOT NULL DEFAULT ( '' )
,   Zipcode                 nchar(5)        NOT NULL DEFAULT ( '' )
,   Country                 nvarchar(255)   NOT NULL DEFAULT ( '' )
,   CONSTRAINT PkAddress                    PRIMARY KEY (AddressID)
,   CONSTRAINT FkAddress_Person             FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Education
(
    PersonID               int          NOT NULL  
,   Degreed                bit          NOT NULL DEFAULT ( 0 )
,   DegreeEarned           varchar(100) NOT NULL DEFAULT ( '' )
,   DegreeFrom             varchar(100) NOT NULL DEFAULT ( '' )
,   GraduatedDate          date
,   CONSTRAINT PkEducation              PRIMARY KEY (PersonID,DegreeEarned)
,   CONSTRAINT FkEducation_Person       FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE WorkHistory
(
    WorkHistoryID           int          NOT NULL IDENTITY (000000001,1)
,   PersonID                int          NOT NULL
,   Position                varchar(100) NOT NULL DEFAULT ( '' )
,   PositionDescription     varchar(max) NOT NULL DEFAULT ( '' )
,   Company                 varchar(100) NOT NULL DEFAULT ( '' )
,   PositionStart           date         NOT NULL
,   PositionEnd             date
,   CONSTRAINT PkWorkHistory             PRIMARY KEY (PersonID,Position,PositionStart)
,   CONSTRAINT FkWorkHistory_Person      FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE SkillList
(
    SkillListID         int          NOT NULL IDENTITY(001,1) 
,   SkillName           varchar(255) NOT NULL UNIQUE
,   CONSTRAINT PkSkillList           PRIMARY KEY (SkillListID)
); 

CREATE TABLE SkillLevel
(
    SkillLevelID           int          NOT NULL IDENTITY(001,1) 
,   SkillLevelName         varchar(255) NOT NULL UNIQUE
,   CONSTRAINT PkSkillLevel             PRIMARY KEY (SkillLevelID)
);

CREATE TABLE Skill
(
    PersonID                int         NOT NULL
,   SkillListID             int         NOT NULL
,   SkillLevelID            int         NOT NULL 
,   CONSTRAINT PkSkill                  PRIMARY KEY (PersonID,SkillListID,SkillLevelID)
,   CONSTRAINT FkSkill_Person           FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
,   CONSTRAINT FkSkill_SkillList        FOREIGN KEY (SkillListID) REFERENCES SkillList(SkillListID)
,   CONSTRAINT FkSkill_SkillLevel       FOREIGN KEY (SkillLevelID) REFERENCES SkillLevel(SkillLevelID)
);



/**************************
> > > Populate Tables < < <
***************************/

INSERT INTO Person 
VALUES
(
    'Matthew'
,   'Henchey'
);

INSERT INTO EmailAddress
VALUES
(
    000000001
,   'Henchey.Matthew@Gmail.com'
);

INSERT INTO Address
VALUES
(
    000000001
,   ''
,   ''
,   'Manorville'
,   'NY'
,   '11949'
,   'United States'
);

INSERT INTO Education
VALUES
(
    000000001
,   1
,   'Bachelor Of Fine Arts in Photography'
,   'State University of NY at Plattsburgh'
,   '2013-05-18'
);

INSERT INTO WorkHistory
VALUES
(
    000000001
,   'Data Conversion Specialist'
,   'Independently manage multiple software conversions,
        including tracking deadlines and schedules and communicating 
        status with clients, other Conversions Team members, and 
        other teams within MINDBODY.
        Assist Data Conversion Coordinators with the pre-conversion 
        client assessment process.
        Independently complete client contact import and client 
        contact copy projects.
        Complete software conversions, including data analysis, data mapping, 
        data conversion and follow-up work.'
,   'MINDBODY, Inc'
,   '2016-09-16'
,   NULL
);
INSERT INTO WorkHistory
VALUES
(
    000000001
,   'Technical Support Specialist'
,   'Resolve client problems related to services or the software product via: 
        phone, chat, email, and web forums.
        Whenever possible, resolve issues on the first contact. 
        If issues cannot be resolved on the first contact, ensure that follow through 
        is completed according an agreed upon day and time.
        Educate clients on product features or additional services to meet their needs.'
,   'MINDBODY, Inc'
,   '2014-08-17'
,   '2016-09-16'
);

INSERT INTO SkillList VALUES ('Microsoft SQL Server');
INSERT INTO SkillList VALUES ('T-SQL');
INSERT INTO SkillList VALUES ('SSMS');
INSERT INTO SkillList VALUES ('SSIS');
INSERT INTO SkillList VALUES ('SQL Report Writing');
INSERT INTO SkillList VALUES ('NoSQL');
INSERT INTO SkillList VALUES ('MongoDB');
INSERT INTO SkillList VALUES ('C');
INSERT INTO SkillList VALUES ('C++');
INSERT INTO SkillList VALUES ('C#');
INSERT INTO SkillList VALUES ('.Net Framework');
INSERT INTO SkillList VALUES ('Java');
INSERT INTO SkillList VALUES ('JavaScript');
INSERT INTO SkillList VALUES ('jQuery');
INSERT INTO SkillList VALUES ('HTML');
INSERT INTO SkillList VALUES ('CSS');
INSERT INTO SkillList VALUES ('PHP');
INSERT INTO SkillList VALUES ('Perl');
INSERT INTO SkillList VALUES ('Ruby');
INSERT INTO SkillList VALUES ('MEAN Stack');
INSERT INTO SkillList VALUES ('MEAN-MongoDB');
INSERT INTO SkillList VALUES ('MEAN-Express');
INSERT INTO SkillList VALUES ('MEAN-Angular');
INSERT INTO SkillList VALUES ('MEAN-Node.JS');
INSERT INTO SkillList VALUES ('Relational Databases');
INSERT INTO SkillList VALUES ('Non-relational Databases');
INSERT INTO SkillList VALUES ('Database Design');

INSERT INTO SkillLevel VALUES ('Basic Understanding');   --1
INSERT INTO SkillLevel VALUES ('Familiar');              --2
INSERT INTO SkillLevel VALUES ('Moderate Understanding');--3
INSERT INTO SkillLevel VALUES ('Working Knowledge');     --4
INSERT INTO SkillLevel VALUES ('Proficient');            --5
INSERT INTO SkillLevel VALUES ('Deep Understanding');    --6
INSERT INTO SkillLevel VALUES ('Expert');                --7

INSERT INTO Skill VALUES (000000001,001,6);--('Microsoft SQL Server')
INSERT INTO Skill VALUES (000000001,002,6);--('T-SQL')
INSERT INTO Skill VALUES (000000001,003,4);--('SSMS')
INSERT INTO Skill VALUES (000000001,004,3);--('SSIS')
INSERT INTO Skill VALUES (000000001,005,6);--('SQL Report Writing')
INSERT INTO Skill VALUES (000000001,006,4);--('NoSQL')
INSERT INTO Skill VALUES (000000001,007,4);--('MongoDB')
INSERT INTO Skill VALUES (000000001,008,3);--('C')
INSERT INTO Skill VALUES (000000001,009,3);--('C++')
INSERT INTO Skill VALUES (000000001,010,4);--('C#')
INSERT INTO Skill VALUES (000000001,011,3);--('.Net Framework')
INSERT INTO Skill VALUES (000000001,012,2);--('Java')
INSERT INTO Skill VALUES (000000001,013,4);--('JavaScript')
INSERT INTO Skill VALUES (000000001,014,3);--('jQuery')
INSERT INTO Skill VALUES (000000001,015,4);--('HTML')
INSERT INTO Skill VALUES (000000001,016,4);--('CSS')
INSERT INTO Skill VALUES (000000001,017,3);--('PHP')
INSERT INTO Skill VALUES (000000001,018,4);--('Perl')
INSERT INTO Skill VALUES (000000001,019,3);--('Ruby')
INSERT INTO Skill VALUES (000000001,020,4);--('MEAN Stack')
INSERT INTO Skill VALUES (000000001,021,4);--('MEAN-MongoDB')
INSERT INTO Skill VALUES (000000001,022,2);--('MEAN-Express')
INSERT INTO Skill VALUES (000000001,023,4);--('MEAN-Angular')
INSERT INTO Skill VALUES (000000001,024,4);--('MEAN-Node.JS')
INSERT INTO Skill VALUES (000000001,025,5);--('Relational Databases')
INSERT INTO Skill VALUES (000000001,026,4);--('Non-relational Databases')
INSERT INTO Skill VALUES (000000001,027,6);--('Database Design')



/*********************
> > > Query Data < < <
**********************/

--
--Query Education History
--
SELECT
    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]                 AS [Name]
,   [dbo].[EmailAddress].[EmailAddress]
,   [dbo].[Address].[City] + ', ' + [dbo].[Address].[State]                      AS [Location]
,   [dbo].[Education].[DegreeEarned]
,   [dbo].[Education].[DegreeFrom]
,   CAST([dbo].[Education].[GraduatedDate] AS nvarchar(10))                      AS [Graduated]
FROM [dbo].[Person]
    INNER JOIN [dbo].[EmailAddress]
        ON [dbo].[Person].[PersonID] = [dbo].[Emailaddress].[PersonID]
    INNER JOIN [dbo].[Address]
        ON [dbo].[Person].[PersonID] = [dbo].[Address].[PersonID]
    INNER JOIN [dbo].[Education]
        ON [dbo].[Person].[PersonID] = [dbo].[Education].[PersonID]
ORDER BY [dbo].[Education].[GraduatedDate] DESC;


--
--Query WorkHistory
SELECT
    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]                 AS [Name]
,   [dbo].[WorkHistory].[Position]
,   [dbo].[WorkHistory].[Company]
,   CAST([dbo].[WorkHistory].[PositionSTart]        AS nvarchar(10))             AS [PositionStart]
,   COALESCE(CAST([dbo].[WorkHistory].[PositionEnd] AS nvarchar(10)), 'Current') AS [PositionEnd]
FROM [dbo].[Person]
    INNER JOIN [dbo].[WorkHistory]
        ON [dbo].[Person].[PersonID] = [dbo].[WorkHistory].[PersonID]
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
         [dbo].[Person].[PersonID]
    ,    [dbo].[Person].[FirstName] + ' ' + [dbo].[Person].[LastName]   AS [PersonName]
    ,    ROW_NUMBER() OVER(PARTITION BY [dbo].[Person].[PersonID] 
                      ORDER BY [dbo].[Skill].[SkillLevelID] DESC)       AS [RowNum]
    ,    [dbo].[SkillList].[SkillName]
    ,    [dbo].[Skill].[SkillLevelID]
    ,    [dbo].[SkillLevel].[SkillLevelName]
    FROM [dbo].[Person]
        INNER JOIN [dbo].[Skill]
            ON [dbo].[Person].[PersonID]    = [dbo].[Skill].[PersonID]
        INNER JOIN [dbo].[SkillList]
            ON [dbo].[Skill].[SkillListID]  = [dbo].[SkillList].[SkillListID]
        INNER JOIN [dbo].[SkillLevel]
            ON [dbo].[Skill].[SkillLevelID] = [dbo].[SkillLevel].[SkillLevelID]
    WHERE [dbo].[Skill].[SkillLevelID] > 2
    ) AS  [info]
ORDER BY  [info].[SkillLevelID] DESC;
