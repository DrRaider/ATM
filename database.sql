-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema atm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atm` DEFAULT CHARACTER SET utf8 ;
USE `atm` ;

-- -----------------------------------------------------
-- Table `atm`.`USERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm`.`USERS` (
  `ID` INT NOT NULL,
  `LASTNAME` VARCHAR(32) NOT NULL,
  `FIRSTNAME` VARCHAR(255) NOT NULL,
  `BANK` TINYINT(1) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm`.`CARD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm`.`CARD` (
  `ID` INT NOT NULL,
  `CARD` VARCHAR(255) NOT NULL,
  `PASSWORD` VARCHAR(255) NOT NULL,
  `ID_USER` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_USER_idx` (`ID_USER` ASC),
  CONSTRAINT `ID_USER`
    FOREIGN KEY (`ID_USER`)
    REFERENCES `atm`.`USERS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atm`.`TRANSACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atm`.`TRANSACTION` (
  `ID` INT NOT NULL,
  `AMOUNT` FLOAT(13,2) NOT NULL,
  `ID_CARD` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_CARD_idx` (`ID_CARD` ASC),
  CONSTRAINT `ID_CARD`
    FOREIGN KEY (`ID_CARD`)
    REFERENCES `atm`.`CARD` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO USERS(ID, LASTNAME, FIRSTNAME, BANK) VALUES(1, 'Frédéric', 'Rosso', 1);
INSERT INTO CARD(ID, CARD, PASSWORD, ID_USER) VALUES(1, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1);