set serveroutput on;
--ACTUALIZANDO

CREATE OR REPLACE PROCEDURE SCOTT.PROC_SIMPLE
(
PR_id_producto IN PRODUCTOS.id_producto%TYPE,
PR_precio_unitario  IN PRODUCTOS.precio_unitario%TYPE
)

AS
PR_unistock   PRODUCTOS.unidades_en_stock%TYPE;
BEGIN
SELECT unidades_en_stock into PR_unistock
FROM PRODUCTOS
WHERE PR_id_producto=id_producto;
    IF(PR_unistock<100) THEN
            UPDATE SCOTT.PRODUCTOS SET precio_unitario=PR_precio_unitario*12
            WHERE PR_id_producto=id_producto;
           COMMIT;
           ELSE
           raise_application_error(-20004, 'no suficiente');
    END IF;

EXCEPTION
WHEN 
NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('NO ENCONTRDO');
WHEN OTHERS THEN

DBMS_OUTPUT.PUT_LINE('ERROR');

END;


BEGIN 
SCOTT.PROC_SIMPLE(35,50);

END;
SELECT*FROM SCOTT.PRODUCTOS;




