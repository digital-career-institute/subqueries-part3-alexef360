CREATE TABLE jobOpening (
    jobID INT PRIMARY KEY,
    jobTitle VARCHAR(255),
    department VARCHAR(255),
    minExperience INT,
    minEducation VARCHAR(255)
);

CREATE TABLE applicants (
    aplicantID INT PRIMARY KEY,
    aplicantName VARCHAR(255),
    experienceYear INT,
    education VARCHAR(255),
    appliedForJobID INT,
    FOREIGN KEY (appliedForJobID)
        REFERENCES jobOpening (jobID)
);

 insert into jobOpening values 
 (101, 'Spacecraft Pilot', 'Flight Operations', 5, "Bachelor's in Aerospace Engineering"),
 (102, 'Mission Specialist', 'Science', 3, 'PhD in Phisics or related field'),
 (103, 'Space Engineer', 'Engineering', 3, "Bachelor's in Mechanical Engineering"),
 (104, 'Communications Officer', 'Communication', 2, "Bachelor's in Communications");
 insert into applicants values 
 (501, 'John Astronaut', 7, "Master's in Aerospace Engineering", 101),
 (502, 'Lisa Scientist', 4, 'Phd in Physics', 102),
 (503, 'Mark Engineer', 5, "Bachelor's in Mechanical Engineering", 103),
 (504, 'Emily Communicator', 3, "Bachelor's in Communication", 104);

SELECT 
    *
FROM
    jobOpening;

SELECT 
    a.aplicantName, j.jobTitle
FROM
    applicants a
        LEFT JOIN
    jobOpening j ON a.appliedForJobID = j.jobID;

SELECT 
    a.aplicantName, j.jobTitle
FROM
    applicants a
        JOIN
    jobOpening j ON a.appliedForJobID = j.jobID
WHERE
    a.experienceYear >= j.minExperience
        AND a.education >= j.minEducation;

 INSERT INTO applicants (aplicantID, aplicantName, experienceYear, education, appliedForJobID)
VALUES (505, 'Alex Engineer', 4, "Bachelor's in Electrical Engineering");

SELECT 
    a.aplicantName
FROM
    applicants a
        LEFT JOIN
    jobOpening j ON a.appliedForJobID = j.jobID
WHERE
    j.jobID IS NULL;

SELECT 
    *
FROM
    jobOpening
WHERE
    minExperience BETWEEN 3 AND 5;

SELECT 
    j.jobTitle,
    COUNT(CASE
        WHEN a.education LIKE 'Bachelor\'s %%' THEN 1
    END) AS 'Bachelor\'s',
    COUNT(CASE
        WHEN a.education LIKE 'Master\'s %%' THEN 1
    END) AS 'Master\'s',
    COUNT(CASE
        WHEN a.education LIKE 'PhD %%' THEN 1
    END) AS 'PhD'
FROM
    jobOpening j
        LEFT JOIN
    applicants a ON j.jobID = a.appliedForJobID
GROUP BY j.jobTitle;
 
 
