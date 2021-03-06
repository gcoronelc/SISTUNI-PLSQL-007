-- VERIFICAR EL CALCULO

CREATE OR REPLACE PROCEDURE SCOTT.SP_IMPORTE
(
  P_PRECIO   IN  NUMBER, 
  P_CANTIDAD IN  NUMBER, 
  P_IMPORTE  OUT NUMBER, 
  P_IMPUESTO OUT NUMBER, 
  P_TOTAL    OUT NUMBER)
AS
	
BEGIN
	P_IMPUESTO := (P_PRECIO * 0.18) * P_CANTIDAD;
	P_IMPORTE := (P_PRECIO * P_CANTIDAD) - P_IMPUESTO;
	P_TOTAL := P_IMPORTE + P_IMPUESTO;	
END;

DECLARE 
  P_IMPORTE number;
  P_IMPUESTO number;
  P_TOTAL number;
BEGIN
  SP_IMPORTE (50, 2, P_IMPORTE, P_IMPUESTO, P_TOTAL);
  DBMS_OUTPUT.PUT_LINE('IMPORTE: ' || P_IMPORTE);
  DBMS_OUTPUT.PUT_LINE('IMPUESTO: ' || P_IMPUESTO);
  DBMS_OUTPUT.PUT_LINE('TOTAL: ' || P_TOTAL);
END;