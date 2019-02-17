--===========================
--PACKAGE PASAJERO
--===========================

-- CABECERA
--====================================================================================
CREATE OR REPLACE PACKAGE TRANSPORTE.PKG_PASAJERO AS
--====================================================================================
PROCEDURE PR_INSERTAR(
  P_IDPASAJERO 		IN PASAJERO.IDPASAJERO%TYPE,
  P_NOMBRE 		IN PASAJERO.NOMBRE%TYPE,
  P_APELLIDO 		IN PASAJERO.APELLIDO%TYPE,
  P_DNI 		IN PASAJERO.DNI%TYPE,
  P_DIRECCION           IN PASAJERO.DIRECCION%TYPE,
  P_TELEFONO 		IN PASAJERO.TELEFONO%TYPE,
  P_CELULAR		IN PASAJERO.CELULAR%TYPE,
  P_GENERO		IN PASAJERO.GENERO%TYPE,
  P_COD_RESPUESTA       OUT NUMBER,
  P_MENSAJE 		OUT VARCHAR2);


PROCEDURE PR_OBTENER(
  P_DNI                 IN  PASAJERO.DNI%TYPE,
  P_COD_RESPUESTA       OUT NUMBER,
  P_MENSAJE 		OUT VARCHAR2);


PROCEDURE PR_ACTUALIZAR(
  P_DNI 		IN PASAJERO.DNI%TYPE,
  P_NOMBRE 		IN PASAJERO.NOMBRE%TYPE,
  P_APELLIDO 		IN PASAJERO.APELLIDO%TYPE,
  P_DIRECCION           IN PASAJERO.DIRECCION%TYPE,
  P_TELEFONO 		IN PASAJERO.TELEFONO%TYPE,
  P_CELULAR		IN PASAJERO.CELULAR%TYPE,
  P_GENERO		IN PASAJERO.GENERO%TYPE,
  P_COD_RESPUESTA 	OUT NUMBER,
  P_MENSAJE 		OUT VARCHAR2);


PROCEDURE PR_ELIMINAR(
  P_DNI 		IN PASAJERO.DNI%TYPE,
  P_COD_RESPUESTA       OUT NUMBER,
  P_MENSAJE 		OUT VARCHAR2);

END PKG_PASAJERO;
--====================================================================================



-- CUERPO
--====================================================================================
CREATE OR REPLACE PACKAGE BODY TRANSPORTE.PKG_PASAJERO AS
--====================================================================================

PROCEDURE PR_INSERTAR(
        P_IDPASAJERO 		IN PASAJERO.IDPASAJERO%TYPE,
	P_NOMBRE 		IN PASAJERO.NOMBRE%TYPE,
	P_APELLIDO 		IN PASAJERO.APELLIDO%TYPE,
        P_DNI 			IN PASAJERO.DNI%TYPE,
	P_DIRECCION           	IN PASAJERO.DIRECCION%TYPE,
	P_TELEFONO 		IN PASAJERO.TELEFONO%TYPE,
	P_CELULAR		IN PASAJERO.CELULAR%TYPE,
	P_GENERO		IN PASAJERO.GENERO%TYPE,
	P_COD_RESPUESTA 	OUT NUMBER,
	P_MENSAJE 		OUT VARCHAR2)
IS
  	V_CONTADOR NUMBER := 0;
	
BEGIN

  --VERIFICAR DNI 
  SELECT COUNT(PA.IDPASAJERO) INTO V_CONTADOR 
  FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI;
  IF (V_CONTADOR > 0) THEN
    RAISE_APPLICATION_ERROR(-20001, 'DNI DE PASAJERO EXISTE');
  END IF;

  --INSERTAR PASAJERO
  INSERT INTO TRANSPORTE.PASAJERO(IDPASAJERO,NOMBRE,APELLIDO,DNI,DIRECCION,TELEFONO,CELULAR,GENERO) 
  VALUES (P_IDPASAJERO,P_NOMBRE,P_APELLIDO,P_DNI,P_DIRECCION,P_TELEFONO,P_CELULAR,P_GENERO);
  P_COD_RESPUESTA := 0;
  P_MENSAJE := 'SE INSERTO PASAJERO';    
   
EXCEPTION
  WHEN OTHERS THEN
   P_COD_RESPUESTA := -1;
   P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;	
END;
 

--====================================================================================

PROCEDURE PR_OBTENER(
	P_DNI 	        IN  PASAJERO.DNI%TYPE,
 	P_COD_RESPUESTA OUT NUMBER,
        P_MENSAJE 	OUT VARCHAR2)
IS
	V_PASAJERO	PASAJERO%ROWTYPE;
	V_CONTADOR NUMBER := 0;
	
BEGIN

  --VERIFICA DNI
  SELECT COUNT(PA.IDPASAJERO) INTO V_CONTADOR 
  FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI;
  IF (V_CONTADOR = 0) THEN
    RAISE_APPLICATION_ERROR(-20004, 'DNI DE PASAJERO NO EXISTE');
  END IF;
  
  --OBTENER PASAJERO
  SELECT PA.* INTO V_PASAJERO 
  FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI;
		
  P_COD_RESPUESTA := 0;
  P_MENSAJE := 'SE OBTIENE PASAJERO';
  DBMS_OUTPUT.PUT_LINE('Nombre: '|| V_PASAJERO.NOMBRE); 
  DBMS_OUTPUT.PUT_LINE('Apellidos: '|| V_PASAJERO.APELLIDO); 
		
EXCEPTION

  WHEN OTHERS THEN
  P_COD_RESPUESTA := -1;
  P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;
END;



--====================================================================================

PROCEDURE PR_ACTUALIZAR(
        P_DNI 			IN PASAJERO.DNI%TYPE,
	P_NOMBRE 		IN PASAJERO.NOMBRE%TYPE,
	P_APELLIDO 		IN PASAJERO.APELLIDO%TYPE,
	P_DIRECCION           	IN PASAJERO.DIRECCION%TYPE,
	P_TELEFONO 		IN PASAJERO.TELEFONO%TYPE,
	P_CELULAR		IN PASAJERO.CELULAR%TYPE,
	P_GENERO		IN PASAJERO.GENERO%TYPE,
  	P_COD_RESPUESTA 	OUT NUMBER,
  	P_MENSAJE 		OUT VARCHAR2)
IS
	V_CONTADOR NUMBER := 0;
	
BEGIN

  --VERIFICAR DNI 
  SELECT COUNT(PA.IDPASAJERO) INTO V_CONTADOR 
  FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI;
  IF (V_CONTADOR = 0) THEN
    RAISE_APPLICATION_ERROR(-20001, 'DNI DE PASAJERO NO EXISTE');
  END IF;
  
  --ACTUALIZAR PASAJERO
  UPDATE TRANSPORTE.PASAJERO PA
  SET 
  PA.NOMBRE=P_NOMBRE,
  PA.APELLIDO=P_APELLIDO,
  PA.DIRECCION=P_DIRECCION,
  PA.TELEFONO=P_TELEFONO,
  PA.CELULAR=P_CELULAR,
  PA.GENERO=P_GENERO
  WHERE PA.DNI = P_DNI;
    
  P_COD_RESPUESTA := 0;
  P_MENSAJE := 'PRODUCTO ACTUALIZADO CON EXITO';    
      
EXCEPTION
  WHEN OTHERS THEN
   P_COD_RESPUESTA := -1;
   P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;
END;

--====================================================================================

PROCEDURE PR_ELIMINAR(
  	P_DNI		IN PASAJERO.DNI%TYPE,
  	P_COD_RESPUESTA OUT NUMBER,
  	P_MENSAJE 	OUT VARCHAR2)
IS
	V_CONTADOR NUMBER := 0;
BEGIN

  --VERIFICAR DNI 
  SELECT COUNT(PA.IDPASAJERO) INTO V_CONTADOR 
  FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI;
  IF (V_CONTADOR = 0) THEN
    RAISE_APPLICATION_ERROR(-20001, 'DNI DE PASAJERO NO EXISTE');
  END IF;

  --ELIMINAR PASAJERO
  DELETE FROM TRANSPORTE.PASAJERO PA
  WHERE PA.DNI = P_DNI; 
	 
  P_COD_RESPUESTA := 0;
  P_MENSAJE := 'PASAJERO ELIMINADO';  
	
EXCEPTION

  WHEN OTHERS THEN
  P_COD_RESPUESTA := -1;
  P_MENSAJE := TO_CHAR(sqlcode) || ' - ' || SQLERRM;
END;

END PKG_PASAJERO;

