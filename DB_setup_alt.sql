-- ------------------- --
-- Set up the database --
-- ------------------- --

DROP DATABASE Lexicon_GolfDB;
CREATE DATABASE Lexicon_GolfDB;
USE Lexicon_GolfDB;

CREATE TABLE competition (
    competitionId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `date` DATE NOT NULL
)  ENGINE=INNODB;

-- Age can be calculated from personNumber, and age is not static.
-- Age is therefor not included as a column. See view below to get age.
CREATE TABLE player (
    personNumber VARCHAR(13) PRIMARY KEY,
    `name` VARCHAR(50)
)  ENGINE=INNODB;

-- A view to get players and their ages
CREATE VIEW playerAge AS
	SELECT personNumber, `name`,
		timestampdiff(YEAR, STR_TO_DATE(SUBSTRING(personNumber, 1, 8), "%Y%m%d"), CURDATE()) AS age
	FROM player;

-- Competition - Player is a many to many relationship
CREATE TABLE competition_player (
    competitionId INT UNSIGNED NOT NULL,
    personNumber VARCHAR(13) NOT NULL,
    PRIMARY KEY (competitionId , personNumber),
    FOREIGN KEY (competitionId)
        REFERENCES competition (competitionId)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (personNumber)
        REFERENCES player (personNumber)
        ON UPDATE CASCADE ON DELETE CASCADE
)  ENGINE=INNODB;

-- Windspeed is not included in rain type, bc that would create 
-- to many similar rows with only speed as difference, and
-- would also be hard to resuse wasting space.
CREATE TABLE rainType (
    rainTypeId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(25) UNIQUE NOT NULL
)  ENGINE=INNODB;

-- A competition can have rain, at a specific time and
-- with a specific windspeed. The rain type is one of 
-- the the standard types in raintype.
CREATE TABLE rain (
    rainId INT UNSIGNED PRIMARY KEY,
    rainTypeId INT UNSIGNED,
    windSpeed INT UNSIGNED NOT NULL,
    `time` TIME NOT NULL,
    competitionId INT UNSIGNED NOT NULL,
    FOREIGN KEY (rainTypeId)
        REFERENCES rainType(rainTypeId)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (competitionId)
        REFERENCES competition(competitionId)
        ON UPDATE CASCADE ON DELETE CASCADE
)  ENGINE=INNODB;


CREATE TABLE jacket (
    jacketId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(30) NOT NULL,
    size VARCHAR(5) NOT NULL,
    material VARCHAR(20) NOT NULL,
    personNumber VARCHAR(13) NOT NULL,
    FOREIGN KEY (personNumber)
        REFERENCES player (personNumber)
        ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE(model, personNumber)
)  ENGINE=INNODB;

-- Serialnumber does not make sence as it is unique per part,
-- using lot istead that would have several parts(clubs) made from.
-- I would ha wanted to move material to this table from club below.
CREATE TABLE constructionProperties (
    lotId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hardness INT NOT NULL
)  ENGINE=INNODB;

CREATE TABLE club (
    clubId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `number` INT,
    material VARCHAR(20),
    lotId INT UNSIGNED NOT NULL,
    personNumber VARCHAR(13) NOT NULL,
    FOREIGN KEY (lotId)
        REFERENCES constructionProperties (lotId)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (personNumber)
        REFERENCES player (personNumber)
        ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE(`number`, personNumber)
)  ENGINE=INNODB;
