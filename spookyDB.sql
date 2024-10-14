CREATE DATABASE spookyDB;

USE spookyDB;

CREATE TABLE spooky_characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    hobbies VARCHAR(255),
    superpower VARCHAR(100),
    passion VARCHAR(100)
);
INSERT INTO spooky_characters (firstName, lastName, age, hobbies, superpower, passion)
VALUES 
('Casper', 'The Friendly Ghost', 100, 'Floating, Glowing', 'Invisibility', 'Making friends'),
('Dracula', 'Vampire', 400, 'Sucking blood, Flying', 'Transformation', 'Immortality'),
('Frankenstein', 'Monster', 200, 'Growling, Wandering', 'Super strength', 'Finding peace');