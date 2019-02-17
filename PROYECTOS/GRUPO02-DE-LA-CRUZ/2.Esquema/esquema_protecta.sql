/**
 *
 * DBMS           :  ORACLE
 * Esquema        :  PROTECTA
 * Descripción    :  Modelo de Base de Datos de Venta de Pólizas
 * Script         :  Crea el esquema y sus respectivas tablas
 * Creao por      :  Jaime Ríos, Juan De La Cruz y Miguel Rojas
 * Email          :  jrios@materiagris.pe, jdelacruz@materiagris.pe y mrojas@materiagris.pe
 * Sitio Web      :  www.materiagris.com.pe
 * Fecha          :  17-02-2019
 * 
**/


-- =============================================
-- CRACIÓN DEL USUARIO
-- =============================================

DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP USER PROTECTA CASCADE';
	SELECT COUNT(*) INTO N
	FROM DBA_USERS
	WHERE USERNAME = 'PROTECTA';
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/


CREATE USER PROTECTA IDENTIFIED BY admin;

GRANT CONNECT, RESOURCE TO PROTECTA;

ALTER USER PROTECTA
QUOTA UNLIMITED ON USERS;

GRANT CREATE VIEW TO PROTECTA;



-- =============================================
-- CONECTARSE A LA APLICACIÓN
-- =============================================

CONNECT PROTECTA/admin



-- ======================================================
-- TABLA CLIENT
-- ======================================================

  CREATE TABLE CLIENT
  (
    SCLIENT      CHAR(14) NOT NULL,
    DBIRTHDAT    DATE,
    SCLIENAME    CHAR(70),--CAMBIO LE AGREGUE MÁS CAPACIDAD
    SFIRSTNAME   CHAR(40),--CAMBIO LE AGREGUE MÁS CAPACIDAD
    SLASTNAME    CHAR(40),--CAMBIO LE AGREGUE MÁS CAPACIDAD
    SLASTNAME2   CHAR(40),--CAMBIO LE AGREGUE MÁS CAPACIDAD
    SLEGALNAME   VARCHAR2(60),
    DCOMPDATE    DATE,--CAMBIO LE QUITE EL NOT NULL
    DDEATHDAT    DATE,
    SLICENSE     CHAR(10),
    SSEXCLIEN    CHAR(1),
    NPERSON_TYP  NUMBER(5),
    NNATIONALITY NUMBER(5),
    CONSTRAINT CLIENT_PK PRIMARY KEY (SCLIENT)
  );

-- ======================================================
-- TABLA ADDRESS
-- ======================================================

  CREATE TABLE ADDRESS
  (
    SKEYADDRESS   CHAR(50) NOT NULL,
    SSTREET       CHAR(40),
    SSTREET1      CHAR(40),
    SCLIENT       CHAR(14),
    SE_MAIL       CHAR(60),
    DCOMPDATE     DATE,
    NPROVINCE     NUMBER(5),--FALTA MAESTRA
    NLOCAL        NUMBER(5),--FALTA MAESTRA
    NMUNICIPALITY NUMBER(10),--FALTA MAESTRA
    SDESCADD      CHAR(100),
    SREFERENCE    VARCHAR2(30),
    CONSTRAINT ADDRESS_PK PRIMARY KEY (SKEYADDRESS),
    CONSTRAINT ADDRESS_FK FOREIGN KEY (SCLIENT) REFERENCES CLIENT(SCLIENT)
  );



-- ======================================================
-- TABLA PHONES
-- ======================================================

  CREATE TABLE PHONES
  (
    SKEYADDRESS     CHAR(50) NOT NULL,
    SPHONE          CHAR(11),
    DCOMPDATE       DATE,
    CONSTRAINT PHONES_FK FOREIGN KEY (SKEYADDRESS) REFERENCES ADDRESS(SKEYADDRESS)
  );


-- ======================================================
-- TABLA PV_BRAND_AUTO
-- ======================================================

  CREATE TABLE PV_BRAND_AUTO
  (
    NVEHBRAND   NUMBER(5) NOT NULL,
    SDESCRIPT   VARCHAR2(50) NOT NULL,
    DEFFECDATE  DATE NOT NULL,
    SSTATREGT   CHAR(1),
    DCOMPDATE   DATE NOT NULL,
    CONSTRAINT PV_BRAND_AUTO_PK PRIMARY KEY (NVEHBRAND)
  );

-- ======================================================
-- TABLA PV_MODEL_AUTO
-- ======================================================

  CREATE TABLE PV_MODEL_AUTO
  (
    NVEHBRAND        NUMBER(5) NOT NULL,
    NVEHMODEL        NUMBER(5) NOT NULL,
    SDESCRIPT        VARCHAR2(50),
    DEFFECDATE       DATE,
    SSTATREGT        CHAR(1),
    DCOMPDATE        DATE,
    CONSTRAINT PV_MODEL_AUTO_PK PRIMARY KEY (NVEHMODEL),
    CONSTRAINT PV_BRAND_AUTO_FK FOREIGN KEY (NVEHBRAND) REFERENCES PV_BRAND_AUTO(NVEHBRAND)
  );

-- ======================================================
-- TABLA POLICY
-- ======================================================

  CREATE TABLE POLICY
  (
    NPOLICY       NUMBER(10) NOT NULL,
    SCLIENT       CHAR(14),
    DCHANGDAT     DATE,
    DCOMPDATE     DATE,
    DSTARTDATE    DATE,
    DEXPIRDAT     DATE,
    DISSUEDAT     DATE,
    DNULLDATE     DATE,
    NPREMIUM      NUMBER(18,6),
    CONSTRAINT POLICY_PK PRIMARY KEY (NPOLICY),
    CONSTRAINT POL_CLIENT_FK FOREIGN KEY (SCLIENT) REFERENCES CLIENT(SCLIENT)
  );

-- ======================================================
-- TABLA POLICY
-- ======================================================

  CREATE TABLE AUTO
  (
    NPOLICY      NUMBER(10) NOT NULL,
    NAUTOZONE    NUMBER(10),--FALTA ESA MAESTRA
    SCLIENT      CHAR(14),
    SCHASSIS     CHAR(40),
    SREGIST      CHAR(10),
    DCOMPDATE    DATE,
    NYEAR        NUMBER(5),
    NIDCLASE     NUMBER(5),--FALTA ESA MAESTRA
    NIDUSO       NUMBER(5),--FALTA ESA MAESTRA
    NVEHMODEL    NUMBER(5),
    NSEATCOUNT   NUMBER(5),
    CONSTRAINT POLICY_FK FOREIGN KEY (NPOLICY) REFERENCES POLICY(NPOLICY),
    CONSTRAINT PV_MODEL_AUTO_FK FOREIGN KEY (NVEHMODEL) REFERENCES PV_MODEL_AUTO(NVEHMODEL)
  );


-- ======================================================
-- FIN
-- ======================================================
