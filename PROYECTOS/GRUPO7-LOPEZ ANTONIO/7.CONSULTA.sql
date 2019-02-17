CREATE OR REPLACE PROCEDURE TRANSPORTE.PR_PROGRAMACION(
  P_FECHA IN VARCHAR2,
  P_HORA IN VARCHAR2
)

AS
     TYPE CAB_INFORME IS RECORD(
     V_ORIGEN          PROGRAMACION.ORIGEN%TYPE,
     V_DESTINO         PROGRAMACION.DESTINO%TYPE,
     V_BUS             BUS.PLACA%TYPE,
     V_NUMASIENTOS     BUS.NUMASIENTOS%TYPE,
     V_FECHAHORASALIDA PROGRAMACION.FECHAHORASALIDA%TYPE
     );
     
    
     TYPE DET_INFORME IS RECORD(
     V_NROASIENTO   BOLETO.NROASIENTO%TYPE,
     V_NOMBRE       PASAJERO.NOMBRE%TYPE,
     V_APELLIDO     PASAJERO.APELLIDO%TYPE,
     V_DNI          PASAJERO.DNI%TYPE,
     V_VALOR        BOLETO.VALOR%TYPE
     );
     

     V_REG_CAB_INFORME CAB_INFORME;
     V_REG_DET_INFORME DET_INFORME;
     
     CURSOR CURSOR_PROGRAMACION IS 
		SELECT P.ORIGEN, P.DESTINO,B.PLACA,B.NUMASIENTOS, P.FECHAHORASALIDA
		FROM TRANSPORTE.PROGRAMACION P
		INNER JOIN TRANSPORTE.BUS B
		ON(P.IDBUS=B.IDBUS)
		WHERE TO_DATE(P.FECHAHORASALIDA)=TO_DATE(P_FECHA,'DD/MM/YYYY')
		AND TO_CHAR(P.FECHAHORASALIDA,'HH24:MI')=P_HORA;


    CURSOR CURSOR_BOLETO IS 
    SELECT  BO.NROASIENTO,PA.NOMBRE, PA.APELLIDO, PA.DNI,BO.VALOR FROM TRANSPORTE.BOLETO BO
	INNER JOIN TRANSPORTE.PASAJERO PA
	ON BO.IDPASAJERO = PA.IDPASAJERO
	INNER JOIN TRANSPORTE.PROGRAMACION P
	ON BO.IDPROGRAMACION=P.IDPROGRAMACION
	WHERE TO_DATE(P.FECHAHORASALIDA)=TO_DATE(P_FECHA,'DD/MM/YYYY')
	AND TO_CHAR(P.FECHAHORASALIDA,'HH24:MI')=P_HORA
	ORDER BY BO.NROASIENTO;

BEGIN
     
      IF(   LENGTH(TRIM(P_FECHA)) IS NULL OR P_FECHA IS NULL) 
      THEN
         RAISE_APPLICATION_ERROR(-20010,'NO SE INGRESO FECHA');
      END IF; 
	  
       OPEN CURSOR_PROGRAMACION;
             
 	    LOOP FETCH CURSOR_PROGRAMACION INTO V_REG_CAB_INFORME;
 	     EXIT WHEN CURSOR_PROGRAMACION%NOTFOUND; 

 	           
 	        DBMS_OUTPUT.PUT_LINE('************************************************************');
 	        DBMS_OUTPUT.PUT_LINE('           INFORME:     SALIDA ' || P_FECHA ||' ' || P_HORA ||'  ');
 	        DBMS_OUTPUT.PUT_LINE('************************************************************');
 	        DBMS_OUTPUT.PUT_LINE('                                                            ');
 	        DBMS_OUTPUT.PUT_LINE('ORIGEN: ' || V_REG_CAB_INFORME.V_ORIGEN );
		DBMS_OUTPUT.PUT_LINE('DESTINO: ' || V_REG_CAB_INFORME.V_DESTINO );
 	        DBMS_OUTPUT.PUT_LINE('BUS: ' || V_REG_CAB_INFORME.V_BUS );
		DBMS_OUTPUT.PUT_LINE('NRO ASIENTOS: ' || V_REG_CAB_INFORME.V_NUMASIENTOS );


 	       OPEN CURSOR_BOLETO;
	 	     
	 	       LOOP FETCH CURSOR_BOLETO INTO V_REG_DET_INFORME;
	 	       EXIT WHEN CURSOR_BOLETO%NOTFOUND;

	 	          DBMS_OUTPUT.PUT_LINE(V_REG_DET_INFORME.V_NROASIENTO||'     '||V_REG_DET_INFORME.V_NOMBRE||'     ' || V_REG_DET_INFORME.V_APELLIDO||'     ' || V_REG_DET_INFORME.V_DNI||'     S/.' || V_REG_DET_INFORME.V_VALOR );	
	 	                     	          
 	           END LOOP;
 	          
 	       CLOSE CURSOR_BOLETO;     
 	    END LOOP;
 	    
 	   
 	   CLOSE CURSOR_PROGRAMACION;
 	   
 EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('OCURRIO UN ERROR EN EL REPORTE');
  DBMS_OUTPUT.PUT_LINE('CODIGO ERROR:' || TO_CHAR(SQLCODE));

END;


BEGIN
  PR_PROGRAMACION ('04/02/2019','21:00');
END;
