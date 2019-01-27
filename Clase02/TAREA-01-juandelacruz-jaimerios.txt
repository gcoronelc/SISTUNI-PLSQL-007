-- Funcion

CREATE OR REPLACE FUNCTION SCOTT.FN_PROMEDIO
(P_N1 NUMBER, P_N2 NUMBER, P_N3 NUMBER, P_N4 NUMBER)
RETURN NUMBER 
AS
	V_PROMEDIO NUMBER;
BEGIN
	V_PROMEDIO := (P_N1 + P_N2+ P_N3+ P_N4)/4;
	RETURN V_PROMEDIO;
END;



-- Caso 1

DECLARE
  v_prom NUMBER;
BEGIN
  v_prom := FN_PROMEDIO(18,17,20,5);
  dbms_output.PUT_LINE('prom: ' || v_prom );
END;


-- Caso 2

DECLARE
  v_prom NUMBER;
BEGIN
  select FN_PROMEDIO(18,17,20,5) INTO v_prom FROM DUAL;
  dbms_output.PUT_LINE('prom: ' || v_prom );
END;


-- Llamada a una funcion

SELECT SCOTT.FN_PROMEDIO(3,5,10,5) FROM DUAL;




