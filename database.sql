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
-- Table `atm`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `atm`.`users` ;

CREATE TABLE IF NOT EXISTS `atm`.`users` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `LASTNAME` VARCHAR(32) NOT NULL,
  `FIRSTNAME` VARCHAR(255) NOT NULL,
  `BANK` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `atm`.`card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `atm`.`card` ;

CREATE TABLE IF NOT EXISTS `atm`.`card` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `CARD` VARCHAR(255) NOT NULL,
  `PASSWORD` VARCHAR(255) NOT NULL,
  `ID_USER` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_USER_idx` (`ID_USER` ASC),
  CONSTRAINT `ID_USER`
    FOREIGN KEY (`ID_USER`)
    REFERENCES `atm`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `atm`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `atm`.`transaction` ;

CREATE TABLE IF NOT EXISTS `atm`.`transaction` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` FLOAT(13,2) NOT NULL,
  `ID_CARD` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_CARD_idx` (`ID_CARD` ASC),
  CONSTRAINT `ID_CARD`
    FOREIGN KEY (`ID_CARD`)
    REFERENCES `atm`.`card` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO users(ID, LASTNAME, FIRSTNAME, BANK) VALUES(NULL, 'Frédéric', 'Rosso', 1);
INSERT INTO card(ID, CARD, PASSWORD, ID_USER) VALUES(NULL, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1);
INSERT INTO transaction(ID, AMOUNT, ID_CARD) VALUES(NULL, 10.0, 1);