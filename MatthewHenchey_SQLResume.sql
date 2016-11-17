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
    PersonID               int NOT NULL IDENTITY(001,1) 
        CONSTRAINT pk_PersonID PRIMARY KEY
,   FirstName              varchar(50)  NOT NULL
,   LastName               varchar(50)  NOT NULL
,   EmailAddress           varchar(255) NOT NULL
,   City                   varchar(255) NOT NULL              
,   State                  varchar(2)   NOT NULL
,   Country                varchar(255) NOT NULL
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
    EducationID            int NOT NULL IDENTITY(0001,1) 
        CONSTRAINT pk_EducationID PRIMARY KEY
,   PersonID               int NOT NULL
        CONSTRAINT fk_EducationPersonID_PersonPersonID FOREIGN KEY 
            REFERENCES Person(PersonID)  
,   Degreed                bit
,   DegreeEarned           varchar(50)
,   DegreeFrom             varchar(100)
,   GraduatedDate          date
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
    WorkHistoryID          int NOT NULL IDENTITY(0001,1) 
        CONSTRAINT pk_WorkHistoryID PRIMARY KEY
,   PersonID               int NOT NULL
        CONSTRAINT fk_WorkHistoryPersonID_PersonPersonID FOREIGN KEY 
            REFERENCES Person(PersonID)
,   CurrentPosition        varchar(100)
,   CurrentPosDescription  varchar(max)
,   Company                varchar(100)
,   CurrentPositionStart   date
,   PreviousPosition       varchar(100)
,   PreviousPosDescription varchar(max)
,   PreviousPositionStart  date
,   PreviousPositionEnd    date
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
,   'Technical Support Specialist'
,   'Resolve client problems related to services or the software product via: 
        phone, chat, email, and web forums.
        Whenever possible, resolve issues on the first contact. 
        If issues cannot be resolved on the first contact, ensure that follow through 
        is completed according an agreed upon day and time.
        Educate clients on product features or additional services to meet their needs.'
,   '2014-08-17'
,   '2016-09-16'
);

--
--Create and populate SkillDetails
--
CREATE TABLE SkillDetails
(
    SkillDetailID         int NOT NULL IDENTITY(0001,1) 
        CONSTRAINT pk_SkillDetailID PRIMARY KEY
,   SkillName              varchar(255) NOT NULL UNIQUE         
); 
INSERT INTO SkillDetails VALUES ('Microsoft SQL Server');
INSERT INTO SkillDetails VALUES ('T-SQL');
INSERT INTO SkillDetails VALUES ('SSMS');
INSERT INTO SkillDetails VALUES ('SSIS');
INSERT INTO SkillDetails VALUES ('SQL Report Writing');
INSERT INTO SkillDetails VALUES ('NoSQL');
INSERT INTO SkillDetails VALUES ('MongoDB');
INSERT INTO SkillDetails VALUES ('C');
INSERT INTO SkillDetails VALUES ('C++');
INSERT INTO SkillDetails VALUES ('C#');
INSERT INTO SkillDetails VALUES ('.Net Framework');
INSERT INTO SkillDetails VALUES ('Java');
INSERT INTO SkillDetails VALUES ('JavaScript');
INSERT INTO SkillDetails VALUES ('jQuery');
INSERT INTO SkillDetails VALUES ('HTML');
INSERT INTO SkillDetails VALUES ('CSS');
INSERT INTO SkillDetails VALUES ('PHP');
INSERT INTO SkillDetails VALUES ('Perl');
INSERT INTO SkillDetails VALUES ('Ruby');
INSERT INTO SkillDetails VALUES ('MEAN Stack');
INSERT INTO SkillDetails VALUES ('MEAN-MongoDB');
INSERT INTO SkillDetails VALUES ('MEAN-Express');
INSERT INTO SkillDetails VALUES ('MEAN-Angular');
INSERT INTO SkillDetails VALUES ('MEAN-Node.JS');
INSERT INTO SkillDetails VALUES ('Relational Databases');
INSERT INTO SkillDetails VALUES ('Non-relational Databases');
INSERT INTO SkillDetails VALUES ('Database Design');

--
--Create and populate Skilllevels
--
CREATE TABLE SkillLevels
(
    SkillLevelID           int NOT NULL IDENTITY(1,1) PRIMARY KEY
,   SkillLevelName         varchar(255) NOT NULL UNIQUE
);
INSERT INTO SkillLevels VALUES ('Basic Understanding');   --1
INSERT INTO SkillLevels VALUES ('Familiar');              --2
INSERT INTO SkillLevels VALUES ('Moderate Understanding');--3
INSERT INTO SkillLevels VALUES ('Working Knowledge');     --4
INSERT INTO SkillLevels VALUES ('Proficient');            --5
INSERT INTO SkillLevels VALUES ('Deep Understanding');    --6
INSERT INTO SkillLevels VALUES ('Expert');                --7

--
--Create and populate Skills
--
CREATE TABLE Skills
(
    SkillID                int NOT NULL IDENTITY(00001,1) 
        CONSTRAINT pk_SkillID PRIMARY KEY
,   PersonID               int NOT NULL
        CONSTRAINT fk_SkillsPersonID_PersonPersonID FOREIGN KEY 
            REFERENCES Person(PersonID)
,   SkillDetailID          int NOT NULL
        CONSTRAINT fk_SkillsSkillDetailID_SkillDetailsSkillDetailID FOREIGN KEY 
            REFERENCES SkillDetails(SkillDetailID)
,   SkillLevelID           int NOT NULL 
        CONSTRAINT fk_SkillsSkillLevelID_SkillLevelsSkillLevelID FOREIGN KEY 
            REFERENCES SkillLevels(SkillLevelID)
);
INSERT INTO Skills VALUES (001,0001,6);--('Microsoft SQL Server')
INSERT INTO Skills VALUES (001,0002,6);--('T-SQL')
INSERT INTO Skills VALUES (001,0003,4);--('SSMS')
INSERT INTO Skills VALUES (001,0004,3);--('SSIS')
INSERT INTO Skills VALUES (001,0005,6);--('SQL Report Writing')
INSERT INTO Skills VALUES (001,0006,4);--('NoSQL')
INSERT INTO Skills VALUES (001,0007,4);--('MongoDB')
INSERT INTO Skills VALUES (001,0008,3);--('C')
INSERT INTO Skills VALUES (001,0009,3);--('C++')
INSERT INTO Skills VALUES (001,0010,4);--('C#')
INSERT INTO Skills VALUES (001,0011,3);--('.Net Framework')
INSERT INTO Skills VALUES (001,0012,2);--('Java')
INSERT INTO Skills VALUES (001,0013,4);--('JavaScript')
INSERT INTO Skills VALUES (001,0014,3);--('jQuery')
INSERT INTO Skills VALUES (001,0015,4);--('HTML')
INSERT INTO Skills VALUES (001,0016,4);--('CSS')
INSERT INTO Skills VALUES (001,0017,3);--('PHP')
INSERT INTO Skills VALUES (001,0018,4);--('Perl')
INSERT INTO Skills VALUES (001,0019,3);--('Ruby')
INSERT INTO Skills VALUES (001,0020,4);--('MEAN Stack')
INSERT INTO Skills VALUES (001,0021,4);--('MEAN-MongoDB')
INSERT INTO Skills VALUES (001,0022,2);--('MEAN-Express')
INSERT INTO Skills VALUES (001,0023,4);--('MEAN-Angular')
INSERT INTO Skills VALUES (001,0024,4);--('MEAN-Node.JS')
INSERT INTO Skills VALUES (001,0025,5);--('Relational Databases')
INSERT INTO Skills VALUES (001,0026,4);--('Non-relational Databases')
INSERT INTO Skills VALUES (001,0027,6);--('Database Design')


--
--Generate a condensed summary
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
,   WorkHistory.CurrentPosition + 
        ' (' + 
        CAST(WorkHistory.CurrentPositionStart AS varchar(10)) + 
        ' - ' + 
        CAST(GETDATE() AS varchar(10)) + 
        ')'                                              AS [CurrentPosition]
,   WorkHistory.Company
,   WorkHistory.PreviousPosition + 
        ' (' + 
        CAST(WorkHistory.PreviousPositionStart AS varchar(10)) + 
        ' - ' + 
        CAST(WorkHistory.PreviousPositionEnd AS varchar(10)) + 
        ')'                                              AS [PreviousPosition]
FROM Person
    INNER JOIN Education
        ON Person.PersonID = Education.PersonID
    INNER JOIN WorkHistory
        ON Person.PersonID = WorkHistory.PersonID;


--
--Generate Skills summary
--
SELECT
    Person.FirstName + 
        ' ' + 
        Person.LastName                AS [Person]
,   SkillDetails.SkillName             AS [Skills]
,   REPLICATE('*',Skills.SkillLevelID) AS [SkillLevel]
,   SkillLevels.SkillLevelName         AS [SkillDescription]
FROM Person
    INNER JOIN Skills
        ON Person.PersonID = Skills.PersonID
    INNER JOIN SkillDetails
        ON Skills.SkillID = SkillDetails.SkillDetailID
    INNER JOIN SkillLevels
        ON Skills.SkillLevelID = SkillLevels.SkillLevelID
WHERE Skills.SkillLevelID > 2
ORDER BY Skills.SkillLevelID DESC;
