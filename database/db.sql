-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema py_apsoftware
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema py_apsoftware
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `py_apsoftware` DEFAULT CHARACTER SET utf8 ;
USE `py_apsoftware` ;

-- -----------------------------------------------------
-- Table `py_apsoftware`.`Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Servicios` (
  `idServicio` INT NOT NULL COMMENT 'Id unico del servicio que se ofrece',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre uinco del servicio de la empresa',
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Departamento` (
  `idDepartamento` INT NOT NULL COMMENT 'Id unico del departamento de donde trabaja',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombrre del departamento de la empresa',
  `cargo` VARCHAR(45) NOT NULL COMMENT 'Cargo que tiene dentro del departamento',
  `servicios_idServicio` INT NOT NULL COMMENT 'Hacemos referencia al servicio por cada departamento para asignarle segun el servicio que ofrece',
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Servicios1_idx` (`servicios_idServicio` ASC),
  CONSTRAINT `fk_Departamento_Servicios1`
    FOREIGN KEY (`servicios_idServicio`)
    REFERENCES `py_apsoftware`.`Servicios` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`GrupoTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`GrupoTrabajo` (
  `docIdentidad` INT NOT NULL COMMENT 'ID unico de cada trabajador de la empresa',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del trabajador de AP Software',
  `apellido` VARCHAR(45) NOT NULL COMMENT 'Apellido del trabajador de AP Software',
  `Departamento_idDepartamento` INT NOT NULL COMMENT 'Hacemos referencia al  departamenbto  para asignarle segun el tipo de trabajador',
  PRIMARY KEY (`docIdentidad`),
  INDEX `fk_GrupoTrabajo_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_GrupoTrabajo_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `py_apsoftware`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Clientes` (
  `docIdentidad` INT NOT NULL COMMENT 'Documento unico de identidad del cliente',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de la empresa o personas que contrata',
  `telefono` INT NOT NULL COMMENT 'Telefono de contacto principal del cliente',
  `datos` VARCHAR(100) NULL COMMENT 'Datos extra de la empresa',
  `departamento_idDepartamento` INT NOT NULL COMMENT 'Hacemos referencia al numero de documento del departamenbto  para asignarle segun el servicio escogido',
  PRIMARY KEY (`docIdentidad`),
  INDEX `fk_Clientes_departamento1_idx` (`departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Clientes_departamento1`
    FOREIGN KEY (`departamento_idDepartamento`)
    REFERENCES `py_apsoftware`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`Clientes_Correos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Clientes_Correos` (
  `idCorreo` INT NOT NULL COMMENT 'id unico del correo',
  `correo` VARCHAR(100) NOT NULL COMMENT 'correo el cual ingresa el cliente',
  `docIdentidad` INT NOT NULL COMMENT 'Hacemos referencia al numero de documento del cliente para asociarel correo a su lista de correos como cliente',
  PRIMARY KEY (`idCorreo`),
  INDEX `fk_Clientes_Correos_Clientes_idx` (`docIdentidad` ASC),
  CONSTRAINT `fk_Clientes_Correos_Clientes`
    FOREIGN KEY (`docIdentidad`)
    REFERENCES `py_apsoftware`.`Clientes` (`docIdentidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`Actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Actividades` (
  `idActividades` INT NOT NULL COMMENT 'Id unico de la actividad que se esta llevando acabo por una persona y departamento',
  `nombreActividad` VARCHAR(100) NOT NULL COMMENT 'Asignacion del nombre de la actividad que se va a estar realizando ',
  `fecha` DATE NOT NULL COMMENT 'asignacion de fecha el cual fue creada la actividad',
  `tipoActividad` VARCHAR(100) NOT NULL COMMENT 'Seleccion del tipo de actividad a realizar segun la operación del departamento',
  `idDepartamento` INT NOT NULL COMMENT 'id del departamento para hacer referencia al departamento que realiza la actividad y asociar la persona el cual lo creo',
  PRIMARY KEY (`idActividades`),
  INDEX `fk_Actividades_departamento1_idx` (`idDepartamento` ASC),
  CONSTRAINT `fk_Actividades_departamento1`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `py_apsoftware`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `py_apsoftware`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `py_apsoftware`.`Pagos` (
  `idPagos` INT NOT NULL COMMENT 'Id unico del los pagos',
  `concepto` VARCHAR(45) NOT NULL COMMENT 'Referencia de pago realizado por un cliente',
  `monto` INT NOT NULL COMMENT 'Valor del pago realizado',
  `servicios_idServicio` INT NOT NULL,
  `Clientes_docIdentidad` INT NOT NULL,
  PRIMARY KEY (`idPagos`),
  INDEX `fk_Pagos_Servicios1_idx` (`servicios_idServicio` ASC),
  INDEX `fk_Pagos_Clientes1_idx` (`Clientes_docIdentidad` ASC),
  CONSTRAINT `fk_Pagos_Servicios1`
    FOREIGN KEY (`servicios_idServicio`)
    REFERENCES `py_apsoftware`.`Servicios` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_Clientes1`
    FOREIGN KEY (`Clientes_docIdentidad`)
    REFERENCES `py_apsoftware`.`Clientes` (`docIdentidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
