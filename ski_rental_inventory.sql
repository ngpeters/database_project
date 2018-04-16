-- MySQL Script generated by MySQL Workbench
-- Tue Nov 22 11:06:14 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ski_rental_inventory
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ski_rental_inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ski_rental_inventory` DEFAULT CHARACTER SET utf8 ;
USE `ski_rental_inventory` ;

-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Location` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Location` (
  `idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  PRIMARY KEY (`idLocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Vendor` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Vendor` (
  `idVendor` INT NOT NULL,
  `BrandName` VARCHAR(45) NOT NULL,
  `Buyer/Seller` ENUM('buyer', 'seller') NOT NULL,
  PRIMARY KEY (`idVendor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`SaleHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`SaleHistory` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`SaleHistory` (
  `idSaleHistory` INT NOT NULL,
  `EquipmentType` ENUM('Boots', 'Pools', 'Helmets', 'Bindings', 'Skis', 'Snowboards') NOT NULL,
  `Ski/SnowboardType` VARCHAR(45) NULL,
  `Amount` VARCHAR(45) NOT NULL,
  `Vendor_idVendor` INT NOT NULL,
  PRIMARY KEY (`idSaleHistory`),
  INDEX `fk_SaleHistory_Vendor1_idx` (`Vendor_idVendor` ASC),
  CONSTRAINT `fk_SaleHistory_Vendor1`
    FOREIGN KEY (`Vendor_idVendor`)
    REFERENCES `ski_rental_inventory`.`Vendor` (`idVendor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`PurchaseHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`PurchaseHistory` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`PurchaseHistory` (
  `idPurchaseHistory` INT NOT NULL,
  `EquipmentType` ENUM('Boots', 'Pools', 'Helmets', 'Bindings', 'Skis', 'Snowboards') NOT NULL,
  `Amount` VARCHAR(45) NOT NULL,
  `Ski/SnowboardType` VARCHAR(45) NULL,
  `Vendor_idVendor` INT NOT NULL,
  PRIMARY KEY (`idPurchaseHistory`),
  INDEX `fk_PurchaseHistory_Vendor1_idx` (`Vendor_idVendor` ASC),
  CONSTRAINT `fk_PurchaseHistory_Vendor1`
    FOREIGN KEY (`Vendor_idVendor`)
    REFERENCES `ski_rental_inventory`.`Vendor` (`idVendor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Bindings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Bindings` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Bindings` (
  `idBindings` INT NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Age` INT(4) NOT NULL,
  `Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  `PurchaseHistory_idPurchaseHistory` INT NOT NULL,
  PRIMARY KEY (`idBindings`, `Location_idLocation`),
  INDEX `fk_Bindings_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Bindings_PurchaseHistory1_idx` (`PurchaseHistory_idPurchaseHistory` ASC),
  CONSTRAINT `fk_Bindings_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bindings_PurchaseHistory1`
    FOREIGN KEY (`PurchaseHistory_idPurchaseHistory`)
    REFERENCES `ski_rental_inventory`.`PurchaseHistory` (`idPurchaseHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`SkisSnowboards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`SkisSnowboards` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`SkisSnowboards` (
  `idSkis/Snowboards` VARCHAR(10) NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Age` INT(4) NOT NULL,
  `Skis/Snowboards` ENUM('Ski', 'Snowboard') NOT NULL,
  `Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  `SaleHistory_idSaleHistory` INT NULL,
  `PurchaseHistory_idPurchaseHistory` INT NOT NULL,
  `Bindings_idBindings` INT NOT NULL,
  `Bindings_Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  PRIMARY KEY (`idSkis/Snowboards`, `Location_idLocation`),
  INDEX `fk_Skis/Snowboards_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Skis/Snowboards_SaleHistory1_idx` (`SaleHistory_idSaleHistory` ASC),
  INDEX `fk_Skis/Snowboards_PurchaseHistory1_idx` (`PurchaseHistory_idPurchaseHistory` ASC),
  INDEX `fk_Skis/Snowboards_Bindings1_idx` (`Bindings_idBindings` ASC, `Bindings_Location_idLocation` ASC),
  CONSTRAINT `fk_Skis/Snowboards_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Skis/Snowboards_Sale History1`
    FOREIGN KEY (`SaleHistory_idSaleHistory`)
    REFERENCES `ski_rental_inventory`.`SaleHistory` (`idSaleHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Skis/Snowboards_Purchase History1`
    FOREIGN KEY (`PurchaseHistory_idPurchaseHistory`)
    REFERENCES `ski_rental_inventory`.`PurchaseHistory` (`idPurchaseHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Skis/Snowboards_Bindings1`
    FOREIGN KEY (`Bindings_idBindings` , `Bindings_Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Bindings` (`idBindings` , `Location_idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Boots`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Boots` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Boots` (
  `idBoots` VARCHAR(8) NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Age` INT(4) NOT NULL,
  `Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  `SaleHistory_idSaleHistory` INT NULL,
  `PurchaseHistory_idPurchaseHistory` INT NOT NULL,
  PRIMARY KEY (`idBoots`, `Location_idLocation`),
  INDEX `fk_Boots_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Boots_SaleHistory1_idx` (`SaleHistory_idSaleHistory` ASC),
  INDEX `fk_Boots_PurchaseHistory1_idx` (`PurchaseHistory_idPurchaseHistory` ASC),
  CONSTRAINT `fk_Boots_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boots_SaleHistory1`
    FOREIGN KEY (`SaleHistory_idSaleHistory`)
    REFERENCES `ski_rental_inventory`.`SaleHistory` (`idSaleHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Boots_PurchaseHistory1`
    FOREIGN KEY (`PurchaseHistory_idPurchaseHistory`)
    REFERENCES `ski_rental_inventory`.`PurchaseHistory` (`idPurchaseHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Pools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Pools` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Pools` (
  `idPools` INT NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  `PurchaseHistory_idPurchaseHistory` INT NOT NULL,
  PRIMARY KEY (`idPools`, `Location_idLocation`),
  INDEX `fk_Pools_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Pools_PurchaseHistory1_idx` (`PurchaseHistory_idPurchaseHistory` ASC),
  CONSTRAINT `fk_Pools_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pools_PurchaseHistory1`
    FOREIGN KEY (`PurchaseHistory_idPurchaseHistory`)
    REFERENCES `ski_rental_inventory`.`PurchaseHistory` (`idPurchaseHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ski_rental_inventory`.`Helmets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ski_rental_inventory`.`Helmets` ;

CREATE TABLE IF NOT EXISTS `ski_rental_inventory`.`Helmets` (
  `idHelmets` INT NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Location_idLocation` ENUM('ParkCitySport', 'SlopesideSports', 'JakesSkiRentals') NOT NULL,
  `PurchaseHistory_idPurchaseHistory` INT NOT NULL,
  PRIMARY KEY (`idHelmets`, `Location_idLocation`),
  INDEX `fk_Helmets_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Helmets_Purchase History1_idx` (`PurchaseHistory_idPurchaseHistory` ASC),
  CONSTRAINT `fk_Helmets_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `ski_rental_inventory`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Helmets_PurchaseHistory1`
    FOREIGN KEY (`PurchaseHistory_idPurchaseHistory`)
    REFERENCES `ski_rental_inventory`.`PurchaseHistory` (`idPurchaseHistory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
