-- Año: 2021
-- Grupo: 05
-- Integranes: Pastrana Gonzalo, Pérez Lucas
-- Tema: Instituto Privado de Enseñanza Dr. Carrillo
-- Nombre del esquema: LBD202105INDRC
-- Plataforma: Windows 10
-- Motor y Versión: MySQL Server 5
-- GitHub Repositorio: LBD2021G05
-- GitHub Usuario: GonzaloPastrana , Jl-power

CREATE DATABASE IF NOT EXISTS LBD202105INDRC;
USE LBD202105INDRC;

--  
-- TABLE: Personas 
--
CREATE TABLE Personas(
    idPersona    INT            NOT NULL,
    apellido     VARCHAR(40)    NOT NULL,
    nombres      VARCHAR(40)    NOT NULL,
    domicilio    VARCHAR(60)    NOT NULL,
    telefono     VARCHAR(10),
    tipoDNI      VARCHAR(5)     NOT NULL,
    numeroDNI    CHAR(8)        NOT NULL,
    PRIMARY KEY (idPersona)
)ENGINE=INNODB
;
CREATE UNIQUE INDEX UI_numeroDNI ON Personas(numeroDNI);

INSERT INTO `Personas` VALUES(01, 'Perez', 'Luis', 'San Juan 700','4365784','DU','34133144');
INSERT INTO `Personas` VALUES(02, 'Castro', 'Jose', 'Av A Palacios 1545','4654784','DU','34133145');
INSERT INTO `Personas` VALUES(03, 'Gomez', 'Marcos', 'El Salvador 565','4215254','DU','35778410');
INSERT INTO `Personas` VALUES(04, 'Bonilla', 'Luis', 'Bme Mitre 150','4255784','DU','33789135');
INSERT INTO `Personas` VALUES(05, 'Camino', 'Alonso', 'Av De Mayo 722','4695784','DU','32791246');
INSERT INTO `Personas` VALUES(06, 'Marquez', 'Luis', 'F Ameghino 1225','4225784','DU','31843120');
INSERT INTO `Personas` VALUES(07, 'Juarez', 'Mohammed', 'San Luis 2745','4223784','DU','25852025');
INSERT INTO `Personas` VALUES(08, 'Martinez', 'Claudio', 'Av Montevideo 1002','4245784','DU','33119863');
INSERT INTO `Personas` VALUES(09, 'Bueno', 'Jorge', 'Maipú 2150','4255784','DU','33261270');
INSERT INTO `Personas` VALUES(10, 'Codina', 'Marcos', 'Armenia 1847','4265784','DU','33378444');
INSERT INTO `Personas` VALUES(11, 'Yanez', 'Gustavo', '10 De Octubre 543','4275784','DU','33441415');
INSERT INTO `Personas` VALUES(12, 'Pedro', 'Barrera', 'Avenida 7 520','4285784','DU','33598784');
INSERT INTO `Personas` VALUES(13, 'Contreras', 'Gerardo', '9 De Julio 866','4905784','DU','33613013');
INSERT INTO `Personas` VALUES(14, 'Alba', 'Joaquin', 'San Martín 2658','4325784','DU','33720103');
INSERT INTO `Personas` VALUES(15, 'Acuña', 'Lucas', 'Av Cabildo Gal Río de Janeiro 2370','4365334','DU','33864756');
INSERT INTO `Personas` VALUES(16, 'Puertas', 'Enrique', 'Av Callao 892','4335784','DU','33939396');
INSERT INTO `Personas` VALUES(17, 'Canilla', 'Ivan', 'Fotheringham 282','4345784','DU','33057810');
INSERT INTO `Personas` VALUES(18, 'Mañas', 'Luis', 'Thompson 309','4355784','DU','34178164');
INSERT INTO `Personas` VALUES(19, 'Cardona', 'Miguel', 'Av Reg Patricios 722','4365784','DU','34225689');
INSERT INTO `Personas` VALUES(20, 'Granado', 'Amado', 'Rioja 82','4375784','DU','34305867');
INSERT INTO `Personas` VALUES(21, 'Peralta', 'Juan', 'Rioja 182','4365784','DU','34405867');
INSERT INTO `Personas` VALUES(22, 'Granado', 'Amado', 'Rioja 82','4365784','DU','34505867');
INSERT INTO `Personas` VALUES(23, 'Granado', 'Amado', 'Rioja 82','4365784','DU','34605867');


--  
-- TABLE: Usuarios 
--
CREATE TABLE Usuarios(
    idPersona        INT            NOT NULL,
    nombreUsuario    VARCHAR(40)    NOT NULL,
    contraseña       VARCHAR(30)    NOT NULL,
    cargo            VARCHAR(15)    NOT NULL
                     CHECK (cargo IN ('Director','Secretario')),
    PRIMARY KEY (idPersona)
)ENGINE=INNODB
;
CREATE INDEX Ref324 ON Usuarios(idPersona);
CREATE UNIQUE INDEX UI_nombreUsuario ON Usuarios(nombreUsuario);
ALTER TABLE Usuarios ADD CONSTRAINT RefPersonas24 
    FOREIGN KEY (idPersona)
    REFERENCES Personas(idPersona)
;

INSERT INTO `Usuarios` VALUES(21, 'indrc_t1', 'dfhrty','Director');
INSERT INTO `Usuarios` VALUES(22, 'indrc_t2', 'tryjsa','Secretario');
INSERT INTO `Usuarios` VALUES(23, 'indrc_t3', 'mbscbn','Secretario');


-- 
-- TABLE: Alumnos 
--

CREATE TABLE Alumnos(
    idPersona       INT            NOT NULL,
    numeroLegajo    INT            NOT NULL,
    estadoAlumno    ENUM ('Activo','Inactivo')
					DEFAULT ('Activo'),
    PRIMARY KEY (idPersona)
)ENGINE=INNODB
;
CREATE UNIQUE INDEX UI_numeroLegajo ON Alumnos(numeroLegajo);
CREATE INDEX Ref325 ON Alumnos(idPersona);
ALTER TABLE Alumnos ADD CONSTRAINT RefPersonas25 
    FOREIGN KEY (idPersona)
    REFERENCES Personas(idPersona)
;

-- INSERT INTO Alumnos (idPersona, numeroLegajo) VALUES(01, 1000007);
INSERT INTO `Alumnos` VALUES(01, '1000007', 'Activo');
INSERT INTO `Alumnos` VALUES(02, '1007849', 'Activo');
INSERT INTO `Alumnos` VALUES(03, '1520007', 'Activo');
INSERT INTO `Alumnos` VALUES(04, '1005406', 'Activo');
INSERT INTO `Alumnos` VALUES(05, '1870004', 'Activo');
INSERT INTO `Alumnos` VALUES(06, '1021003', 'Activo');
INSERT INTO `Alumnos` VALUES(07, '1087001', 'Inactivo');
INSERT INTO `Alumnos` VALUES(08, '1048004', 'Activo');
INSERT INTO `Alumnos` VALUES(09, '1000005', 'Activo');
INSERT INTO `Alumnos` VALUES(10, '1899008', 'Activo');
INSERT INTO `Alumnos` VALUES(11, '1841009', 'Activo');
INSERT INTO `Alumnos` VALUES(12, '1784001', 'Inactivo');
INSERT INTO `Alumnos` VALUES(13, '1842007', 'Activo');
INSERT INTO `Alumnos` VALUES(14, '1833004', 'Activo');
INSERT INTO `Alumnos` VALUES(15, '1963004', 'Activo');
INSERT INTO `Alumnos` VALUES(16, '1024001', 'Inactivo');
INSERT INTO `Alumnos` VALUES(17, '1741000', 'Activo');
INSERT INTO `Alumnos` VALUES(18, '1963006', 'Activo');
INSERT INTO `Alumnos` VALUES(19, '1004409', 'Inactivo');
INSERT INTO `Alumnos` VALUES(20, '1054008', 'Activo');


-- 
-- TABLE: Carreras 
--
CREATE TABLE Carreras(
    idCarrera          INT            NOT NULL,
    nombreCarrera      VARCHAR(40)    NOT NULL,
    duracionCarrera    INT            NOT NULL,
    PRIMARY KEY (idCarrera)
)ENGINE=INNODB
;
CREATE UNIQUE INDEX UI_nombreCarrera ON Carreras(nombreCarrera);

INSERT INTO `Carreras` VALUES('1', 'Ingenieria en Computacion', '5');
INSERT INTO `Carreras` VALUES('2', 'Ingenieria Electrica', '5');
INSERT INTO `Carreras` VALUES('3', 'Ingenieria Electronica', '5');
INSERT INTO `Carreras` VALUES('4', 'Ingenieria Geodesia', '5');
INSERT INTO `Carreras` VALUES('5', 'Ingenieria Mecanica', '5');
INSERT INTO `Carreras` VALUES('6', 'Ingenieria Industrial', '5');
INSERT INTO `Carreras` VALUES('7', 'Ingenieria Azucarera', '5');
INSERT INTO `Carreras` VALUES('8', 'Ingenieria en Informatica', '5');
INSERT INTO `Carreras` VALUES('9', 'Licenciatura en Matematicas', '4');
INSERT INTO `Carreras` VALUES('10', 'Licenciatura en Fisica', '4');
INSERT INTO `Carreras` VALUES('11', 'Ingenieria en Alimentos', '5');
INSERT INTO `Carreras` VALUES('12', 'Ingenieria Bioquimica', '5');
INSERT INTO `Carreras` VALUES('13', 'Ingenieria en Materiales', '5');
INSERT INTO `Carreras` VALUES('14', 'Ingenieria en Ecologia', '5');
INSERT INTO `Carreras` VALUES('15', 'Ingenieria en Zootecnista', '5');
INSERT INTO `Carreras` VALUES('16', 'Ingenieria en Quimica', '5');
INSERT INTO `Carreras` VALUES('17', 'Ingenieria en Seguridad', '5');
INSERT INTO `Carreras` VALUES('18', 'Ingenieria en Higiene', '5');
INSERT INTO `Carreras` VALUES('19', 'Ingenieria en Civil', '5');
INSERT INTO `Carreras` VALUES('20', 'Tecnico en Iluminacion', '3');


-- 
-- TABLE: Materias 
--
CREATE TABLE Materias(
    idMateria        INT            NOT NULL,
    codigoMateria    VARCHAR(5)     NOT NULL,
    nombreMateria    VARCHAR(40)    NOT NULL,
    horasMateria     INT            NOT NULL,
    PRIMARY KEY (idMateria)
)ENGINE=INNODB
;
CREATE UNIQUE INDEX UI_nombreMateria ON Materias(nombreMateria);
CREATE UNIQUE INDEX UI_codigoMateria ON Materias(codigoMateria);

INSERT INTO `Materias` VALUES('1', 'AI', 'Algebra I', '100');
INSERT INTO `Materias` VALUES('2', 'AII', 'Algebra II', '95');
INSERT INTO `Materias` VALUES('3', 'CI', 'Calculo I', '110');
INSERT INTO `Materias` VALUES('4', 'CII', 'Calculo II', '120');
INSERT INTO `Materias` VALUES('5', 'FI', 'Fisica I', '105');
INSERT INTO `Materias` VALUES('6', 'II', 'Fisica II', '110');
INSERT INTO `Materias` VALUES('7', 'FIII', 'Fisica III', '130');
INSERT INTO `Materias` VALUES('8', 'PI', 'Probabilidades I', '125');
INSERT INTO `Materias` VALUES('9', 'P', 'Programacion', '135');
INSERT INTO `Materias` VALUES('10', 'ER', 'Economia Rural', '90');
INSERT INTO `Materias` VALUES('11', 'F', 'Fotogrametria', '95');
INSERT INTO `Materias` VALUES('12', 'TI', 'Topografia I', '85');
INSERT INTO `Materias` VALUES('13', 'QO', 'Quimica Organica', '120');
INSERT INTO `Materias` VALUES('14', 'PP', 'Procesos Productivos', '130');
INSERT INTO `Materias` VALUES('15', 'IFI', 'Informatica I', '150');
INSERT INTO `Materias` VALUES('16', 'MT', 'Mediciones Termicas', '140');
INSERT INTO `Materias` VALUES('17', 'EI', 'Estabilidad I', '135');
INSERT INTO `Materias` VALUES('18', 'FR', 'Fundamentos de Redes', '115');
INSERT INTO `Materias` VALUES('19', 'SC', 'Sistemas de Control', '105');
INSERT INTO `Materias` VALUES('20', 'ME', 'Materiales Electricos', '100');


-- 
-- TABLE: InscripcionesCarreras 
--
DROP TABLE InscripcionesCarreras;

CREATE TABLE InscripcionesCarreras(
    idInscripcionCarrera       INT           NOT NULL,
    idCarrera                  INT           NOT NULL,
    idPersona                  INT           NOT NULL,
    numeroLibreta              VARCHAR(7)    NOT NULL,
    fechaInscripcionCarrera    DATE          NOT NULL,
    PRIMARY KEY (idInscripcionCarrera, idCarrera, idPersona)
)ENGINE=INNODB
;
CREATE UNIQUE INDEX UI_numeroLibreta ON InscripcionesCarreras(numeroLibreta);
CREATE INDEX Ref11 ON InscripcionesCarreras(idCarrera);
CREATE INDEX Ref1426 ON InscripcionesCarreras(idPersona);

ALTER TABLE InscripcionesCarreras ADD CONSTRAINT RefCarreras1 
    FOREIGN KEY (idCarrera)
    REFERENCES Carreras(idCarrera)
;
ALTER TABLE InscripcionesCarreras ADD CONSTRAINT RefAlumnos26 
    FOREIGN KEY (idPersona)
    REFERENCES Alumnos(idPersona)
;

INSERT INTO `InscripcionesCarreras` VALUES('01', '01', '01', '2021001', '2021-03-01');
INSERT INTO `InscripcionesCarreras` VALUES('02', '01', '02', '2021002', '2021-03-02');
INSERT INTO `InscripcionesCarreras` VALUES('03', '01', '03', '2021003', '2021-03-03');
INSERT INTO `InscripcionesCarreras` VALUES('04', '01', '04', '2021004', '2021-03-04');
INSERT INTO `InscripcionesCarreras` VALUES('05', '01', '05', '2021005', '2021-03-05');
INSERT INTO `InscripcionesCarreras` VALUES('06', '02', '06', '2021006', '2021-03-08');
INSERT INTO `InscripcionesCarreras` VALUES('07', '02', '07', '2021007', '2021-03-09');
INSERT INTO `InscripcionesCarreras` VALUES('08', '02', '08', '2021008', '2021-03-10');
INSERT INTO `InscripcionesCarreras` VALUES('09', '02', '09', '2021009', '2021-03-11');
INSERT INTO `InscripcionesCarreras` VALUES('10', '02', '10', '2021010', '2021-03-12');
INSERT INTO `InscripcionesCarreras` VALUES('11', '03', '11', '2021011', '2021-03-15');
INSERT INTO `InscripcionesCarreras` VALUES('12', '03', '12', '2021012', '2021-03-16');
INSERT INTO `InscripcionesCarreras` VALUES('13', '03', '13', '2021013', '2021-03-17');
INSERT INTO `InscripcionesCarreras` VALUES('14', '04', '14', '2021014', '2021-03-18');
INSERT INTO `InscripcionesCarreras` VALUES('15', '05', '15', '2021015', '2021-03-19');
INSERT INTO `InscripcionesCarreras` VALUES('16', '06', '16', '2021016', '2021-03-22');
INSERT INTO `InscripcionesCarreras` VALUES('17', '06', '17', '2021017', '2021-03-23');
INSERT INTO `InscripcionesCarreras` VALUES('18', '06', '18', '2021018', '2021-03-24');
INSERT INTO `InscripcionesCarreras` VALUES('19', '06', '19', '2021019', '2021-03-25');
INSERT INTO `InscripcionesCarreras` VALUES('20', '06', '20', '2021020', '2021-03-26');


-- 
-- TABLE: Curriculas 
--
CREATE TABLE Curriculas(
    idMateria    INT    NOT NULL,
    idCarrera    INT    NOT NULL,
    PRIMARY KEY (idMateria, idCarrera)
)ENGINE=INNODB
;
CREATE INDEX Ref15 ON Curriculas(idCarrera);
CREATE INDEX Ref26 ON Curriculas(idMateria);
ALTER TABLE Curriculas ADD CONSTRAINT RefCarreras5 
    FOREIGN KEY (idCarrera)
    REFERENCES Carreras(idCarrera)
;

ALTER TABLE Curriculas ADD CONSTRAINT RefMaterias6 
    FOREIGN KEY (idMateria)
    REFERENCES Materias(idMateria)
;

INSERT INTO `Curriculas` VALUES('01', '01');
INSERT INTO `Curriculas` VALUES('02', '01');
INSERT INTO `Curriculas` VALUES('03', '01');
INSERT INTO `Curriculas` VALUES('04', '01');
INSERT INTO `Curriculas` VALUES('05', '01');
INSERT INTO `Curriculas` VALUES('06', '01');
INSERT INTO `Curriculas` VALUES('07', '01');
INSERT INTO `Curriculas` VALUES('01', '02');
INSERT INTO `Curriculas` VALUES('02', '02');
INSERT INTO `Curriculas` VALUES('03', '02');
INSERT INTO `Curriculas` VALUES('04', '02');
INSERT INTO `Curriculas` VALUES('05', '02');
INSERT INTO `Curriculas` VALUES('10', '07');
INSERT INTO `Curriculas` VALUES('11', '07');
INSERT INTO `Curriculas` VALUES('13', '07');
INSERT INTO `Curriculas` VALUES('01', '03');
INSERT INTO `Curriculas` VALUES('02', '03');
INSERT INTO `Curriculas` VALUES('01', '04');
INSERT INTO `Curriculas` VALUES('02', '04');
INSERT INTO `Curriculas` VALUES('03', '04');


-- 
-- TABLE: Correlativas 
--
CREATE TABLE Correlativas(
    idMateriaCorrelativa    INT    NOT NULL,
    idCarreraCorrelativa    INT    NOT NULL,
    idMateria               INT    NOT NULL,
    idCarrera               INT    NOT NULL,
    PRIMARY KEY (idMateriaCorrelativa, idCarreraCorrelativa, idMateria, idCarrera)
)ENGINE=INNODB
;
CREATE INDEX Ref727 ON Correlativas(idCarrera, idMateria);
CREATE INDEX Ref728 ON Correlativas(idCarreraCorrelativa, idMateriaCorrelativa);
ALTER TABLE Correlativas ADD CONSTRAINT RefCurriculas27 
    FOREIGN KEY (idMateria, idCarrera)
    REFERENCES Curriculas(idMateria, idCarrera)
;

ALTER TABLE Correlativas ADD CONSTRAINT RefCurriculas28 
    FOREIGN KEY (idMateriaCorrelativa, idCarreraCorrelativa)
    REFERENCES Curriculas(idMateria, idCarrera)
;

INSERT INTO `Correlativas` VALUES('01', '01', '02', '01');
INSERT INTO `Correlativas` VALUES('01', '01', '03', '01');
INSERT INTO `Correlativas` VALUES('01', '01', '04', '01');
INSERT INTO `Correlativas` VALUES('01', '01', '05', '01');
INSERT INTO `Correlativas` VALUES('01', '01', '06', '01');
INSERT INTO `Correlativas` VALUES('01', '01', '07', '01');
INSERT INTO `Correlativas` VALUES('02', '01', '03', '01');
INSERT INTO `Correlativas` VALUES('02', '01', '04', '01');
INSERT INTO `Correlativas` VALUES('02', '01', '05', '01');
INSERT INTO `Correlativas` VALUES('02', '01', '06', '01');
INSERT INTO `Correlativas` VALUES('02', '01', '07', '01');
INSERT INTO `Correlativas` VALUES('01', '02', '02', '02');
INSERT INTO `Correlativas` VALUES('01', '02', '03', '02');
INSERT INTO `Correlativas` VALUES('01', '02', '04', '02');
INSERT INTO `Correlativas` VALUES('01', '02', '05', '02');
INSERT INTO `Correlativas` VALUES('10', '07', '11', '07');
INSERT INTO `Correlativas` VALUES('10', '07', '13', '07');
INSERT INTO `Correlativas` VALUES('01', '04', '02', '04');
INSERT INTO `Correlativas` VALUES('01', '04', '03', '04');
INSERT INTO `Correlativas` VALUES('02', '04', '03', '04');

-- 
-- TABLE: InscripcionesAnuales 
--
CREATE TABLE InscripcionesAnuales(
    idInscripcionAnual       INT     NOT NULL,
    idInscripcionCarrera     INT     NOT NULL,
    idCarrera                INT     NOT NULL,
    idPersona                INT     NOT NULL,
    fechaInscripcionAnual    DATE    NOT NULL,
    PRIMARY KEY (idInscripcionAnual, idCarrera, idInscripcionCarrera, idPersona)
)ENGINE=INNODB
;
CREATE INDEX Ref510 ON InscripcionesAnuales(idInscripcionCarrera, idCarrera, idPersona);
ALTER TABLE InscripcionesAnuales ADD CONSTRAINT RefInscripcionesCarreras10 
    FOREIGN KEY ( idInscripcionCarrera, idCarrera, idPersona)
    REFERENCES InscripcionesCarreras(idInscripcionCarrera, idCarrera, idPersona)
;
INSERT INTO `InscripcionesAnuales` VALUES('01', '01','01', '01', '2021-04-01');
INSERT INTO `InscripcionesAnuales` VALUES('02', '02','01', '02', '2021-04-01');
INSERT INTO `InscripcionesAnuales` VALUES('03', '03','01', '03', '2021-04-01');
INSERT INTO `InscripcionesAnuales` VALUES('04', '04','01', '04', '2021-04-01');
INSERT INTO `InscripcionesAnuales` VALUES('05', '05','01', '05', '2021-04-01');
INSERT INTO `InscripcionesAnuales` VALUES('06', '06','02', '06', '2021-04-02');
INSERT INTO `InscripcionesAnuales` VALUES('07', '07','02', '07', '2021-04-02');
INSERT INTO `InscripcionesAnuales` VALUES('08', '08','02', '08', '2021-04-02');
INSERT INTO `InscripcionesAnuales` VALUES('09', '09','02', '09', '2021-04-02');
INSERT INTO `InscripcionesAnuales` VALUES('10', '10','02', '10', '2021-04-02');
INSERT INTO `InscripcionesAnuales` VALUES('11', '11','03', '11', '2021-04-03');
INSERT INTO `InscripcionesAnuales` VALUES('12', '12','03', '12', '2021-04-03');
INSERT INTO `InscripcionesAnuales` VALUES('13', '13','03', '13', '2021-04-03');
INSERT INTO `InscripcionesAnuales` VALUES('14', '14','04', '14', '2021-04-03');
INSERT INTO `InscripcionesAnuales` VALUES('15', '15','05', '15', '2021-04-03');
INSERT INTO `InscripcionesAnuales` VALUES('16', '16','06', '16', '2021-04-04');
INSERT INTO `InscripcionesAnuales` VALUES('17', '17','06', '17', '2021-04-04');
INSERT INTO `InscripcionesAnuales` VALUES('18', '18','06', '18', '2021-04-04');
INSERT INTO `InscripcionesAnuales` VALUES('19', '19','06', '19', '2021-04-04');
INSERT INTO `InscripcionesAnuales` VALUES('20', '20','06', '20', '2021-04-04');

-- 
-- TABLE: ActuacionAcademica 
--
CREATE TABLE ActuacionAcademica(
    idActuacionAcademica      INT            NOT NULL,
    idMateria                 INT            NOT NULL,
    idCarrera                 INT            NOT NULL,
    idInscripcionAnual        INT            NOT NULL,
    idInscripcionCarrera      INT            NOT NULL,
    idPersona                 INT            NOT NULL,
    tipoActuacionAcademica    VARCHAR(40)    NOT NULL
                              CHECK (tipoActuacionAcademica IN ('Cursando','Regular','Libre','Aprobada')),
    fechaCursando             DATE           NOT NULL,
    fechaRegular              DATE,
    fechaAprobado             DATE,
    fechaLibre                DATE,
    PRIMARY KEY (idActuacionAcademica, idMateria, idCarrera, idInscripcionAnual, idInscripcionCarrera, idPersona)
)ENGINE=INNODB
;
CREATE INDEX IX_fechaAprobado ON ActuacionAcademica(fechaAprobado);
CREATE INDEX Ref911 ON ActuacionAcademica(idInscripcionCarrera, idInscripcionAnual, idCarrera, idPersona);
CREATE INDEX Ref713 ON ActuacionAcademica(idMateria, idCarrera);
ALTER TABLE ActuacionAcademica ADD CONSTRAINT RefInscripcionesAnuales11 
    FOREIGN KEY (idInscripcionAnual, idCarrera, idInscripcionCarrera, idPersona)
    REFERENCES InscripcionesAnuales(idInscripcionAnual, idCarrera, idInscripcionCarrera, idPersona)
;
ALTER TABLE ActuacionAcademica ADD CONSTRAINT RefCurriculas13 
    FOREIGN KEY (idMateria, idCarrera)
    REFERENCES Curriculas(idMateria, idCarrera)
;

INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('01', '01','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-10','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('02', '02','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-20','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('03', '03','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-30','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('04', '04','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-10','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('05', '05','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-20','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('06', '06','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-30','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('07', '07','01', '01', '01','01','Aprobada','2021-04-15', '2021-11-10','2021-12-30');

INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('08', '01','01', '02', '02','02','Aprobada','2021-04-16', '2021-11-15','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('09', '02','01', '02', '02','02','Aprobada','2021-04-16', '2021-11-20','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando,fechaRegular,fechaAprobado) VALUES('10', '03','01', '02', '02','02','Aprobada','2021-04-16', '2021-11-25','2021-12-30');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('11', '04','01', '02', '02','02','Cursando','2021-04-16');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('12', '05','01', '02', '02','02','Cursando','2021-04-16');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('13', '06','01', '02', '02','02','Cursando','2021-04-16');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('14', '07','01', '02', '02','02','Cursando','2021-04-16');

INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('15', '01','01', '03', '03','03','Cursando','2021-04-17');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('16', '02','01', '03', '03','03','Cursando','2021-04-17');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('17', '03','01', '03', '03','03','Cursando','2021-04-17');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('18', '04','01', '03', '03','03','Cursando','2021-04-17');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('19', '05','01', '03', '03','03','Cursando','2021-04-17');
INSERT INTO `ActuacionAcademica`(idActuacionAcademica,idMateria,idCarrera,idInscripcionAnual,idInscripcionCarrera,idPersona,tipoActuacionAcademica,fechaCursando) VALUES('20', '06','01', '03', '03','03','Cursando','2021-04-17');

-- 
-- TABLE: Notas 
--
CREATE TABLE Notas(
    idNota                  INT     NOT NULL,
    idActuacionAcademica    INT     NOT NULL,
    idMateria               INT     NOT NULL,
    idCarrera               INT     NOT NULL,
    idInscripcionAnual      INT     NOT NULL,
    idInscripcionCarrera    INT     NOT NULL,
    idPersona               INT     NOT NULL,
    Calificacion            INT     NOT NULL,
    fechaCalificacion       DATE    NOT NULL,
    PRIMARY KEY (idNota, idActuacionAcademica, idMateria, idCarrera, idInscripcionAnual, idInscripcionCarrera, idPersona)
)ENGINE=INNODB
;
CREATE INDEX Ref1018 ON Notas(idCarrera, idInscripcionAnual, idActuacionAcademica, idMateria, idInscripcionCarrera, idPersona);
ALTER TABLE Notas ADD CONSTRAINT RefActuacionAcademica18 
    FOREIGN KEY (idActuacionAcademica, idMateria, idCarrera, idInscripcionAnual, idInscripcionCarrera, idPersona)
    REFERENCES ActuacionAcademica(idActuacionAcademica, idMateria, idCarrera, idInscripcionAnual, idInscripcionCarrera, idPersona)
;

INSERT INTO `Notas` VALUES('01','01','01', '01', '01','01','01','1','2021-12-01');
INSERT INTO `Notas` VALUES('02','01','01', '01', '01','01','01','7','2021-12-10');

INSERT INTO `Notas` VALUES('03','02','02', '01', '01','01','01','2','2021-12-01');
INSERT INTO `Notas` VALUES('04','02','02', '01', '01','01','01','8','2021-12-10');

INSERT INTO `Notas` VALUES('05','03','03', '01', '01','01','01','3','2021-12-01');
INSERT INTO `Notas` VALUES('06','03','03', '01', '01','01','01','9','2021-12-10');

INSERT INTO `Notas` VALUES('07','04','04', '01', '01','01','01','1','2021-12-01');
INSERT INTO `Notas` VALUES('08','04','04', '01', '01','01','01','7','2021-12-10');

INSERT INTO `Notas` VALUES('09','05','05', '01', '01','01','01','2','2021-12-01');
INSERT INTO `Notas` VALUES('10','05','05', '01', '01','01','01','8','2021-12-10');

INSERT INTO `Notas` VALUES('11','06','06', '01', '01','01','01','3','2021-12-01');
INSERT INTO `Notas` VALUES('12','06','06', '01', '01','01','01','10','2021-12-10');

INSERT INTO `Notas` VALUES('13','07','07', '01', '01','01','01','1','2021-12-01');
INSERT INTO `Notas` VALUES('14','07','07', '01', '01','01','01','7','2021-12-10');


INSERT INTO `Notas` VALUES('15','08','01', '01', '02','02','02','1','2021-12-01');
INSERT INTO `Notas` VALUES('16','08','01', '01', '02','02','02','7','2021-12-10');

INSERT INTO `Notas` VALUES('17','09','02', '01', '02','02','02','1','2021-12-01');
INSERT INTO `Notas` VALUES('18','09','02', '01', '02','02','02','7','2021-12-10');

INSERT INTO `Notas` VALUES('19','10','03', '01', '02','02','02','1','2021-12-01');
INSERT INTO `Notas` VALUES('20','10','03', '01', '02','02','02','7','2021-12-10');

