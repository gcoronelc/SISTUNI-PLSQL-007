
DECLARE 
  v_sueldo NUMERIC;
BEGIN
  SELECT sal INTO v_sueldo 
  FROM scott.emp
  WHERE ROWNUM = 1;
  dbms_output.PUT_LINE('Sueldo: ' || v_sueldo);
END;
/


DECLARE 
  v_sueldo NUMERIC;
BEGIN
  SELECT sal INTO v_sueldo 
  FROM scott.emp
  WHERE empno = 9999;
  dbms_output.PUT_LINE('Sueldo: ' || v_sueldo);
END;
/



/*
Tarea 03
Hacer un procedimiento almacenado que retorne mediante un 
parametro el sueldo de un empleado, si no existe debe retornar -1.
Esquema de Trabajo: RECURSOS
*/






