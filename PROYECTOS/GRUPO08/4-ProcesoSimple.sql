--=============================================================================
--programar un proceso simple
--=============================================================================

--Consultar el stock de un producto determinado--

CREATE OR REPLACE FUNCTION EEC_FNSIMPLE_PRODUCTO_1
(p_id_producto IN PRODUCTO.CODIGO_PRODUCTO%type)
RETURN NUMBER 
IS
	v_stock PRODUCTO.STOCK_PRODUCTO%TYPE;
BEGIN
	SELECT STOCK_PRODUCTO INTO v_stock
	FROM PRODUCTO 
	WHERE CODIGO_PRODUCTO = p_id_producto;
	RETURN v_stock;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		raise_application_error(-20001,'producto no esta registrado');
END;
