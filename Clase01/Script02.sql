
-- Parametros

CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR IN NUMBER )
AS
BEGIN
  P_VALOR := P_VALOR + 1;
END;
/


CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR OUT NUMBER )
AS
BEGIN
  P_VALOR := 100;
END;
/


BEGIN
  SCOTT.SP_DEMO (:p_valor$NUMBER);
END;


DECLARE 
  V_VALOR NUMBER;
BEGIN
  SCOTT.SP_DEMO (V_VALOR);
  DBMS_OUTPUT.PUT_LINE( V_VALOR );
END;
/


CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR OUT NUMBER )
AS
  V_EXCEPTION EXCEPTION;
BEGIN
  P_VALOR := 100;
  RAISE V_EXCEPTION;
END;
/


DECLARE 
  V_VALOR NUMBER := 555;
BEGIN
  SCOTT.SP_DEMO (V_VALOR);
  DBMS_OUTPUT.PUT_LINE('1: ' || V_VALOR );
EXCEPTION 
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('2: ' || V_VALOR );
END;
/



CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR IN OUT NUMBER )
AS
  V_EXCEPTION EXCEPTION;
BEGIN
  P_VALOR := P_VALOR * 2;
  RAISE V_EXCEPTION;
END;
/


DECLARE 
  V_VALOR NUMBER := 100;
BEGIN
  SCOTT.SP_DEMO (V_VALOR);
  DBMS_OUTPUT.PUT_LINE('1: ' || V_VALOR );
EXCEPTION 
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('2: ' || V_VALOR );
END;
/


-- LA MAGIA DE NOCOPY - 1

CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR OUT NOCOPY NUMBER )
AS
  V_EXCEPTION EXCEPTION;
BEGIN
  P_VALOR := 100;
  RAISE V_EXCEPTION;
END;
/


DECLARE 
  V_VALOR NUMBER := 555;
BEGIN
  SCOTT.SP_DEMO (V_VALOR);
  DBMS_OUTPUT.PUT_LINE('1: ' || V_VALOR );
EXCEPTION 
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('2: ' || V_VALOR );
END;
/



-- LA MAGIA DE NOCOPY - 2


CREATE OR REPLACE PROCEDURE SCOTT.SP_DEMO
( P_VALOR IN OUT NOCOPY NUMBER )
AS
  V_EXCEPTION EXCEPTION;
BEGIN
  P_VALOR := P_VALOR * 2;
  RAISE V_EXCEPTION;
END;
/


DECLARE 
  V_VALOR NUMBER := 100;
BEGIN
  SCOTT.SP_DEMO (V_VALOR);
  DBMS_OUTPUT.PUT_LINE('1: ' || V_VALOR );
EXCEPTION 
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('2: ' || V_VALOR );
END;
/