show databases;
create database m290_ressourcen;
use m290_ressourcen;

DROP TABLE Person;
CREATE TABLE if not exists Person (
                        person_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                        name VARCHAR(50),
                        surname VARCHAR(50),
                        username VARCHAR(50),
                        password VARCHAR(20)
);

INSERT INTO Person (person_id,name, surname, username, password)
VALUES
    (0,'Demir', 'Volkan', 'volkandemir', 'password123'),
    (0,'John', 'Doe', 'johndoe', 'securepwd'),
    (0,'Michael', 'Johnson', 'michaelj', 'mikepass'),
    (0,'Emily', 'Williams', 'emilyw', 'pass1234'),
    (0,'David', 'Brown', 'davidbrown', 'brownpass');






CREATE TABLE Category (
                          category_id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50),
                          description TEXT
);

INSERT INTO Category (category_id,name, description)
VALUES
    (1,'camera', 'Category for camera equipment'),
    (2,'lighting', 'Category for lighting equipment'),
    (3,'audio-accessory', 'Category for audio accessories');


CREATE TABLE Place (
                       place_id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(50),
                       location VARCHAR(100)
);

INSERT INTO Place (place_id,name, location)
VALUES
    (1,'BZZ Zürichsee Horgen', 'Seestrasse 110, 8810 Horgen'),        -- Place 1
    (2,'BZZ Oberdorf Horgen', 'Tödistrasse 56, 8810 Horgen'), -- Place 2
    (3,'BZZ Stäfa', 'Kirchbühlstrasse 21, 8712 Stäfa');  -- Place 3


CREATE TABLE Reservation (
                         reservation_id INT AUTO_INCREMENT PRIMARY KEY,
                         person_id INT,
                         place_id INT,
                         category_id INT,
                         date DATE,
                         FOREIGN KEY (person_id) REFERENCES Person(person_id),
                         FOREIGN KEY (place_id) REFERENCES Place(place_id),
                         FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Reservation (person_id, place_id, category_id, date)
VALUES
    (1, 1, 1, '2023-01-05'),  -- Volkan reserved a camera
    (2, 2, 2, '2023-02-10'),  -- John reserved lighting
    (3, 3, 3, '2023-03-15'),  -- Michael reserved an audio accessory
    (4, 1, 2, '2023-04-20'),  -- Emily reserved lighting
    (5, 2, 1, '2023-05-25');  -- David reserved a camera


CREATE TABLE Resource
(
                            resource_id INT AUTO_INCREMENT PRIMARY KEY,
                            name        VARCHAR(50),
                            quantity    INT,
                            place_id    INT,
                            category_id INT,
                            FOREIGN KEY (place_id) REFERENCES Place (place_id),
                            FOREIGN KEY (category_id) REFERENCES Category (category_id)
);

INSERT INTO Resource (resource_id, name, quantity, place_id, category_id)
VALUES
    (1, 'Canon EOS 5D Mark IV', 5, 1, 1),     -- Camera at place 1
    (2, 'Nikon D850', 3, 1, 1),                -- Camera at place 1
    (3, 'Sony Alpha A7 III', 4, 1, 1),         -- Camera at place 1
    (4, 'LED Panel', 8, 2, 2),                 -- Lighting at place 2
    (5, 'Softbox Kit', 6, 2, 2),               -- Lighting at place 2
    (6, 'Ring Light', 5, 2, 2),                -- Lighting at place 2
    (7, 'Wireless Microphone', 10, 3, 3),      -- Audio accessory at place 3
    (8, 'Shotgun Microphone', 7, 3, 3),        -- Audio accessory at place 3
    (9, 'Lavalier Microphone', 12, 3, 3);      -- Audio accessory at place 3


select * from Person;
select * from Category;
select * from Place;
select * from Reservation;
select * from Resource;

UPDATE Person
SET name = 'Alice'
WHERE person_id = 3;

DROP TABLE Place;






