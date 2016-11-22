/* 
    Greetings.

    As you may have noticed, I will take advantage of
    any and all opportunites to experiment with SQL.

    To run these commands in a safe environment, I recommend:
    http://rextester.com/l/sql_server_online_compiler
    
    Thank you for taking the time to review this data.
*/

--
--Create and populate Person
--
CREATE TABLE Person
(
    PersonID               int           NOT NULL IDENTITY(001,1)
,   FirstName              nvarchar(50)  NOT NULL DEFAULT ( '' )
,   LastName               nvarchar(50)  NOT NULL DEFAULT ( '' )
,   EmailAddress           nvarchar(255) NOT NULL DEFAULT ( '' )
,   City                   nvarchar(255) NOT NULL DEFAULT ( '' )
,   State                  nchar(2)      NOT NULL DEFAULT ( '' )
,   Country                varchar(255)  NOT NULL DEFAULT ( '' )
,   CONSTRAINT PkPersonID PRIMARY KEY (PersonID)
);
INSERT INTO Person 
VALUES
(
    'Matthew'
,   'Henchey'
,   'HencheyMatthew@gmail.com'
,   'Manorville'
,   'NY'
,   'United States'
);

--
--Create and populate Education
--
CREATE TABLE Education
(
    PersonID               int          NOT NULL  
,   Degreed                bit          NOT NULL DEFAULT ( 0 )
,   DegreeEarned           varchar(100) NOT NULL DEFAULT ( '' )
,   DegreeFrom             varchar(100) NOT NULL DEFAULT ( '' )
,   GraduatedDate          date
,   CONSTRAINT PkEducation PRIMARY KEY (PersonID,DegreeEarned)
,   CONSTRAINT FkEducation_Person FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);
INSERT INTO Education
VALUES
(
    001
,   1
,   'Bachelor Of Fine Arts in Photography'
,   'State University of NY at Plattsburgh'
,   '2013-05-18'
);

--
--Create and populate WorkHistory
--
CREATE TABLE WorkHistory
(
    PersonID               int          NOT NULL
,   Position               varchar(100) NOT NULL DEFAULT ( '' )
,   PositionDescription    varchar(max) NOT NULL DEFAULT ( '' )
,   Company                varchar(100) NOT NULL DEFAULT ( '' )
,   PositionStart          date         NOT NULL
,   PositionEnd            date
,   CONSTRAINT PkWorkHistory PRIMARY KEY (PersonID,Position,PositionStart)
,   CONSTRAINT FkWorkHistory_Person FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);
INSERT INTO WorkHistory
VALUES
(
    001
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
,   'MINDBODY, Inc.'
,   '2016-09-16'
,   NULL
);
INSERT INTO WorkHistory
VALUES
(
    001
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

--
--Create and populate SkillList
--
CREATE TABLE SkillList
(
    SkillListID         int          NOT NULL IDENTITY(001,1) 
,   SkillName           varchar(255) NOT NULL UNIQUE
,   CONSTRAINT PkSkillListID PRIMARY KEY (SkillListID)
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

--
--Create and populate SkillLevel
--
CREATE TABLE SkillLevel
(
    SkillLevelID           int          NOT NULL IDENTITY(001,1) 
,   SkillLevelName         varchar(255) NOT NULL UNIQUE
,   CONSTRAINT PkSkillLevelID PRIMARY KEY (SkillLevelID)
);
INSERT INTO SkillLevel VALUES ('Basic Understanding');   --1
INSERT INTO SkillLevel VALUES ('Familiar');              --2
INSERT INTO SkillLevel VALUES ('Moderate Understanding');--3
INSERT INTO SkillLevel VALUES ('Working Knowledge');     --4
INSERT INTO SkillLevel VALUES ('Proficient');            --5
INSERT INTO SkillLevel VALUES ('Deep Understanding');    --6
INSERT INTO SkillLevel VALUES ('Expert');                --7

--
--Create and populate Skill
--
CREATE TABLE Skill
(
    PersonID        int NOT NULL
,   SkillListID     int NOT NULL
,   SkillLevelID    int NOT NULL 
,   CONSTRAINT PkSkill PRIMARY KEY (PersonID,SkillListID,SkillLevelID)
,   CONSTRAINT FkSkill_Person FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
,   CONSTRAINT FkSkill_SkillList FOREIGN KEY (SkillListID) REFERENCES SkillList(SkillListID)
,   CONSTRAINT FkSkill_SkillLevel FOREIGN KEY (SkillLevelID) REFERENCES SkillLevel(SkillLevelID)
);
INSERT INTO Skill VALUES (001,001,6);--('Microsoft SQL Server')
INSERT INTO Skill VALUES (001,002,6);--('T-SQL')
INSERT INTO Skill VALUES (001,003,4);--('SSMS')
INSERT INTO Skill VALUES (001,004,3);--('SSIS')
INSERT INTO Skill VALUES (001,005,6);--('SQL Report Writing')
INSERT INTO Skill VALUES (001,006,4);--('NoSQL')
INSERT INTO Skill VALUES (001,007,4);--('MongoDB')
INSERT INTO Skill VALUES (001,008,3);--('C')
INSERT INTO Skill VALUES (001,009,3);--('C++')
INSERT INTO Skill VALUES (001,010,4);--('C#')
INSERT INTO Skill VALUES (001,011,3);--('.Net Framework')
INSERT INTO Skill VALUES (001,012,2);--('Java')
INSERT INTO Skill VALUES (001,013,4);--('JavaScript')
INSERT INTO Skill VALUES (001,014,3);--('jQuery')
INSERT INTO Skill VALUES (001,015,4);--('HTML')
INSERT INTO Skill VALUES (001,016,4);--('CSS')
INSERT INTO Skill VALUES (001,017,3);--('PHP')
INSERT INTO Skill VALUES (001,018,4);--('Perl')
INSERT INTO Skill VALUES (001,019,3);--('Ruby')
INSERT INTO Skill VALUES (001,020,4);--('MEAN Stack')
INSERT INTO Skill VALUES (001,021,4);--('MEAN-MongoDB')
INSERT INTO Skill VALUES (001,022,2);--('MEAN-Express')
INSERT INTO Skill VALUES (001,023,4);--('MEAN-Angular')
INSERT INTO Skill VALUES (001,024,4);--('MEAN-Node.JS')
INSERT INTO Skill VALUES (001,025,5);--('Relational Databases')
INSERT INTO Skill VALUES (001,026,4);--('Non-relational Databases')
INSERT INTO Skill VALUES (001,027,6);--('Database Design')


--
--Generate Education History
--
SELECT
    Person.FirstName + 
        ' ' + 
        Person.LastName                                  AS [Person]
,   Person.EmailAddress
,   Person.City + 
        ', ' + 
        Person.State                                     AS [Location]
,   Education.DegreeEarned
,   Education.DegreeFrom                                 AS [College]
,   CAST(Education.GraduatedDate AS varchar(10))         AS [Graduated]
From Person 
    INNER JOIN Education
        ON Person.PersonID = Education.PersonID
ORDER BY Education.GraduatedDate DESC;

--
--Generate WorkHistory
SELECT
    Person.FirstName +
        ' ' +
        Person.LastName                            AS [Person]
,   WorkHistory.Position
,   WorkHistory.Company
,   CAST(WorkHistory.PositionStart AS varchar(10)) AS [PositionStart]
,   CASE
        WHEN WorkHistory.PositionEnd IS NULL
            THEN 'Current'
        Else CAST(WorkHistory.PositionEnd AS varchar(10))
    END                                            AS [PositionEnd]
FROM Person
    INNER JOIN WorkHistory
        ON Person.PersonID = WorkHistory.PersonID
ORDER BY WorkHistory.PositionStart DESC;

--
--Generate Skills
--
SELECT
    Person.FirstName + 
        ' ' + 
        Person.LastName                 AS [Person]
,   SkillList.SkillName                 AS [Skill]
,   REPLICATE('*',Skill.SkillLevelID)   AS [SkillLevel]
,   SkillLevel.SkillLevelName           AS [SkillDescription]
FROM Person
    INNER JOIN Skill
        ON Person.PersonID = Skill.PersonID
    INNER JOIN SkillList
        ON Skill.SkillListID = SkillList.SkillListID
    INNER JOIN SkillLevel
        ON Skill.SkillLevelID = SkillLevel.SkillLevelID
WHERE Skill.SkillLevelID > 2
ORDER BY Skill.SkillLevelID DESC;
