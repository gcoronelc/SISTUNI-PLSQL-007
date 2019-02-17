/*
 *
 * DBMS           :  Oracle Database
 * Esquema        :  TRANSPORTE
 * Descripción    :  Base de Datos de Transporte de Pasajeros
 * Script         :  Crea y carga datos en la Base de Datos
*/

--- ============================================
--- INICIO PROCESO
--- ============================================

SET TERMOUT ON
SET ECHO OFF
SET SERVEROUTPUT ON
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inicio del proceso...');
END ;
/
SET TERMOUT OFF

-- =============================================
-- CREACIÓN DEL USUARIO
-- =============================================

DECLARE
	V_N INT;
	V_COMMAND VARCHAR2(200);
BEGIN
	V_COMMAND := 'DROP USER TRANSPORTE CASCADE';
	SELECT COUNT(*) INTO V_N
	FROM DBA_USERS
	WHERE USERNAME = 'TRANSPORTE';
	IF ( V_N = 1 ) THEN
		EXECUTE IMMEDIATE V_COMMAND;
	END IF;
END;
/

CREATE USER TRANSPORTE IDENTIFIED BY admin;

-- =============================================
-- ASIGNAR PRIVILEGIOS
-- =============================================

GRANT CONNECT, RESOURCE TO TRANSPORTE;


-- =============================================
-- CONECTARSE A ORACLE
-- =============================================

CONNECT TRANSPORTE/admin


-- =============================================
-- CREACION DE TABLAS 
-- =============================================

CREATE TABLE TRANSPORTE.BUS
(
	idbus                INTEGER NOT NULL ,
	placa                VARCHAR2(20) NOT NULL ,
	marca                VARCHAR2(50) NULL ,
	numasientos          NUMBER(3) NULL,
	anofabricacion       CHAR(4) NULL, 
	CONSTRAINT pk_bus PRIMARY KEY ( idbus )
);

CREATE TABLE TRANSPORTE.CONDUCTOR
(
	idconductor          INTEGER NOT NULL,
	nombre               VARCHAR2(100) NULL ,
	apellido             VARCHAR2(100) NULL ,
	dni                  CHAR(8) NULL ,
	nrolicencia          VARCHAR2(50) NULL ,
	direccion            VARCHAR2(200) NULL ,
	telefono             VARCHAR2(20) NULL ,
	celular              VARCHAR2(20) NULL, 
	CONSTRAINT pk_conductor PRIMARY KEY ( idconductor )
);


CREATE TABLE TRANSPORTE.PROGRAMACION
(
	idprogramacion       INTEGER NOT NULL ,
	idbus                INTEGER NOT NULL ,
	origen               VARCHAR2(50) NOT NULL ,
	destino              VARCHAR2(50) NOT NULL ,
	fechahorasalida      DATE NOT NULL ,
	tarifa               NUMBER(4,2) NOT NULL,
    CONSTRAINT pk_programacion 
        PRIMARY KEY ( idprogramacion ),
    CONSTRAINT fk_programacion_bus
        FOREIGN KEY ( idbus ) 
        REFERENCES transporte.bus ( idbus ) ON DELETE CASCADE
);


CREATE TABLE TRANSPORTE.PROGRAMACION_CONDUCTOR
(
	idprogramacion       INTEGER NOT NULL ,
	idconductor          INTEGER NOT NULL ,
	turno                CHAR(1) NOT NULL ,
    CONSTRAINT fk_programacion
        FOREIGN KEY ( idprogramacion ) 
        REFERENCES transporte.programacion ( idprogramacion ) ON DELETE CASCADE,
    CONSTRAINT fk_conductor
        FOREIGN KEY ( idconductor ) 
        REFERENCES transporte.conductor ( idconductor ) ON DELETE CASCADE,
    CONSTRAINT pk_programacion_conductor 
        PRIMARY KEY ( idprogramacion, idconductor )
);



CREATE TABLE TRANSPORTE.EMPLEADO
(
	idempleado           INTEGER NOT NULL ,
	nombre               VARCHAR2(100) NOT NULL ,
	apellido             VARCHAR2(100) NOT NULL ,
	dni                  CHAR(8) NOT NULL ,
	telefono             VARCHAR2(20) NULL ,
	celular              VARCHAR2(20) NULL ,
	direccion            VARCHAR2(200) NULL ,
	email                VARCHAR2(50) NOT NULL ,
	cargo                VARCHAR2(20) NULL ,
	CONSTRAINT pk_empleado PRIMARY KEY ( idempleado )
);


CREATE TABLE TRANSPORTE.PASAJERO
(
	idpasajero           INTEGER NOT NULL ,
	nombre               VARCHAR2(100) NULL ,
	apellido             VARCHAR2(100) NULL ,
	dni                  CHAR(8) NULL ,
	direccion            VARCHAR2(200) NULL ,
	telefono             VARCHAR2(20) NULL ,
	celular              VARCHAR2(20) NULL , 
	genero               CHAR(1) NULL ,
	CONSTRAINT pk_pasajero PRIMARY KEY ( idpasajero )
);



CREATE TABLE TRANSPORTE.BOLETO
(
	idboleto             INTEGER NOT NULL ,
	idpasajero           INTEGER NOT NULL ,
	idprogramacion       INTEGER NOT NULL ,
	nroasiento           NUMBER(3) NOT NULL,
	valor                NUMBER(4,2) NOT NULL,
	idempleado           INTEGER NOT NULL, 
    CONSTRAINT pk_boleto 
        PRIMARY KEY ( idboleto ),
    CONSTRAINT fk_boleto_pasajero 
        FOREIGN KEY ( idpasajero ) 
        REFERENCES transporte.pasajero ( idpasajero ) ON DELETE CASCADE,
    CONSTRAINT fk_boleto_programacion 
        FOREIGN KEY ( idprogramacion ) 
        REFERENCES transporte.programacion ( idprogramacion ) ON DELETE CASCADE,
    CONSTRAINT fk_boleto_empleado 
        FOREIGN KEY ( idempleado ) 
        REFERENCES transporte.empleado ( idempleado ) ON DELETE CASCADE
);

/*
============================
   INSERCION EN BD
============================


============================
TABLA BUS
============================
*/

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (1,'AB-2331','Scania',65,'2005');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (2,'AT-2299','Volvo',60,'2010');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (3,'AOR-778','Mercedes Benz',55,'2000');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (4,'AWE-554','Mercedes Benz',55,'2000');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (5,'BE-7665','Volvo',55,'2008');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (6,'AWE-231','Scania',65,'2006');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (7,'CE-8787','Volvo',65,'2010');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (8,'AO-7978','Mercedes Benz',55,'2004');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (9,'AEO-9878','Scania',65,'2005');

INSERT INTO transporte.bus b (b.idbus, b.placa, b.marca, b.numasientos, b.anofabricacion) 
VALUES (10,'AWO-989','Volvo',60,'2010');

/*
============================
TABLA CONDUCTOR
============================
*/

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(1,'Juan','Perez Sarmiento','32435476','D32435476','Puente Piedra 123','012365768','998878998');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(2,'Jose','Salazar Romero','76757676','D76757676','Lince 234','012395768','998878333');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(3,'Fernando','Paredes Suarez','32485476','D32485476','Independencia 534','012398768','998008998');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(4,'Hugo','Prado Torres','32554432','D32554432','Lince 876','014354536','976564323');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(5,'Bruno','Ramirez Ramirez','07656546','D07656546','San Isidro 876','013157689','998878598');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(6,'Armando','Lopez Gonzales','32757976','D32757976','San Luis 954','012385768','976878333');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(7,'Jhon','Jimenez Tarazona','32967576','D32967576','Independencia 432','012498768','991118998');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(8,'Sandro','Martinez Torres','32994432','D32994432','Los Olivos 212','019354536','976364323');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(9,'Valentino','Saldaña Suarez','32894432','D32894432','Los Alamos 212','019394536','986364323');

INSERT INTO transporte.conductor c (c.idconductor,c.nombre,c.apellido,c.dni,c.nrolicencia,c.direccion,c.telefono, c.celular)
VALUES(10,'Francisco','Perez Guerra','44323123','D44323123','Las Poncianas 342','019374536','999364323');

/*
============================
TABLA PROGRAMACION
============================
*/
	
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(1,1,'LIMA','TRUJILLO',TO_DATE('04-02-2019 21:00','DD-MM-YYYY HH24:MI:SS'),50.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(2,2,'LIMA','CHICLAYO',TO_DATE('04-02-2019 09:00','DD-MM-YYYY HH24:MI:SS'),70.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(3,6,'LIMA','TRUJILLO',TO_DATE('05-02-2019 23:00','DD-MM-YYYY HH24:MI:SS'),60.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(4,10,'LIMA','CHICLAYO',TO_DATE('05-02-2019 09:00','DD-MM-YYYY HH24:MI:SS'),70.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(5,9,'LIMA','TRUJILLO',TO_DATE('06-02-2019 21:00','DD-MM-YYYY HH24:MI:SS'),50.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(6,2,'LIMA','CHICLAYO',TO_DATE('06-02-2019 09:00','DD-MM-YYYY HH24:MI:SS'),70.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(7,3,'LIMA','TRUJILLO',TO_DATE('07-02-2019 23:00','DD-MM-YYYY HH24:MI:SS'),60.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(8,10,'LIMA','CHICLAYO',TO_DATE('07-02-2019 09:00','DD-MM-YYYY HH24:MI:SS'),70.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(9,6,'LIMA','TRUJILLO',TO_DATE('07-02-2019 23:00','DD-MM-YYYY HH24:MI:SS'),60.00);
 INSERT INTO transporte.programacion p(p.idprogramacion,p.idbus,p.origen,p.destino,p.fechahorasalida,p.tarifa) 
 VALUES(10,7,'LIMA','CHIMBOTE',TO_DATE('07-02-2019 09:00','DD-MM-YYYY HH24:MI:SS'),40.00);


/*
============================
TABLA PROGRAMACION_CONDUCTOR
============================
*/

INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(1,1,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(1,2,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(2,4,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(2,9,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(3,5,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(3,6,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(4,3,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(4,8,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(5,1,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(5,2,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(6,4,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(6,7,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(7,1,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(7,9,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(8,3,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(8,8,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(9,6,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(9,3,'N');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(10,1,'M');
INSERT INTO transporte.programacion_conductor pc(pc.idprogramacion,pc.idconductor,pc.turno)
VALUES(10,2,'M');

/*
============================
TABLA EMPLEADO
============================
*/

INSERT INTO transporte.empleado e(e.idempleado,e.nombre,e.apellido,e.dni,e.telefono,e.celular,e.direccion,e.email,e.cargo)
VALUES(1,'Sofi', 'Juarez Mendoza','44338776','013454548','987655433','Los Tulipanes 212','sofijm@gmail.com','vendedor');

INSERT INTO transporte.empleado e(e.idempleado,e.nombre,e.apellido,e.dni,e.telefono,e.celular,e.direccion,e.email,e.cargo)
VALUES(2,'Eduardo', 'Perez Suarez','42338776','012254548','988855433','Los Alamos 212','eduardops@gmail.com','vendedor');

INSERT INTO transporte.empleado e(e.idempleado,e.nombre,e.apellido,e.dni,e.telefono,e.celular,e.direccion,e.email,e.cargo)
VALUES(3,'Tania', 'Altunes Torres','45321176','013994548','998655433','Los Alisos 225','taniaat@gmail.com','vendedor');

INSERT INTO transporte.empleado e(e.idempleado,e.nombre,e.apellido,e.dni,e.telefono,e.celular,e.direccion,e.email,e.cargo)
VALUES(4,'Fanny', 'Castro Zapata','32385443','012277940','989876433','Los Jardines 243','fannycz@gmail.com','vendedor');

INSERT INTO transporte.empleado e(e.idempleado,e.nombre,e.apellido,e.dni,e.telefono,e.celular,e.direccion,e.email,e.cargo)
VALUES(5,'Pablo', 'Barreto Palomino','47338776','013775548','987655434','Los Pedregales 265','pablobp@gmail.com','vendedor');


/*
============================
TABLA PASAJERO
============================
*/
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(1,'Roxana','Torres Pinedo','44231232','Los Olivos 243','012345542','987654328','F');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(2,'Maria','Bravo Tunes','32231239','San Luis 321','012745542','987660328','F');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(3,'Rodo','Fernandez Torres','32121232','Independencia 119','016445542','996654328','M');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(4,'Luis','Caceres Huiza','32651239','San Martin 765','012245542','987876328','M');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(5,'Hugo','Juarez Campos','44991232','Los Olivos 543','016545542','987687328','M');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(6,'Gabriela','Suarez Perez','32731239','San Luis 388','013245542','987660111','F');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(7,'Pamela','Farro Paredes','32165232','Independencia 165','012245542','987654328','F');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(8,'Carolina','Gutierrez Martinez','43151239','San Martin 765','012299542','985436328','F');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(9,'Pablo','Caceres Paredes','45165232','Puente Piedra 169','012287542','997654328','M');
 INSERT INTO transporte.pasajero p(p.idpasajero,p.nombre,p.apellido,p.dni,p.direccion,p.telefono,p.celular,p.genero)
 VALUES(10,'Sara','Valle Linares','47151239','San Martin 765','012299942','987436328','F'); 

/*
============================
TABLA BOLETO
============================
*/

INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(1,1,1,30,50.00,1);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(2,2,1,33,50.00,1);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(3,3,1,15,50.00,1);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(4,4,1,14,50.00,1);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(5,10,2,1,70.00,5);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(6,9,2,3,70.00,5);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(7,8,2,9,70.00,5);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(8,7,2,20,70.00,5);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(9,5,3,13,60.00,3);
INSERT INTO transporte.boleto bo(bo.idboleto,bo.idpasajero,bo.idprogramacion,bo.nroasiento,bo.valor,bo.idempleado)
VALUES(10,6,3,18,60.00,3);

COMMIT;

SELECT b.* FROM transporte.bus b;
SELECT c.* FROM transporte.conductor c;
SELECT p.* FROM transporte.programacion p;
SELECT pc.* FROM transporte.programacion_conductor pc;
SELECT e.* FROM transporte.empleado e;
SELECT pa.* FROM transporte.pasajero pa;
SELECT bo.* FROM transporte.boleto bo;

--- ============================================
--- FIN PROCESO
--- ============================================

SET TERMOUT ON
SET ECHO OFF
SET SERVEROUTPUT ON
BEGIN
	DBMS_OUTPUT.PUT_LINE('Fin del proceso');
END ;
/
SET TERMOUT OFF