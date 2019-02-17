-- CURSORES

-- CASO 1

DECLARE
  CURSOR C_1 IS
    SELECT * FROM SCOTT.EMP;
  V_EMP SCOTT.EMP%ROWTYPE;
BEGIN
  OPEN C_1;
  
  FETCH C_1 INTO V_EMP;
  
  DBMS_OUTPUT.PUT_LINE(V_EMP.ENAME);
  
  CLOSE C_1;
END;


-- CASO 2

DECLARE
  CURSOR C_1 IS
    SELECT * FROM SCOTT.EMP;
  V_EMP SCOTT.EMP%ROWTYPE;
BEGIN
  OPEN C_1;
  LOOP
    
    FETCH C_1 INTO V_EMP;
    EXIT WHEN C_1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(V_EMP.ENAME || ' - ' || V_EMP.SAL);
  
  END LOOP;
  CLOSE C_1;
END;




-- CASO 3

DECLARE
  CURSOR C_1 IS SELECT * FROM SCOTT.EMP;
BEGIN
  FOR V_EMP IN C_1
  LOOP
    DBMS_OUTPUT.PUT_LINE(V_EMP.ENAME || ' - ' || V_EMP.SAL);  
  END LOOP;
END;



-- CASO 4

BEGIN

  UPDATE SCOTT.EMP 
  SET SAL = SAL * 1.1;
  DBMS_OUTPUT.PUT_LINE('FILAS PROCESADAS: ' || SQL%ROWCOUNT);  
  
  DELETE FROM SCOTT.EMP WHERE SAL > 2500;
  DBMS_OUTPUT.PUT_LINE('FILAS ELIMINADAS: ' || SQL%ROWCOUNT);  
  
END;


ROLLBACK;