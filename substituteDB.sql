-- Substitute Teaching Database

DROP DATABASE IF EXISTS substitute_teach;

CREATE DATABASE IF NOT EXISTS substitute_teach;

USE substitute_teach;

CREATE TABLE IF NOT EXISTS superintendent
(
	superintendent_ID	INT				PRIMARY KEY		NOT NULL	AUTO_INCREMENT,
    superintendent_Name	VARCHAR(50)		NOT NULL,
    street				VARCHAR(50)		NOT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				CHAR(2)			NOT NULL,
    zip					CHAR(5)			NOT NULL,
    county				VARCHAR(20)		NOT NULL,
    phone				INT				NOT NULL
);

CREATE TABLE IF NOT EXISTS district
(
	district_ID			INT				PRIMARY KEY		NOT NULL	AUTO_INCREMENT,
    district_Name		VARCHAR(50)		NOT NULL,
    street				VARCHAR(50)		NOT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				CHAR(2)			NOT NULL,
    zip					CHAR(5)			NOT NULL,
    county				VARCHAR(20)		NOT NULL,
    phone				CHAR(10)		NOT NULL,
    superintendent_ID	INT				NOT NULL,
    CONSTRAINT district_fk_superintendent FOREIGN KEY (superintendent_ID)
    REFERENCES superintendent(superintendent_ID)
);

CREATE TABLE IF NOT EXISTS school
(
	school_ID			INT				PRIMARY KEY		NOT NULL	AUTO_INCREMENT,
    school_Name			VARCHAR(50)		NOT NULL,
    street				VARCHAR(50)		NOT NULL,
    city				VARCHAR(50)		NOT NULL,
    zip					CHAR(5)			NOT NULL,
    phone				CHAR(10)		NOT NULL,
    district_ID			INT 			NOT NULL,
    CONSTRAINT school_fk_district FOREIGN KEY (district_ID)
    REFERENCES district(district_ID)
);

-- NOT NORMALIZED ENOUGH, PLUS NEED CATEGORIES LIKE DUAL LANGUAGE BOOLEAN
-- I THINK GRADE SHOULD BE IN ITS OWN TABLE

CREATE TABLE IF NOT EXISTS teacher
(
	teacher_ID			INT			PRIMARY KEY		NOT NULL	AUTO_INCREMENT,
    first_name			VARCHAR(25),
    last_name			VARCHAR(25),
    -- Grade should have its own table in order to further normalize,
    -- Will keep this way to get a functional database for now.
    grade				VARCHAR(25),
    roving				BOOL		NOT NULL, 
    school_ID			INT,
	CONSTRAINT teacher_fk_school FOREIGN KEY (school_ID)
    REFERENCES school(school_ID)
);

-- WHERE SHOULD ASSIGNMENT LINK TO THE SCHOOL SYSTEM, PROBABLY 
-- SCHOOL, MAYBE TO TEACHER BUT NEED DATES TO MATCH TEACHERS 
-- TO GRADES AND SCHOOL, CAN EASILY CHANGE OVER TIME
-- ALSO ADD SUSTITUTE ID LATER ON, BUT FOR NOW THIS IS FOR MY
-- PERSONAL USE.

CREATE TABLE IF NOT EXISTS assignment
(
	assignment_ID		INT			PRIMARY KEY		NOT NULL	AUTO_INCREMENT,
	assignment_date		DATE		NOT NULL,
    cancelled			BOOL 		NOT NULL,
    teacher_ID			INT 		NOT NULL,
    CONSTRAINT assignment_fk_teacher FOREIGN KEY (teacher_ID)
    REFERENCES teacher(teacher_ID)
);

