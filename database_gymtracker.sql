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
