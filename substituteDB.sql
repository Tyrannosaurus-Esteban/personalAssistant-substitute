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

