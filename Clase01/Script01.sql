
SELECT * FROM SCOTT.EMP;

-- BLOQUE ANONIMO

BEGIN
  DBMS_OUTPUT.PUT_LINE('Bienvenidos al mundo de PL/SQL!!!');
END;
/

-- LLamada a un procedimiento
CALL DBMS_OUTPUT.PUT_LINE('Hola');

-- LLamada a un procedimiento
EXECUTE DBMS_OUTPUT.PUT_LINE('Hola');




-- FUNCION

CREATE OR REPLACE FUNCTION SCOTT.FN_SUMAR
( P_N1 NUMBER, P_N2 NUMBER )
RETURN NUMBER
AS
  V_SUMA NUMBER;
BEGIN
  V_SUMA := P_N1 + P_N2;
  RETURN V_SUMA;
END;
/


DECLARE
  v_suma NUMBER;
BEGIN
  v_suma := SCOTT.FN_SUMAR( 45, 32 );
  dbms_output.PUT_LINE('SUMA: ' || V_SUMA );
END;


SELECT SCOTT.FN_SUMAR( 45, 32 ) FROM DUAL;


-- PROCEDIMIENTO

CREATE OR REPLACE PROCEDURE SCOTT.PR_SUMAR
( P_N1 NUMBER, P_N2 NUMBER )
AS
  V_SUMA NUMBER;
BEGIN
  V_SUMA := P_N1 + P_N2;
  DBMS_OUTPUT.PUT_LINE( 'SUMA: ' || V_SUMA );
END;
/


BEGIN
  SCOTT.PR_SUMAR (65, 78);
END;

/*
Tarea 01
Hacer un procedimiento o funcion que muestre
el nombre del usuario que ha iniciado sesion.
*/

















