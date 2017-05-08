-- MySQL Script generated by MySQL Workbench
-- Wed May  3 09:34:45 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Offre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`offre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `detail` VARCHAR(45) NULL,
  `prix` INT NULL,
  `titre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`utilisateur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `nom d'utilisateur` VARCHAR(45) NULL,
  `mdp` VARCHAR(45) NULL,
  `photo` VARCHAR(45) NULL,
  `ville` VARCHAR(45) NULL,
  `pays` VARCHAR(45) NULL,
  `id_offre` INT NOT NULL,
  `id_role` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Client_Offre1_idx` (`id_offre` ASC),
  INDEX `fk_Utilisateur_role1_idx` (`id_role` ASC),
  CONSTRAINT `fk_Client_Offre1`
    FOREIGN KEY (`id_offre`)
    REFERENCES `mydb`.`Offre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_role1`
    FOREIGN KEY (`id_role`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Piece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`piece` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Piece_Client1_idx` (`id_client` ASC),
  CONSTRAINT `fk_Piece_Client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Type_capteurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type_capteurs` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Capteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`capteur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `etat` TINYINT NULL,
  `id_piece` INT NOT NULL,
  `id_type` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Capteur_Piece1_idx` (`id_piece` ASC),
  INDEX `fk_Capteur_Type_capteurs1_idx` (`id_type` ASC),
  CONSTRAINT `fk_Capteur_Piece1`
    FOREIGN KEY (`id_piece`)
    REFERENCES `mydb`.`Piece` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capteur_Type_capteurs1`
    FOREIGN KEY (`id_type`)
    REFERENCES `mydb`.`Type_capteurs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Technicien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`technicien` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `localisation` VARCHAR(45) NULL,
  `tel` INT NULL,
  `id_utilisateur` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Technicien_Utilisateur1_idx` (`id_utilisateur` ASC),
  CONSTRAINT `fk_Technicien_Utilisateur1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date debut` DATETIME NULL,
  `date fin` DATETIME NULL,
  `etat` TINYINT NULL,
  `Motif` VARCHAR(45) NULL,
  `id_technicien` INT NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mission_Technicien1_idx` (`id_technicien` ASC),
  INDEX `fk_Mission_Client1_idx` (`id_client` ASC),
  CONSTRAINT `fk_Mission_Technicien1`
    FOREIGN KEY (`id_technicien`)
    REFERENCES `mydb`.`Technicien` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mission_Client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Donnees energetiques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`donnee_energetique` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valeur` FLOAT NULL,
  `date` DATETIME NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Donnees energetiques_Client1_idx` (`id_client` ASC),
  CONSTRAINT `fk_Donnees energetiques_Client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`facture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `pdf` VARCHAR(45) NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Facture_Client1_idx` (`id_client` ASC),
  CONSTRAINT `fk_Facture_Client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Donnee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`donnee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `valeur` FLOAT NULL,
  `id_capteur` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Donnee_Capteur1_idx` (`id_capteur` ASC),
  CONSTRAINT `fk_Donnee_Capteur1`
    FOREIGN KEY (`id_capteur`)
    REFERENCES `mydb`.`Capteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nouveaute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nouveaute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(45) NULL,
  `titre` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EggHome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`eggHome` (
  `id` INT NOT NULL,
  `presentation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tel` INT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Noctification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`noctification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_dashboard` INT NOT NULL,
  `id_client` INT NOT NULL,
  `contenu` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Noctification_Utilisateur1_idx` (`id_client` ASC),
  CONSTRAINT `fk_Noctification_Utilisateur1`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
