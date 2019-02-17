--------CRUD WORK 17-02-19 ------------------------------------------------------------------
-- INTEGRANTES
-- CAPIA CAPIA REYNALDO
-- VERASTEGUI QUISPE GEFERSON
--------------------INICIO CREACIONN TABLA --------------------------------------------------
CREATE TABLE SCOTT.CLIENTE (
        id NUMBER NOT NULL,
        nombres VARCHAR(200) NOT NULL,
        apellidos VARCHAR(200) NOT NULL,
        fecha_afiliacion DATE NOT NULL,
        PRIMARY KEY(id)
);
--------------------FIN CREACIONN TABLA --------------------------------------------------
------------------------------------------------------------------------------------------
--------------------------INICIO PROCEDIMIENTO--------------------------------------------
--SP LISTAR
CREATE OR REPLACE PROCEDURE SCOTT.SP_LISTAR_CLIENTE(P_ID     NUMBER,
                                      P_NOMBRES   VARCHAR2,
                                      P_APELLIDOS VARCHAR2
                                      )
IS
v_id NUMBER;
v_nombres VARCHAR2(200);
v_apellidos VARCHAR2(200);
BEGIN
  SELECT id, nombres, apellidos INTO v_id, v_nombres, v_apellidos FROM CLIENTE WHERE id = P_ID;
  DBMS_OUTPUT.PUT_LINE('Registro listado con exito : '|| P_ID|| ' ' || P_NOMBRES || ' ' || P_APELLIDOS);
END;
--SP_INSERT
CREATE OR REPLACE PROCEDURE SCOTT.SP_REGISTRAR_CLIENTE(P_ID     NUMBER,
                                      P_NOMBRES   VARCHAR2,
                                      P_APELLIDOS VARCHAR2,
                                      P_FECHA     DATE)
IS
BEGIN
  INSERT INTO scott.cliente(id,nombres,apellidos,fecha_afiliacion)
     VALUES (P_ID,P_NOMBRES,P_APELLIDOS, P_FECHA);
  DBMS_OUTPUT.PUT_LINE('Registro insertado con exito : '|| P_ID || ' ' || P_NOMBRES || ' ' || P_APELLIDOS);
END;

--SP_UPDATE
CREATE OR REPLACE PROCEDURE SCOTT.SP_ACTUALIZAR_CLIENTE(P_ID     NUMBER,
                                      P_NOMBRES   VARCHAR2,
                                      P_APELLIDOS VARCHAR2,
                                      P_FECHA     DATE)
IS
BEGIN
  UPDATE CLIENTE SET nombres=P_NOMBRES, apellidos=P_APELLIDOS, fecha_afiliacion=SYSDATE WHERE id = P_ID;
  DBMS_OUTPUT.PUT_LINE('Registro actualizado con exito : '|| P_ID || ' ' || P_NOMBRES || ' ' || P_APELLIDOS);
END;

--SP DELETE
CREATE OR REPLACE PROCEDURE SCOTT.SP_BORRAR_CLIENTE(P_ID     NUMBER)
IS
BEGIN
  DELETE FROM scott.cliente WHERE id = P_ID;
  DBMS_OUTPUT.PUT_LINE('Registro borrado con exito : '|| P_ID);
END;
--------------------------FIN PROCEDIMIENTO--------------------------------------------
---------------------------------------------------------------------------------------
--------------------------INICIO EJECUCION---------------------------------------------

--LISTAR 
BEGIN
  SP_LISTAR_CLIENTE(1,'Nom1','Ape1');
  SP_LISTAR_CLIENTE(2,'Nom1','Ape1');
  SP_LISTAR_CLIENTE(3,'Nom1','Ape1');
  SP_LISTAR_CLIENTE(4,'Nom1','Ape1');
  SP_LISTAR_CLIENTE(5,'Nom1','Ape1');
END;
--INSERT
BEGIN
  SP_REGISTRAR_CLIENTE(1,'Pedro', 'Gallegos', SYSDATE);
  SP_REGISTRAR_CLIENTE(2,'Alvaro', 'Mestas', SYSDATE);
  SP_REGISTRAR_CLIENTE(3,'Jackelin', 'Mendoza', TO_DATE('17/02/19','DD/MM/YYYY'));
  SP_REGISTRAR_CLIENTE(4,'Jackelin', 'Mendoza', SYSDATE);
  SP_REGISTRAR_CLIENTE(5,'Jennie', 'Casas', TO_DATE('17/02/19','DD/MM/YYYY'));
END;
--UPDATE
BEGIN
  SP_ACTUALIZAR_CLIENTE(1,'Nome1', 'Ape1', SYSDATE);
  SP_ACTUALIZAR_CLIENTE(2,'Nome2', 'Ape2', SYSDATE);
  SP_ACTUALIZAR_CLIENTE(3,'Nome3', 'Ape3', SYSDATE);
  SP_ACTUALIZAR_CLIENTE(4,'Nome4', 'Ape4', SYSDATE);
  SP_ACTUALIZAR_CLIENTE(5,'Nome5', 'Ape5', SYSDATE);
END;
--DELETE
BEGIN
  SP_BORRAR_CLIENTE(1);
  SP_BORRAR_CLIENTE(2);
END;
--------------------------FIN EJECUCION--------------------------------------------
-------------------INICIO QUERY PRUEBAS--------------------------------------------
SELECT * FROM scott.CLIENTE;
UPDATE CLIENTE SET nombres='nombres', apellidos='apellidos', fecha_afiliacion=SYSDATE WHERE ID = 1;
DELETE FROM scott.CLIENTE WHERE ID = 1;
TRUNCATE TABLE SCOTT.CLIENTE;
-------------------INICIO QUERY PRUEBAS--------------------------------------------