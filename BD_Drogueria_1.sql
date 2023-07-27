-- MySQL Workbench Synchronization
-- Generated: 2023-07-17 16:48
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `bd_drogueria`.`Factura` 
DROP FOREIGN KEY `fk_Factura_Compania1`,
DROP FOREIGN KEY `fk_Factura_Termino1`;

ALTER TABLE `bd_drogueria`.`Producto` 
DROP FOREIGN KEY `fk_Producto_Categoria1`;

ALTER TABLE `bd_drogueria`.`Factura_has_Producto` 
DROP FOREIGN KEY `fk_Factura_has_Producto_Factura1`,
DROP FOREIGN KEY `fk_Factura_has_Producto_Producto1`;

ALTER TABLE `bd_drogueria`.`Personas` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Compania` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Factura` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `Sub_Total` VARCHAR(45) NOT NULL AFTER `Hora`,
ADD COLUMN `Tasa_Impuesto` VARCHAR(45) NOT NULL AFTER `Sub_Total`;

ALTER TABLE `bd_drogueria`.`Termino` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Producto` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Categoria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Factura_has_Producto` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bd_drogueria`.`Factura` 
DROP FOREIGN KEY `fk_Factura_Personas`;

ALTER TABLE `bd_drogueria`.`Factura` ADD CONSTRAINT `fk_Factura_Personas`
  FOREIGN KEY (`Personas_id_Personas`)
  REFERENCES `bd_drogueria`.`Personas` (`id_Personas`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Factura_Compania1`
  FOREIGN KEY (`Compania_id_Compania`)
  REFERENCES `bd_drogueria`.`Compania` (`id_Compania`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Factura_Termino1`
  FOREIGN KEY (`Termino_id_Termino`)
  REFERENCES `bd_drogueria`.`Termino` (`id_Termino`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bd_drogueria`.`Producto` 
ADD CONSTRAINT `fk_Producto_Categoria1`
  FOREIGN KEY (`Categoria_id_Categoria`)
  REFERENCES `bd_drogueria`.`Categoria` (`id_Categoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bd_drogueria`.`Factura_has_Producto` 
ADD CONSTRAINT `fk_Factura_has_Producto_Factura1`
  FOREIGN KEY (`Factura_id_Factura`)
  REFERENCES `bd_drogueria`.`Factura` (`id_Factura`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Factura_has_Producto_Producto1`
  FOREIGN KEY (`Producto_id_Producto`)
  REFERENCES `bd_drogueria`.`Producto` (`id_Producto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
