/*
    Please run Resume_CreateTables.sql before 
    using the Queries within this file.

    Thank you for taking the time to review this file.
*/

--
--Generate a condensed summary
--
SELECT
      Person.FirstName + ' ' + Person.LastName           AS [Person]
    , Person.EmailAddress
    , Person.City + ', ' + Person.State                  AS [Location]
    , Education.DegreeEarned
    , Education.DegreeFrom                               AS [College]
    , CAST(Education.GraduatedDate AS varchar(10))       AS [Graduated]
    , WorkHistory.CurrentPosition + ' (' + 
        CAST(WorkHistory.CurrentPositionStart AS varchar(10)) + 
        ' - ' + CAST(GETDATE() AS varchar(10)) + ')'     AS [CurrentPosition]
    , WorkHistory.Company
    , WorkHistory.PreviousPosition + ' (' + 
        CAST(WorkHistory.PreviousPositionStart AS varchar(10)) + ' - ' + 
        CAST(WorkHistory.PreviousPositionEnd AS varchar(10)) + ')'
                                                         AS [PreviousPosition]
FROM Person
    INNER JOIN Education
        ON Person.PersonID = Education.PersonID
    INNER JOIN WorkHistory
        ON Person.PersonID = WorkHistory.PersonID;


--
--Generate Skills summary
--
SELECT
      Person.FirstName + ' ' + 
      Person.LastName                    AS [Person]
    , SkillDetails.SkillName             AS [Skills]
    , REPLICATE('*',Skills.SkillLevelID) AS [SkillLevel]
    , SkillLevels.SkillLevelName         AS [SkillDescription]
FROM Person
    INNER JOIN Skills
        ON Person.PersonID = Skills.PersonID
    INNER JOIN SkillDetails
        ON Skills.SkillID = SkillDetails.SkillID
    INNER JOIN SkillLevels
        ON Skills.SkillLevelID = SkillLevels.SkillLevelID
WHERE Skills.SkillLevelID > 2
ORDER BY Skills.SkillLevelID DESC;