-- =======================================================
-- DEFINICION DEL PAQUETE
-- =======================================================

CREATE OR REPLACE PACKAGE SCOTT.UTIL IS

  TYPE GENCUR IS REF CURSOR;

  FUNCTION F_EMP_X_DEP( V_DEPTNO NUMBER ) RETURN GENCUR;

END UTIL;
/

-- =======================================================
-- IMPLEMENTACION DEL PAQUETE
-- =======================================================
CREATE OR REPLACE PACKAGE BODY SCOTT.UTIL AS

  FUNCTION F_EMP_X_DEP( V_DEPTNO NUMBER ) RETURN GENCUR
  IS
    V_RETURNCURSOR GENCUR;
    V_SELECT VARCHAR(500);
  BEGIN
    
    V_SELECT := 'SELECT * FROM SCOTT.EMP WHERE DEPTNO = ' 
                 || TO_CHAR(V_DEPTNO );
    
    OPEN V_RETURNCURSOR 
    FOR V_SELECT;
    
    RETURN V_RETURNCURSOR;
    
  END;

END UTIL;
/



declare
  v_cur util.gencur;
  r     emp%rowtype;
begin
  v_cur := util.f_emp_x_dep(20);
  fetch v_cur into r;
  dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || r.ename );
  close v_cur;
end;
/


declare
  v_cur util.gencur;
  r     emp%rowtype;
begin
  v_cur := util.f_emp_x_dep(30);
  fetch v_cur into r;
  while v_cur%found loop
    dbms_output.put_line( to_char(v_cur%rowcount) || ' ' || r.ename );
    fetch v_cur into r;
  end loop;
  close v_cur;
end;
/




