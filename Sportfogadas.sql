CREATE TABLE `Bets` (
  `BetsID` INT PRIMARY KEY AUTO_INCREMENT,
  `BetDate` DATE NOT NULL,
  `Odds` FLOAT NOT NULL,
  `Amount` INT NOT NULL,
  `BettorsID` INT NOT NULL,
  `EventID` INT NOT NULL,
  `Status` BOOLEAN NOT NULL
);

CREATE TABLE `Bettors` (
  `BettorsID` INT PRIMARY KEY AUTO_INCREMENT,
  `Username` VARCHAR(50) NOT NULL,
  `Balance` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `JoinDate` DATE NOT NULL,
  `IsActive` BOOLEAN NOT NULL DEFAULT 1,
  `Role` ENUM ('User', 'Moderator', 'Admin') NOT NULL DEFAULT 'User'
);

CREATE TABLE `Events` (
  `EventID` INT PRIMARY KEY AUTO_INCREMENT,
  `EventName` VARCHAR(100) NOT NULL,
  `EventDate` DATE NOT NULL,
  `Category` VARCHAR(50) NOT NULL,
  `Location` VARCHAR(100) NOT NULL
);

ALTER TABLE `Bets` ADD FOREIGN KEY (`BettorsID`) REFERENCES `Bettors` (`BettorsID`);

ALTER TABLE `Bets` ADD FOREIGN KEY (`EventID`) REFERENCES `Events` (`EventID`);