-- =======================================================
-- DEFINICION DEL PAQUETE
-- =======================================================

create or replace package scott.util is

  type gencur is ref cursor;

  function f_emp_x_dep( p_deptno number ) return gencur;

end util;
/

-- =======================================================
-- IMPLEMENTACION DEL PAQUETE
-- =======================================================
CREATE OR REPLACE PACKAGE BODY SCOTT.UTIL AS

  FUNCTION F_EMP_X_DEP( P_DEPTNO NUMBER ) RETURN GENCUR
  IS
    V_RETURNCURSOR GENCUR;
    V_SELECT VARCHAR(500);
  BEGIN
    
    V_SELECT := 'SELECT * FROM SCOTT.EMP WHERE DEPTNO = :CODIGO';
    
    OPEN V_RETURNCURSOR 
    FOR V_SELECT
    USING P_DEPTNO;
    
    RETURN V_RETURNCURSOR;
    
  END;

END UTIL;
/



declare
  v_cur util.gencur;
  r     emp%rowtype;
begin
  v_cur := util.f_emp_x_dep(30);
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



