/*
SET SQL_SAFE_UPDATES = 0;
SET AUTOCOMMIT = 1;
ALTER TABLE "NOMBRE DE LA TABLA" ENGINE = InnoDB;
begin;
COMMIT;
ROLLBACK;
*/

/*select * from usuario u inner join entidad e on u.idUsuario=e.idUsuario;
select * from tipoUsuario
*/
drop schema if exists `royalacademy`;

create schema `royalacademy`;

use `royalacademy`;

CREATE  TABLE `royalacademy`.`pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT ,
  `pais` VARCHAR(100) NULL ,
  PRIMARY KEY (`idPais`) );

CREATE  TABLE `royalacademy`.`provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT ,
  `provincia` VARCHAR(100) NULL ,
  PRIMARY KEY (`idProvincia`) );

CREATE  TABLE `royalacademy`.`localidad` (
  `idLocalidad` INT NOT NULL AUTO_INCREMENT ,
  `localidad` VARCHAR(100) NULL ,
  PRIMARY KEY (`idLocalidad`) );

CREATE  TABLE `royalacademy`.`tipoUsuario` (
  `idTipoUsuario` INT NOT NULL AUTO_INCREMENT ,
  `tipoUsuario` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTipoUsuario`) );

CREATE  TABLE `royalacademy`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `mail` VARCHAR(100) NULL ,
  `contrasenia` VARCHAR(17) NULL DEFAULT 'pass' ,
  `estado` VARCHAR(1) NULL DEFAULT 'N' ,
  `idTipoUsuario` INT NULL ,
  `fecRegistro` DATE NULL ,
  PRIMARY KEY (`idUsuario`) );

CREATE  TABLE `royalacademy`.`entidad` (
  `idUsuario` INT NOT NULL ,
  `apellido` VARCHAR(100) NULL ,
  `nombre` VARCHAR(100) NULL ,
  `documento` INT NULL ,
  `fecNacimiento` DATE NULL ,
  `codGenero` VARCHAR(15) NULL DEFAULT 'NA' ,
  `idPais` INT NULL DEFAULT 1 ,
  `idProvincia` INT NULL DEFAULT 1 ,
  `idLocalidad` INT NULL DEFAULT 1 ,
  `codigoPostal` VARCHAR(45) NULL ,
  `calle` VARCHAR(100) NULL ,
  `numero` INT NULL ,
  `departamento` VARCHAR(45) NULL ,
  PRIMARY KEY (`idUsuario`) );
  
CREATE  TABLE `royalacademy`.`TipoPregunta` (
  `idTipoPregunta` INT NOT NULL AUTO_INCREMENT ,
  `texto` VARCHAR(200) NULL ,
  PRIMARY KEY (`idTipoPregunta`) );
  
CREATE  TABLE `royalacademy`.`Pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT ,
  `texto` VARCHAR(200) NULL ,
  `valorAprobado` INT,
  `idTipoPregunta` INT,
  PRIMARY KEY (`idPregunta`) );
  
CREATE  TABLE `royalacademy`.`Opcion` (
  `idOpcion` INT NOT NULL AUTO_INCREMENT ,
  `idPregunta` INT,
  `texto` VARCHAR(100) NULL ,
  `valor` INT,
  PRIMARY KEY (`idOpcion`) );

CREATE  TABLE `royalacademy`.`Examen` (
  `idExamen` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  PRIMARY KEY (`idExamen`));

CREATE  TABLE `royalacademy`.`PreguntaXExamen` (
  `idPreguntaXExamen` INT NOT NULL AUTO_INCREMENT ,
  `idExamen` INT,
  `idPregunta` INT,
  PRIMARY KEY (`idPreguntaXExamen`) );
  
CREATE  TABLE `royalacademy`.`Respuesta` (
  `idRespuesta` INT NOT NULL AUTO_INCREMENT ,
  `idResolucion` INT,
  `idOpcion` INT,
  `idPregunta` INT,
  PRIMARY KEY (`idRespuesta`) );
  
CREATE  TABLE `royalacademy`.`Resolucion` (
  `idResolucion` INT NOT NULL AUTO_INCREMENT ,
  `dniAlumno` INT,
  `idExamen` INT,
  PRIMARY KEY (`idResolucion`) );
  
  CREATE  TABLE `royalacademy`.`Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT ,
  `idPais` INT NULL DEFAULT 1 ,
  `idProvincia` INT NULL DEFAULT 1 ,
  `idLocalidad` INT NULL DEFAULT 1 ,
  `codigoPostal` varchar(25),
  `calle` varchar(25),
  `numero` INT,
  PRIMARY KEY (`idSede`) );
  
    CREATE  TABLE `royalacademy`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` varchar(25),
  PRIMARY KEY (`idCurso`) );
  
insert into pais(pais) values ('No Asignado');
insert into pais(pais) values ('Argentina');
insert into provincia(provincia) values ('No Asignado');
insert into provincia(provincia) values ('Buenos Aires');
insert into localidad(localidad) values ('No Asignado');
insert into localidad(localidad) values ('Lomas de Zamora');

insert into tipoUsuario(tipoUsuario) values('estudiante');
insert into tipoUsuario(tipoUsuario) values('docente');

insert into usuario(mail,contrasenia,estado,fecRegistro) values('clowd1987@hmail.com','pass','S',convert(now(),DATE));
insert into entidad (idUsuario,apellido,nombre,documento,fecNacimiento,codGenero,idPais,idProvincia,idLocalidad,codigoPostal,calle,numero,departamento)
values ((select max(idUsuario) from usuario),'Di Stéfano','Agustín',33338406,'1892-08-28','NA',1,1,1,'1024','Mitre',2538,'');

select * from TipoPregunta;
select * from usuario;
select * from entidad;
select * from Pregunta where idpregunta = 1;
select * from Opcion;

select * from Resolucion;
select * from Respuesta;
select * from Sede;
select * from Curso;