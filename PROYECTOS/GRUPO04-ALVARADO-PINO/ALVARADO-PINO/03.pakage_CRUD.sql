--- CREACION DE PAQUETES ---

CREATE OR REPLACE PACKAGE PK_sucursal AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
);

PROCEDURE Actualizar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
);

PROCEDURE Eliminar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
);

PROCEDURE Obtener(
id_Sucursal IN sucursal.idsucursal%TYPE
,v_Lista OUT sucursal%ROWTYPE
);

END PK_sucursal;
/

CREATE OR REPLACE PACKAGE BODY PK_sucursal
AS

PROCEDURE Insertar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  SUCURSAL
WHERE idSucursal=id_Sucursal;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO SUCURSAL (idSucursal ,NomSucursal)
VALUES(id_Sucursal,Nom_Sucursal);

END;


PROCEDURE Actualizar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  SUCURSAL
WHERE idSucursal=id_Sucursal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE SUCURSAL SET 
idSucursal = id_Sucursal,
NomSucursal = Nom_Sucursal
WHERE idSucursal=id_Sucursal;


END;

PROCEDURE Eliminar(
id_Sucursal IN sucursal.idsucursal%TYPE,
Nom_Sucursal IN sucursal.NomSucursal%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  SUCURSAL
WHERE idSucursal=id_Sucursal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM SUCURSAL 
WHERE idSucursal=id_Sucursal;


END;

PROCEDURE Obtener(
id_Sucursal IN sucursal.idsucursal%TYPE,
v_Lista OUT sucursal%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  SUCURSAL
WHERE idSucursal=id_Sucursal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDSUCURSAL ,
NOMSUCURSAL   into v_Lista FROM SUCURSAL
WHERE idSucursal=id_Sucursal;

END;



END PK_sucursal;
/



--EXEC  PK_sucursal.Insertar(5,'XXX') ;
--EXEC  PK_sucursal.Actualizar(5,'sss') ;
--EXEC  PK_sucursal.Eliminar(5,'sss') ;
--select * sucursal;




CREATE OR REPLACE PACKAGE PK_Personal AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
);

PROCEDURE Actualizar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
);

PROCEDURE Eliminar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
);

PROCEDURE Obtener(
Id_Personal IN Personal.idPersonal%TYPE,
v_Lista OUT Personal%ROWTYPE
);

END PK_Personal;
/

CREATE OR REPLACE PACKAGE BODY PK_Personal
AS

PROCEDURE Insertar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Personal
WHERE idPersonal=Id_Personal;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO Personal 
VALUES(Id_Personal,Nom_Personal,Dni_);

END;


PROCEDURE Actualizar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Personal
WHERE idPersonal=Id_Personal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE Personal SET 
idPersonal = Id_Personal,
NomPersonal = Nom_Personal,
dni=Dni_
WHERE idPersonal=Id_Personal;

END;

PROCEDURE Eliminar(
Id_Personal IN Personal.idPersonal%TYPE,
Nom_Personal IN Personal.NomPersonal%TYPE,
Dni_ IN Personal.dni%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Personal
WHERE idPersonal=Id_Personal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM Personal 
WHERE idPersonal=Id_Personal;


END;

PROCEDURE Obtener(
Id_Personal IN Personal.idPersonal%TYPE,
v_Lista OUT Personal%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Personal
WHERE idPersonal=Id_Personal;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDPERSONAL ,
NOMPERSONAL ,
DNI    into v_Lista FROM Personal
WHERE idPersonal=Id_Personal;

END;



END PK_Personal;
/




CREATE OR REPLACE PACKAGE PK_Cliente AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
);

PROCEDURE Actualizar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
);

PROCEDURE Eliminar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
);

PROCEDURE Obtener(
id_Cliente IN cliente.idCliente%TYPE,
v_Lista OUT cliente%ROWTYPE
);

END PK_Cliente;
/

CREATE OR REPLACE PACKAGE BODY PK_Cliente
AS

PROCEDURE Insertar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  cliente
WHERE idCliente=id_Cliente;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO cliente 
VALUES(id_Cliente,Nom_Cliente,Ruc_);

END;


PROCEDURE Actualizar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  cliente
WHERE idCliente=id_Cliente;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE cliente SET 
idCliente = id_Cliente,
NomCliente = Nom_Cliente,
Ruc=Ruc_
WHERE idCliente=id_Cliente;

END;

PROCEDURE Eliminar(
id_Cliente IN cliente.idCliente%TYPE,
Nom_Cliente IN cliente.NomCliente%TYPE,
Ruc_ IN cliente.Ruc%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  cliente
WHERE idCliente=id_Cliente;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM cliente 
WHERE idCliente=id_Cliente;


END;

PROCEDURE Obtener(
id_Cliente IN cliente.idCliente%TYPE,
v_Lista OUT cliente%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  cliente
WHERE idCliente=id_Cliente;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDCLIENTE ,
NOMCLIENTE ,
RUC     into v_Lista FROM cliente
WHERE idCliente=id_Cliente;

END;



END PK_Cliente;
/







CREATE OR REPLACE PACKAGE PK_Moneda AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
);

PROCEDURE Actualizar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
);

PROCEDURE Eliminar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
);

PROCEDURE Obtener(
id_Mon IN Moneda.idMon%TYPE,
v_Lista OUT Moneda%ROWTYPE
);

END PK_Moneda;
/

CREATE OR REPLACE PACKAGE BODY PK_Moneda
AS

PROCEDURE Insertar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Moneda
WHERE idMon=id_Mon;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO Moneda 
VALUES(id_Mon,Nom_Moneda,sigla_);

END;


PROCEDURE Actualizar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Moneda
WHERE idMon=id_Mon;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE Moneda SET 
idMon = id_Mon,
NomMoneda = Nom_Moneda,
sigla=sigla_
WHERE idMon=id_Mon;

END;

PROCEDURE Eliminar(
id_Mon IN Moneda.idMon%TYPE,
Nom_Moneda IN Moneda.NomMoneda%TYPE,
sigla_ IN Moneda.sigla%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Moneda
WHERE idMon=id_Mon;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM Moneda 
WHERE idMon=id_Mon;


END;

PROCEDURE Obtener(
id_Mon IN Moneda.idMon%TYPE,
v_Lista OUT Moneda%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Moneda
WHERE idMon=id_Mon;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDMON ,
NOMMONEDA ,
SIGLA      into v_Lista FROM Moneda
WHERE idMon=id_Mon;

END;



END PK_Moneda;
/




CREATE OR REPLACE PACKAGE PK_Item AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
);

PROCEDURE Actualizar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
);

PROCEDURE Eliminar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
);

PROCEDURE Obtener(
id_Item IN item.idItem%TYPE,
v_Lista OUT item%ROWTYPE
);

END PK_Item;
/

CREATE OR REPLACE PACKAGE BODY PK_Item
AS

PROCEDURE Insertar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  item
WHERE idItem=id_Item;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO item 
VALUES(id_Item,Nom_Item,precio_Item,Cantidad_);

END;


PROCEDURE Actualizar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  item
WHERE idItem=id_Item;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE item SET 
idItem = id_Item,
NomItem = Nom_Item,
precioItem=precio_Item,
Cantidad=Cantidad_
WHERE idItem=id_Item;


END;

PROCEDURE Eliminar(
id_Item IN item.idItem%TYPE,
Nom_Item IN item.NomItem%TYPE,
precio_Item IN item.precioItem%TYPE,
Cantidad_ IN item.Cantidad%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  item
WHERE idItem=id_Item;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM item 
WHERE idItem=id_Item;

END;

PROCEDURE Obtener(
id_Item IN item.idItem%TYPE,
v_Lista OUT item%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  item
WHERE idItem=id_Item;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDITEM ,
NOMITEM ,
PRECIOITEM ,
CANTIDAD      into v_Lista FROM item
WHERE idItem=id_Item;

END;



END PK_Item;
/




CREATE OR REPLACE PACKAGE PK_Ventas AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
);

PROCEDURE Actualizar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
);

PROCEDURE Eliminar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
);

PROCEDURE Obtener(
id_Venta IN Ventas.idVenta%TYPE,
v_Lista OUT Ventas%ROWTYPE
);

END PK_Ventas;
/

CREATE OR REPLACE PACKAGE BODY PK_Ventas
AS

PROCEDURE Insertar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Ventas
WHERE idVenta=id_Venta;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO Ventas 
VALUES(id_Venta,id_Sucursal,NumDoc_,id_Cliente,id_Mon,tot_Importe,id_Personal,fec_Reg_Ven);

END;


PROCEDURE Actualizar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Ventas
WHERE idVenta=id_Venta;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE Ventas SET 
idVenta = id_Venta,
idSucursal = id_Sucursal,
NumDoc=NumDoc_,
idCliente=id_Cliente,
idMon=id_Mon,
totImporte = tot_Importe,
idPersonal=id_Personal,
fecRegVen=fec_Reg_Ven

WHERE idVenta=id_Venta;


END;

PROCEDURE Eliminar(
id_Venta IN Ventas.idVenta%TYPE,
id_Sucursal IN Ventas.idSucursal%TYPE,
NumDoc_ IN Ventas.NumDoc%TYPE,
id_Cliente IN Ventas.idCliente%TYPE,
id_Mon IN Ventas.idMon%TYPE,
tot_Importe IN Ventas.totImporte%TYPE,
id_Personal IN Ventas.idPersonal%TYPE,
fec_Reg_Ven IN Ventas.fecRegVen%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Ventas
WHERE idVenta=id_Venta;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM Ventas 
WHERE idVenta=id_Venta;

END;

PROCEDURE Obtener(
id_Venta IN Ventas.idVenta%TYPE,
v_Lista OUT Ventas%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  Ventas
WHERE idVenta=id_Venta;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDVENTA ,
IDSUCURSAL ,
NUMDOC ,
IDCLIENTE ,
IDMON ,
TOTIMPORTE ,
IDPERSONAL ,
FECREGVEN  into v_Lista FROM Ventas
WHERE idVenta=id_Venta;

END;



END PK_Ventas;
/




CREATE OR REPLACE PACKAGE PK_DtVentas AS

--PROCEDIMIENTOS

PROCEDURE Insertar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
);

PROCEDURE Actualizar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
);

PROCEDURE Eliminar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
);

PROCEDURE Obtener(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
v_Lista OUT DtVentas%ROWTYPE
);

END PK_DtVentas;
/

CREATE OR REPLACE PACKAGE BODY PK_DtVentas
AS

PROCEDURE Insertar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  DtVentas
WHERE idVenta=id_Venta and NumItem=Num_Item ;

IF(V_VERIFICA>0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO DUPLICADO');
END IF;

--INSERTANDO 
INSERT INTO DtVentas 
VALUES(id_Venta,Num_Item,id_Item,Cantidad_,precio_Uni,precio_Tot);

END;


PROCEDURE Actualizar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  DtVentas
WHERE idVenta=id_Venta and NumItem=Num_Item ;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ACTUALIZANDO 

UPDATE DtVentas SET 
idVenta = id_Venta,
NumItem = Num_Item,
idItem=id_Item,
Cantidad=Cantidad_,
precioUni=precio_Uni,
precioTot = precio_Tot

WHERE idVenta=id_Venta and NumItem=Num_Item ;


END;

PROCEDURE Eliminar(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
id_Item IN DtVentas.idItem%TYPE,
Cantidad_ IN DtVentas.Cantidad%TYPE,
precio_Uni IN DtVentas.precioUni%TYPE,
precio_Tot IN DtVentas.precioTot%TYPE
)
IS
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  DtVentas
WHERE idVenta=id_Venta and NumItem=Num_Item ;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--ELIMINAR 
DELETE FROM DtVentas 
WHERE idVenta=id_Venta and NumItem=Num_Item ;

END;

PROCEDURE Obtener(
id_Venta IN DtVentas.idVenta%TYPE,
Num_Item IN DtVentas.NumItem%TYPE,
v_Lista OUT DtVentas%ROWTYPE
)
IS    
  
V_VERIFICA NUMBER:= 0;
 
BEGIN 

SELECT COUNT(*) INTO V_VERIFICA 
FROM  DtVentas
WHERE idVenta=id_Venta and NumItem=Num_Item ;

IF(V_VERIFICA=0)
THEN
RAISE_APPLICATION_ERROR(-20100,'CODIGO NO EXISTE');
END IF;

--OBTENIENDO 
SELECT IDVENTA ,
NUMITEM ,
IDITEM ,
CANTIDAD ,
PRECIOUNI ,
PRECIOTOT  into v_Lista FROM DtVentas
WHERE idVenta=id_Venta and NumItem=Num_Item ;
END;



END PK_DtVentas;
/
