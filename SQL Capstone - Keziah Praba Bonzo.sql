# Creating a database of famous_singers and then making more tables about things they do and joining those to create nice human readable lists.
# Creating a database of famous singers

CREATE DATABASE famous_singers;

# Creating a table of some famous singers containing their names, the title of one of their famous songs and their forbes networth

USE famous_singers;

CREATE TABLE Singers (
    Singer_ID INTEGER PRIMARY KEY,
    Singer_name TEXT,
    song_title TEXT,
    Forbes_networth TEXT
);
INSERT INTO Singers VALUES (1, "Taylor_Swift", "I Bet You Think About Me", "1.1 Billion");
INSERT INTO Singers VALUES (2, "Miley_Cyrus", "Used to Be Young", "160 Million");
INSERT INTO Singers VALUES (3, "Selena_Gomez", "Who Says", "100 Million");
INSERT INTO Singers VALUES (4, "Adele", "Hello", "220 Million");
INSERT INTO Singers VALUES (5, "Sia", "Floating Through Space", "30 Million");
INSERT INTO Singers VALUES (6, "Kygo", "It Ain't Me", "25 Million");
INSERT INTO Singers VALUES (7, "Ed_Sheeran", "Castle on the Hill", "200 Million");
INSERT INTO Singers VALUES (8, "Demi_Lovato", "Heart Attack", "40 Million");
INSERT INTO Singers VALUES (9, "Rema", "Calm Down", "5 Million");
INSERT INTO Singers VALUES (10, "Justin_Bieber", "Baby", "300 Million");

SELECT * FROM Singers;
# Creating a table containing the personal details of the singers.

CREATE TABLE Singers_Personal_details (
    Singer_ID INTEGER PRIMARY KEY,
    Age INTEGER,
    Hometown TEXT,
    Country TEXT
);

INSERT INTO Singers_Personal_details VALUES (1, 34, "West Reading, Pennsylvania", "USA"); -- Taylor Swift
INSERT INTO Singers_Personal_details VALUES (2, 31, "Franklin, Tennessee", "USA"); -- Miley Cyrus
INSERT INTO Singers_Personal_details VALUES (3, 32, "Grand Prairie, Texas", "USA"); -- Selena Gomez
INSERT INTO Singers_Personal_details VALUES (4, 36, "Tottenham, London", "UK"); -- Adele
INSERT INTO Singers_Personal_details VALUES (5, 48, "Adelaide, South Australia", "Australia"); -- Sia
INSERT INTO Singers_Personal_details VALUES (6, 33, "Bergen", "Norway"); -- Kygo
INSERT INTO Singers_Personal_details VALUES (7, 33, "Halifax, West Yorkshire", "UK"); -- Ed Sheeran
INSERT INTO Singers_Personal_details VALUES (8, 31, "Albuquerque, New Mexico", "USA"); -- Demi Lovato
INSERT INTO Singers_Personal_details VALUES (9, 24, "Benin City, Edo State", "Nigeria"); -- Rema
INSERT INTO Singers_Personal_details VALUES (10, 30, "London, Ontario", "Canada"); -- Justin Bieber

SELECT * FROM Singers_Personal_details;
# Creating a table containing the achievements of the singers such as awards, world records and their number of instagram followers

CREATE TABLE Singers_Achievements (
    Singer_ID INTEGER PRIMARY KEY,
    Awards INTEGER,
    Number_of_World_Records INTEGER,
    Number_of_Instagram_Followers TEXT
);

INSERT INTO Singers_Achievements VALUES (1, 500, 11, "275 Million"); -- Taylor Swift
INSERT INTO Singers_Achievements VALUES (2, 75, 0, "214 Million"); -- Miley Cyrus
INSERT INTO Singers_Achievements VALUES (3, 150, 1, "430 Million"); -- Selena Gomez
INSERT INTO Singers_Achievements VALUES (4, 150, 2, "55 Million"); -- Adele
INSERT INTO Singers_Achievements VALUES (5, 25, 0, "9 Million"); -- Sia
INSERT INTO Singers_Achievements VALUES (6, 30, 0, "5 Million"); -- Kygo
INSERT INTO Singers_Achievements VALUES (7, 120, 4, "45 Million"); -- Ed Sheeran
INSERT INTO Singers_Achievements VALUES (8, 60, 0, "150 Million"); -- Demi Lovato
INSERT INTO Singers_Achievements VALUES (9, 10, 0, "9 Million"); -- Rema
INSERT INTO Singers_Achievements VALUES (10, 300, 3, "290 Million"); -- Justin Bieber

SELECT * FROM Singers_Achievements;
# Creating a table that provides all relevant details about a singer by joining the three initially created tables
SELECT * 
FROM Singers

JOIN Singers_Personal_details ON Singers.Singer_ID = Singers_Personal_details.Singer_ID

JOIN Singers_Achievements ON Singers.Singer_ID = Singers_Achievements.Singer_ID;

# From the achievements table, we realise that not all singers have a world record. Let's separate all singers who have a world record.

SELECT Singers.Singer_name, Singers_Achievements.Number_of_World_Records
FROM Singers
JOIN Singers_Achievements ON Singers.Singer_ID = Singers_Achievements.Singer_ID
WHERE Singers_Achievements.Number_of_World_Records > 0;

# The singers in this data are part of the most famous singers in the world. Let's find the average age of singers in the database. 

SELECT  AVG(Singers_Personal_details.Age) AS Average_Age
FROM Singers_Personal_details;

-- From the tables created, let's analyze some facts concerning all the singers by creating a final table that summarizes all the facts.

CREATE TABLE Analysis(fact_ID INTEGER PRIMARY KEY,facts TEXT, Singer TEXT);
INSERT INTO Analysis VALUES(1,"Singer with the highest forbes networth","Taylor_Swift");
INSERT INTO Analysis VALUES(2,"Youngest Singer","Rema");
INSERT INTO Analysis VALUES(3,"Oldest Singer","Sia");
INSERT INTO Analysis VALUES(4,"Singer with the most world records","Taylor_Swift");
INSERT INTO Analysis VALUES(5,"Singer with the awards","Taylor_Swift");
INSERT INTO Analysis VALUES(6,"Singer with the most instagram followers","Selena_Gomez");
INSERT INTO Analysis VALUES(7,"Singer with the least instagram followers","Kygo");

SELECT * FROM Analysis;
