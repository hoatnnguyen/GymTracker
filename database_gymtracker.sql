CREATE DATABASE IF NOT EXISTS gymTracker;
use gymTracker;

CREATE TABLE `user` (
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

CREATE TABLE `tracking` (
    trackingId INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    `date` DATE NOT NULL,
    `weight` INT NOT NULL,
    height INT NOT NULL,
    heartRate INT NULL,
    fatRate INT NULL,
    PRIMARY KEY (trackingId)
);

ALTER TABLE `tracking`
    ADD CONSTRAINT `trackingUser`
        FOREIGN KEY (userId)
        REFERENCES `user` (userId);

CREATE TABLE `nutrition` (
    nutritionId INT NOT NULL AUTO_INCREMENT,
    food VARCHAR(64) NOT NULL,
    calo INT NOT NULL,
    PRIMARY KEY (nutritionId)
);

CREATE TABLE `challenge` (
    challengeId INT NOT NULL AUTO_INCREMENT,
    challengeDescription VARCHAR(255) NOT NULL,
    challengeStatus VARCHAR(32) NOT NULL,
    PRIMARY KEY (challengeId)
);

CREATE TABLE `exercise` (
    exerciseId INT NOT NULL AUTO_INCREMENT,
    exerciseType VARCHAR(64) NOT NULL,
    exerciseDescription VARCHAR(255) NULL,
    timeStart DATETIME NOT NULL,
    timeEnd DATETIME NOT NULL,
    `set` INT NOT NULL,
    `rep` INT NOT NULL,
    PRIMARY KEY (exerciseId)
);

CREATE TABLE `planning` (
    planningId INT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    userId INT NOT NULL,
    exerciseId INT NOT NULL,
    nutritionId INT NOT NULL,
    PRIMARY KEY (planningId)
);

ALTER TABLE `planning` ADD CONSTRAINT planningUser
    FOREIGN KEY (userId)
    REFERENCES `user` (userId);

ALTER TABLE `planning` ADD CONSTRAINT planningExercise
    FOREIGN KEY (exerciseId)
    REFERENCES `exercise`(exerciseId);

ALTER TABLE `planning` ADD CONSTRAINT planningNutrition
    FOREIGN KEY (nutritionId)
    REFERENCES `nutrition`(nutritionId);
