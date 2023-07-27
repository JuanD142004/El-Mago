-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_Drogueria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_Drogueria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Drogueria` DEFAULT CHARACTER SET utf8 ;
USE `BD_Drogueria` ;

-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Personas` (
  `id_Personas` INT NOT NULL,
  `Identificacion` VARCHAR(45) NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Personas`),
  UNIQUE INDEX `Identificacion_UNIQUE` (`Identificacion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Compania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Compania` (
  `id_Compania` SMALLINT NOT NULL,
  `Nit` VARCHAR(45) NOT NULL,
  `Compania` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Compania`),
  UNIQUE INDEX `Nit_UNIQUE` (`Nit` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Termino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Termino` (
  `id_Termino` TINYINT NOT NULL,
  `Termino` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Termino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Factura` (
  `id_Factura` BIGINT NOT NULL,
  `Personas_id_Personas` INT NOT NULL,
  `Compania_id_Compania` SMALLINT NULL,
  `Termino_id_Termino` TINYINT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`id_Factura`),
  INDEX `fk_Factura_Personas_idx` (`Personas_id_Personas` ASC) VISIBLE,
  INDEX `fk_Factura_Compania1_idx` (`Compania_id_Compania` ASC) VISIBLE,
  INDEX `fk_Factura_Termino1_idx` (`Termino_id_Termino` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Personas`
    FOREIGN KEY (`Personas_id_Personas`)
    REFERENCES `BD_Drogueria`.`Personas` (`id_Personas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Compania1`
    FOREIGN KEY (`Compania_id_Compania`)
    REFERENCES `BD_Drogueria`.`Compania` (`id_Compania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Termino1`
    FOREIGN KEY (`Termino_id_Termino`)
    REFERENCES `BD_Drogueria`.`Termino` (`id_Termino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Categoria` (
  `id_Categoria` SMALLINT NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Producto` (
  `id_Producto` INT NOT NULL,
  `Producto` VARCHAR(45) NOT NULL,
  `Existencia` INT NOT NULL DEFAULT 0,
  `Valor_unitario_venta` FLOAT NOT NULL,
  `Valor_unitario_compra` FLOAT NOT NULL,
  `Categoria_id_Categoria` SMALLINT NOT NULL,
  PRIMARY KEY (`id_Producto`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_id_Categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_id_Categoria`)
    REFERENCES `BD_Drogueria`.`Categoria` (`id_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Drogueria`.`Factura_has_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Drogueria`.`Factura_has_Producto` (
  `Factura_id_Factura` BIGINT NOT NULL,
  `Producto_id_Producto` INT NOT NULL,
  `Valor_unitario` FLOAT NOT NULL,
  `Cantidad` SMALLINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`Factura_id_Factura`, `Producto_id_Producto`),
  INDEX `fk_Factura_has_Producto_Producto1_idx` (`Producto_id_Producto` ASC) VISIBLE,
  INDEX `fk_Factura_has_Producto_Factura1_idx` (`Factura_id_Factura` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_Producto_Factura1`
    FOREIGN KEY (`Factura_id_Factura`)
    REFERENCES `BD_Drogueria`.`Factura` (`id_Factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Producto_Producto1`
    FOREIGN KEY (`Producto_id_Producto`)
    REFERENCES `BD_Drogueria`.`Producto` (`id_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
