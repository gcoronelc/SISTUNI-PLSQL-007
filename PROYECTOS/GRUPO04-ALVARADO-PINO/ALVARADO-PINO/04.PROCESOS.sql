--Procesos --

CREATE OR REPLACE PROCEDURE PA_GENERAR_CABECERA_FACTURRA(
id_Sucursal IN Ventas.idSucursal%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
id_Personal IN Ventas.idPersonal%TYPE
)
IS
  
V_nextval NUMBER:= 0;
V_NunDoc NVARCHAR2(15);
 
BEGIN 

SELECT COUNT(*) INTO V_nextval 
FROM  Ventas;

V_nextval:=V_nextval+1;
V_NunDoc:=TO_CHAR('F01-0000' || V_nextval);

IF(V_nextval<0)
THEN
RAISE_APPLICATION_ERROR(-20100,'ERROR DE FACTURA');
END IF;

--INSERTANDO 
INSERT INTO Ventas 
VALUES(V_nextval,id_Sucursal,V_NunDoc,id_Cliente,id_Mon,0,id_Personal,TO_DATE(SYSDATE,'DD/MM/YYYY'));
DBMS_OUTPUT.PUT_LINE('EL ID DE LA CABECERA FACTURA ES: '|| V_nextval || ' Y SE GENERO EL NUMERO DE FACTURA : '|| V_NunDoc );

END;

--IDSUCURSAL,IDCLIENTE,IDMONEDA,IDPERSONAL
EXEC PA_GENERAR_CABECERA_FACTURRA(1,1,2,1)

--IDVENTA,IDITEM,CANTIDAD
EXEC PA_GENERAR_DETALLE_FACTURRA(23,5,5)

SELECT * FROM  Ventas;
SELECT * FROM  DTVentas;
--------------------------------
SELECT * FROM  ITEM;
SELECT * FROM  SUCURSAL;
SELECT * FROM  CLIENTE;
SELECT * FROM  personal;



CREATE OR REPLACE PROCEDURE PA_GENERAR_DETALLE_FACTURRA(
id_Venta IN DtVentas.idVenta%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE

)
IS
  
V_nextval NUMBER:= 0;
V_PREUNI NUMBER:= 0;
V_PRETOT NUMBER:= 0; 
V_IMPOTOT NUMBER:= 0;
BEGIN 

SELECT COUNT(*) INTO V_nextval 
FROM  DtVentas
WHERE idVenta=id_Venta;
V_nextval:=V_nextval+1;

SELECT precioItem INTO V_PREUNI FROM  item
WHERE idItem=id_Item;
V_PRETOT:=V_PREUNI*Cantidad_;


IF(V_nextval<0)
THEN
RAISE_APPLICATION_ERROR(-20100,'ERROR DE DETALLE');
END IF;

--INSERTANDO 
INSERT INTO DtVentas 
VALUES(id_Venta,V_nextval,id_Item,Cantidad_,V_PREUNI,V_PRETOT);

--ACTUALIZANDO
SELECT SUM(precioTot) INTO V_IMPOTOT
FROM DtVentas WHERE idVenta=id_Venta ;

UPDATE Ventas SET
totImporte=V_IMPOTOT
WHERE idVenta=id_Venta ;

DBMS_OUTPUT.PUT_LINE('SE GRABO EL ITEM : '|| V_nextval ||' EN EL DETALLE DEL ID DE VENTA : ' || id_Venta );

END;
