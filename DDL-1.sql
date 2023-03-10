/*
TEAM JEM (Jessica Hwee, Erin Morales, Minjie Kim)
INFO 330 BA
Assignment: Revised ERD and Draft DDL
*/

-- Database Creation
CREATE DATABASE INFO_330B_Proj_JEM;

-- Table Creations According to ERD
USE INFO_330B_Proj_JEM;

CREATE TABLE tblTEAMS (
    TeamID INT IDENTITY(1,1) PRIMARY KEY,
    TeamName VARCHAR(50) NOT NULL
);

CREATE TABLE tblPLAYERS (
    PlayerID INT IDENTITY(1,1) PRIMARY KEY,
    PlayerFName VARCHAR(50) NOT NULL,
    PlayerLName VARCHAR(50) NOT NULL,
    PlayerEmail VARCHAR(80) NOT NULL,
	PlayerDOB DATE NOT NULL,
	TeamID INT REFERENCES tblTEAMS(TeamID)
);

CREATE TABLE tblARENAS (
	ArenaID INT IDENTITY(1,1) PRIMARY KEY,
	ArenaName VARCHAR(30) NOT NULL
);

CREATE TABLE tblMUSIC (
	MusicID INT IDENTITY(1,1) PRIMARY KEY,
	ArenaID INT REFERENCES tblARENAS(ArenaID),
	SongName VARCHAR(75)
);

CREATE TABLE tblRESULTS (
    ResultID INT IDENTITY(1,1) PRIMARY KEY, 
    Result VARCHAR(50), 
    ArenaID INT REFERENCES tblARENAS(ArenaID),
	CharacterID INT REFERENCES tblCHARACTERS(CharacterID)
);

CREATE TABLE tblPLAYER_RESULTS (
    PlayerID INT REFERENCES tblPLAYERS(PlayerID),
    ResultID INT REFERENCES tblRESULTS(ResultID),
	PRIMARY KEY (PlayerID, ResultID)
);

CREATE TABLE tblTIER (
    TierID INT IDENTITY(1,1) PRIMARY KEY,
    TierRankLetter CHAR(2)
);

CREATE TABLE tblSPECIAL_ATTACK (
    AttackID INT IDENTITY(1,1) PRIMARY KEY,
    AttackName VARCHAR(50),
    AttackDescription VARCHAR(250)
);

CREATE TABLE tblCHARACTERS (
    CharacterID INT IDENTITY(1,1) PRIMARY KEY, 
    CharacterName VARCHAR(50), 
    TierID INT REFERENCES tblTIER(TierID),
    AttackID INT REFERENCES tblSPECIAL_ATTACK(AttackID)
);

CREATE TABLE tblWEAKNESSES (
	WeaknessID INT IDENTITY(1,1) PRIMARY KEY,
	WeaknessName VARCHAR(60)
);

CREATE TABLE tblSTRENGTHS (
	StrengthID INT IDENTITY(1,1) PRIMARY KEY,
	StrengthName VARCHAR(60)
);

CREATE TABLE tblCHARACTER_STRENGTH (
	StrengthID INT REFERENCES tblSTRENGTHS(StrengthID),
	CharacterID INT REFERENCES tblCHARACTERS(CharacterID),
	PRIMARY KEY (StrengthID, CharacterID)
);

CREATE TABLE tblCHARACTER_WEAKNESS (
	WeaknessID INT REFERENCES tblWEAKNESSES(WeaknessID),
	CharacterID INT REFERENCES tblCHARACTERS(CharacterID),
	PRIMARY KEY (WeaknessID, CharacterID)
);

