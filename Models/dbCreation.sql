-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dblab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dblab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dblab` DEFAULT CHARACTER SET utf8mb3 ;
USE `dblab` ;

-- -----------------------------------------------------
-- Table `dblab`.`canale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`canale` (
  `numero` INT NOT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`programma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`programma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `genere` ENUM('Horror', 'Azione') NOT NULL,
  `descrizione` VARCHAR(45) NULL DEFAULT NULL,
  `link` TEXT NULL DEFAULT NULL,
  `image` TEXT NULL DEFAULT NULL,
  `isEpisodio` TINYINT(1) NOT NULL DEFAULT '0',
  `nEpisodio` INT NOT NULL DEFAULT '0',
  `nStagione` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`coinvolgimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`coinvolgimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `persona_id` INT NOT NULL,
  `programma_id` INT NOT NULL,
  `ruolo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `programma_id`),
  INDEX `fk_persona_has_programma_programma1_idx` (`programma_id` ASC) VISIBLE,
  INDEX `fk_persona_has_programma_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_persona_has_programma_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `dblab`.`persona` (`id`),
  CONSTRAINT `fk_persona_has_programma_programma1`
    FOREIGN KEY (`programma_id`)
    REFERENCES `dblab`.`programma` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`utente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`utente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `modalitàRicezione` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`iscrizione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`iscrizione` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `utente_id` INT NOT NULL,
  `canale_numero` INT NOT NULL,
  `oraInizio` TIME NOT NULL,
  `oraFine` TIME NOT NULL,
  INDEX `fk_utente_has_canale_canale1_idx` (`canale_numero` ASC) VISIBLE,
  INDEX `fk_utente_has_canale_utente_idx` (`utente_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_utente_has_canale_canale1`
    FOREIGN KEY (`canale_numero`)
    REFERENCES `dblab`.`canale` (`numero`),
  CONSTRAINT `fk_utente_has_canale_utente`
    FOREIGN KEY (`utente_id`)
    REFERENCES `dblab`.`utente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `dblab`.`messainonda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dblab`.`messainonda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programma_id` INT NOT NULL,
  `canale_numero` INT NOT NULL,
  `inizio` DATETIME NOT NULL,
  `fine` DATETIME NOT NULL,
  INDEX `fk_programma_has_canale_canale1_idx` (`canale_numero` ASC) VISIBLE,
  INDEX `fk_programma_has_canale_programma1_idx` (`programma_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_programma_has_canale_canale1`
    FOREIGN KEY (`canale_numero`)
    REFERENCES `dblab`.`canale` (`numero`),
  CONSTRAINT `fk_programma_has_canale_programma1`
    FOREIGN KEY (`programma_id`)
    REFERENCES `dblab`.`programma` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `dblab` ;

-- -----------------------------------------------------
-- procedure insertEpisode
-- -----------------------------------------------------

DELIMITER $$
USE `dblab`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEpisode`(IN name CHAR(45),genre INT,descr TEXT,lnk TEXT,img TEXT,nEpis INT,nSeas INT)
BEGIN

INSERT INTO programma(nome,genere,descrizione,link,image,isEpisodio,nEpisodio,nStagione) VALUES (name,genre,descr,lnk,img,1,nEpis,nSeas);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertFilm
-- -----------------------------------------------------

DELIMITER $$
USE `dblab`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFilm`(IN name CHAR(45),genre INT,descr TEXT,lnk TEXT,img TEXT)
BEGIN

INSERT INTO programma(nome,genere,descrizione,link,image) VALUES (name,genre,descr,lnk,img);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertUtente
-- -----------------------------------------------------

DELIMITER $$
USE `dblab`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUtente`(IN uname CHAR(45),IN pword CHAR(45), IN modalita INT)
BEGIN

INSERT INTO utente(username,password,modalitàRicezione) VALUES (uname,pword,modalita);

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
