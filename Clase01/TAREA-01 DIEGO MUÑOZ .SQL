
CREATE OR REPLACE PROCEDURE SCOTT.MOSTRAR_USUARIO
IS
  NOMBRE VARCHAR2(20);
BEGIN
  SELECT  USER  INTO NOMBRE FROM DUAL;
  DBMS_OUTPUT.PUT_LINE(NOMBRE);
END;
/

CREATE OR REPLACE PROCEDURE SCOTT.MOSTRAR_USUARIO
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE(user);
END;
/


call SCOTT.MOSTRAR_USUARIO();

