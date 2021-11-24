-- Get Johan Andersson's age
SELECT `name` AS "Player Name", timestampdiff(
		YEAR, 
        STR_TO_DATE(SUBSTRING(personNumber, 1, 8), "%Y%m%d"),
        CURDATE()) AS Age
FROM player 
WHERE personNumber = "19960225-2380";

-- Get Johan Andersson's age using view
SELECT `name` AS "Player Name", age AS Age
FROM playerAge
WHERE personNumber = "19960225-2380";

-- Get the competition date for Big Golf Cup Skövde
SELECT `name` AS "Competition", `date` AS "Date"
FROM competition
WHERE `name` LIKE "Big Golf Cup Skövde";

-- Get the material for Johan Andersson's club
SELECT p.`name` AS "Player Name", c.material AS "Club Material"
FROM player AS p JOIN club AS c
	ON p.personNumber = c.personNumber
WHERE p.`name` LIKE "Johan Andersson";

-- Get all Johan Andersson's jackets
SELECT p.`name` AS "Player Name", j.model AS "Jacket Model",
	j.material AS "Jacket Material", j.size AS "Jacket Size"
FROM player AS p JOIN jacket AS j
	ON p.personNumber = j.personNumber
WHERE p.`name` LIKE "Johan Andersson";

-- Get all players at Big Golf Cup Skövde
SELECT c.`name` AS "Competition", p.`name` AS "Player Name"
FROM competition AS c INNER JOIN competition_player AS c_p
	ON c.competitionId = c_p.competitionId
INNER JOIN player AS p
	ON c_p.personNumber = p.personNumber
WHERE c.`name` LIKE "Big Golf Cup Skövde";

-- Get the rains windspeeds at Big Golf Cup Skövde
SELECT c.`name` AS "Competition", r.`windSpeed` AS "Rain Wind Speed"
FROM competition AS c INNER JOIN rain AS r
	ON c.competitionId = r.competitionId
WHERE c.`name` LIKE "Big Golf Cup Skövde";

-- Get all players under age of 30
SELECT * 
FROM (SELECT `name` AS "Player Name", 
	timestampdiff(
		YEAR,
        STR_TO_DATE(SUBSTRING(personNumber, 1, 8), "%Y%m%d"),
        CURDATE()) AS Age 
    FROM player) AS players
WHERE players.Age < 30;

-- Get all players under age of 30 using view
SELECT * FROM playerAge;

-- Remove all Johan Andersson's jackets
DELETE j
FROM player AS p INNER JOIN jacket AS j
	ON p.personNumber = j.personNumber
WHERE p.`name` LIKE "Johan Andersson";
    
-- Remove player Nicklas Jansson
DELETE p
FROM player AS p 
WHERE p.`name` LIKE "Nicklas Jansson";

-- Get the avarage age of the players
SELECT AVG (timestampdiff(YEAR,	STR_TO_DATE(SUBSTRING(personNumber, 1, 8), "%Y%m%d"), CURDATE())
) AS "Average Age"
FROM player;

-- Get the avarage age of the players using view
SELECT AVG (age) AS "Average Age"
FROM playerAge;
