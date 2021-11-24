-- ------------------------------------ --
-- Populate the database with some data --
-- ------------------------------------ --
INSERT INTO player VALUES 
	("19960225-2380", "Johan Andersson"), 
    ("19970329-2384", "Nicklas Jansson"),
	("19951108-2399", "Annika Persson"),
	("19990517-2392", "Maj Stenlund"),
	("19900517-2383", "Madina Guldrot"),
	("19800913-9265", "Mumtaz Biermann"),
	("19861123-9883", "Aryan Ängfjärd"),
	("19991111-2390", "Felicia Heide"),
	("20000810-2386", "Oskar Uddhage"),
	("20030220-2387", "Ava Risell");

INSERT INTO competition VALUES 
	(1, "Big Golf Cup Skövde", "2021-06-11"),
	(2, "Little Golf open, Myresjö", "2021-05-23"),
	(3, "Company Cup, Företagsstad", "2021-08-31"),
	(4, "Svea Open, Uppsala", "2022-07-22");

INSERT INTO competition_player VALUES 
	(1, "19960225-2380"),
	(1, "19970329-2384"),
	(1, "19951108-2399"),
	(1, "19861123-9883"),
	(2, "20030220-2387"),
	(4, "19800913-9265"),
	(1, "20030220-2387"),
	(3, "20030220-2387"),
	(4, "20030220-2387"),
	(4, "19900517-2383");

INSERT INTO raintype VALUES 
	(1, "Light showers"),
	(2, "Rain"),
	(3, "Heavy rain"),
	(4, "Hail"),
	(5, "Snow");

INSERT INTO rain VALUES 
	(1, 4, 10, "12:16:00", 1),
	(2, 2, 7, "13:54:40", 1),
	(3, 3, 15, "10:32:42", 2),
	(4, 2, 4, "16:26:00", 3);

INSERT INTO jacket VALUES 
	(1, "Fleece jacket", "L", "Fleece", "19960225-2380"),
	(2, "Rain jacket", "L", "GoreTex", "19960225-2380"),
	(3, "Softshell", "S", "Polyester", "19900517-2383"),
	(4, "Windbreaker", "XL", "Polyester", "20000810-2386");

INSERT INTO constructionProperties VALUES (1, 10), (2, 5), (3, 23);

INSERT INTO club VALUES 
	(1, 1, "Wood", 1, "19960225-2380"),
	(2, 5, "Wood", 2, "19951108-2399"),
	(3, 4, "Iron", 3, "20030220-2387"),
	(4, 5, "Wood", 2, "19800913-9265");
