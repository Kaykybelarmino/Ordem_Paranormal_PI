-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ordem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ordem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ordem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ordem` ;

-- -----------------------------------------------------
-- Table `ordem`.`mestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`mestre` (
  `idMestre` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMestre`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ordem`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`turno` (
  `idTurno` INT NOT NULL,
  `descAcao` VARCHAR(100) NULL DEFAULT NULL,
  `dtHora` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idTurno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ordem`.`sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`sessao` (
  `idSessao` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `historia` VARCHAR(100) NULL DEFAULT NULL,
  `dtSessao` DATE NULL DEFAULT NULL,
  `sinopse` VARCHAR(100) NULL DEFAULT NULL,
  `fkMestre` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idSessao`),
  INDEX `frkMestre` (`fkMestre` ASC) VISIBLE,
  CONSTRAINT `frkMestre`
    FOREIGN KEY (`fkMestre`)
    REFERENCES `ordem`.`mestre` (`idMestre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ordem`.`numero_turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`numero_turno` (
  `idNumero_turno` INT NOT NULL,
  `fkTurno` INT NOT NULL,
  `fkSessao` INT NOT NULL,
  `numTurno` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idNumero_turno`, `fkTurno`, `fkSessao`),
  INDEX `frkTurno` (`fkTurno` ASC) VISIBLE,
  INDEX `frkTurnoSessao` (`fkSessao` ASC) VISIBLE,
  CONSTRAINT `frkTurno`
    FOREIGN KEY (`fkTurno`)
    REFERENCES `ordem`.`turno` (`idTurno`),
  CONSTRAINT `frkTurnoSessao`
    FOREIGN KEY (`fkSessao`)
    REFERENCES `ordem`.`sessao` (`idSessao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ordem`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`player` (
  `idPlayer` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `urlImagem` VARCHAR(150) NULL DEFAULT NULL,
  `fkSessao` INT NOT NULL,
  PRIMARY KEY (`idPlayer`, `fkSessao`),
  INDEX `frkSessao` (`fkSessao` ASC) VISIBLE,
  CONSTRAINT `frkSessao`
    FOREIGN KEY (`fkSessao`)
    REFERENCES `ordem`.`sessao` (`idSessao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ordem`.`personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ordem`.`personagem` (
  `idPersonagem` INT NOT NULL,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `classe` VARCHAR(12) NULL DEFAULT NULL,
  `elemento` VARCHAR(12) NULL DEFAULT NULL,
  `NEX` TINYINT NULL DEFAULT NULL,
  `vida` TINYINT NULL DEFAULT NULL,
  `sanidade` TINYINT NULL DEFAULT NULL,
  `PE` TINYINT NULL DEFAULT NULL,
  `forca` TINYINT NULL DEFAULT NULL,
  `destreza` TINYINT NULL DEFAULT NULL,
  `presenca` TINYINT NULL DEFAULT NULL,
  `vigor` TINYINT NULL DEFAULT NULL,
  `inteligencia` TINYINT NULL DEFAULT NULL,
  `fkPlayer` INT NOT NULL,
  `fkSessao` INT NOT NULL,
  PRIMARY KEY (`idPersonagem`, `fkPlayer`, `fkSessao`),
  INDEX `frkPersonagemPlayer` (`fkPlayer` ASC) VISIBLE,
  INDEX `frkPersonagemSessao` (`fkSessao` ASC) VISIBLE,
  CONSTRAINT `frkPersonagemPlayer`
    FOREIGN KEY (`fkPlayer`)
    REFERENCES `ordem`.`player` (`idPlayer`),
  CONSTRAINT `frkPersonagemSessao`
    FOREIGN KEY (`fkSessao`)
    REFERENCES `ordem`.`sessao` (`idSessao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
