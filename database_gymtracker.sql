CREATE DATABASE IF NOT EXISTS gymTracker;
use gymTracker;

CREATE TABLE `User` (
    userId INT NOT NULL AUTO_INCREMENT,
    userName VARCHAR(32) NOT NULL,
    email VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    firstName VARCHAR(32) NOT NULL,
    lastName VARCHAR(32) NOT NULL,
    phoneNumber VARCHAR(16) NOT NULL,
    age INT NULL,
    gender VARCHAR(4) NULL,
    PRIMARY KEY (userId)
);

CREATE TABLE `Tracking` (
    trackingId INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    `date` DATE NOT NULL,
    `weight` INT NOT NULL,
    height INT NOT NULL,
    heartRate INT NULL,
    fatRate INT NULL,
    PRIMARY KEY (trackingId)
);

ALTER TABLE `Tracking`
    ADD CONSTRAINT `trackingUser`
        FOREIGN KEY (userId)
        REFERENCES `User` (userId);

CREATE TABLE `Nutrition` (
    nutritionId INT NOT NULL AUTO_INCREMENT,
    food VARCHAR(64) NOT NULL,
    calo INT NOT NULL,
    PRIMARY KEY (nutritionId)
);

CREATE TABLE `Challenge` (
    challengeId INT NOT NULL AUTO_INCREMENT,
    challengeDescription VARCHAR(255) NOT NULL,
    challengeStatus VARCHAR(32) NOT NULL,
    PRIMARY KEY (challengeId)
);

CREATE TABLE `Exercise` (
    exerciseId INT NOT NULL AUTO_INCREMENT,
    exerciseType VARCHAR(64) NOT NULL,
    exerciseDescription VARCHAR(255) NULL,
    timeStart DATETIME NOT NULL,
    timeEnd DATETIME NOT NULL,
    `set` INT NOT NULL,
    `rep` INT NOT NULL,
    PRIMARY KEY (exerciseId)
);

CREATE TABLE `Planning` (
    planningId INT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    userId INT NOT NULL,
    exerciseId INT NOT NULL,
    nutritionId INT NOT NULL,
    PRIMARY KEY (planningId)
);

CREATE TABLE `Friend` (
    friendId INT NOT NULL AUTO_INCREMENT,
    userId1 INT NOT NULL,
    userId2 INT NOT NULL,
    challengeId INT NOT NULL,
    PRIMARY KEY (friendId)
);

ALTER TABLE `Friend` 
    ADD CONSTRAINT friendUser1 FOREIGN KEY (userId1) REFERENCES `User` (userId),
    ADD CONSTRAINT friendUser2 FOREIGN KEY (userId2) REFERENCES `User` (userId),
    ADD CONSTRAINT friendChallenge FOREIGN KEY (challengeId) REFERENCES `Challenge` (challengeId),
    ADD CONSTRAINT checkfriendId CHECK (userId1 <> userId2);

ALTER TABLE `Planning` 
    ADD CONSTRAINT planningUser FOREIGN KEY (userId) REFERENCES `User` (userId),
    ADD CONSTRAINT planningExercise FOREIGN KEY (exerciseId) REFERENCES `Exercise`(exerciseId),
    ADD CONSTRAINT planningNutrition FOREIGN KEY (nutritionId) REFERENCES `Nutrition`(nutritionId);

-- Insert data into User table
INSERT INTO User (userName, email, `password`, firstName, lastName, phoneNumber, age, gender)
VALUES 
    ('john_doe', 'john_doe@gmail.com', 'password123', 'John', 'Doe', '1234567890', 25, 'M'),
    ('jane_doe', 'jane_doe@gmail.com', 'password456', 'Jane', 'Doe', '0987654321', 30, 'F'),
    ('selenatn', 'nguyen@gmail.com', 'password', 'Hoa', 'Nguyen', '123456789', 18, 'F'),
    ('giahan', 'vanchuong@gmail.com', 'password8394', 'Van', 'Pham', '9384729485', 19, 'M');

-- Insert data into Tracking table
INSERT INTO Tracking (userId, `date`, `weight`, height, heartRate, fatRate)
VALUES 
    (1, '2023-05-01', 70, 175, 80, 20),
    (1, '2023-05-08', 69, 174, 75, 19),
    (2, '2023-05-01', 60, 165, 70, 18),
    (2, '2023-05-08', 59, 164, 65, 17),
    (3, '2023-05-01', 50, 155, 60, 16),
    (3, '2023-05-08', 49, 154, 55, 15),
    (4, '2023-05-01', 80, 185, 90, 25),
    (4, '2023-05-08', 79, 184, 85, 24);

-- Insert data into Nutrition table
INSERT INTO Nutrition (food, calo)
VALUES 
    ('Egg', 80),
    ('Chicken Breast', 165),
    ('Brown Rice', 110),
    ('Banana', 105),
    ('Apple', 95),
    ('Spinach', 23);

-- Insert data into Challenge table
INSERT INTO Challenge (challengeDescription, challengeStatus)
VALUES 
    ('Lose 5 pounds in 1 month', 'ongoing'),
    ('Run 10 miles per week', 'completed'),
    ('Do 50 push-ups in one set', 'Not started');

-- Insert data into Exercise table
INSERT INTO Exercise (exerciseType, exerciseDescription, timeStart, timeEnd, `set`, rep)
VALUES 
    ('Cardio', 'Running on Treadmill', '2022-01-01 10:00:00', '2022-01-01 11:00:00', 3, 10),
    ('Strength', 'Bench Press', '2022-01-02 10:00:00', '2022-01-02 11:00:00', 3, 10),
    ('Cardio', 'Cycling', '2023-05-09 10:00:00', '2023-05-09 11:00:00', 1, 45),
    ('Strength', 'Squats', '2023-05-09 11:00:00', '2023-05-09 12:00:00', 3, 8),
    ('Cardio', 'Jump rope', '2023-05-09 12:00:00', '2023-05-09 13:00:00', 1, 20);

-- Insert data into Planning table
INSERT INTO Planning (`date`, userId, exerciseId, nutritionId)
VALUES 
    ('2023-05-12', 1, 1, 1),
    ('2023-05-12', 2, 2, 2),
    ('2023-05-13', 3, 3, 3),
    ('2023-05-13', 4, 4, 4);

-- Insert data into Friend table
INSERT INTO Friend (userId1, userId2, challengeId)
VALUES 
    (1, 2, 1),
    (2, 3, 2),
    (3, 4, 3),
    (4, 1, 1);
