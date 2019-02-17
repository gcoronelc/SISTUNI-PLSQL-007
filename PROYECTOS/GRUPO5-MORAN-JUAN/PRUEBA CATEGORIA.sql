set serveroutput on
--OBTENER CATEGORIA
declare
v_registro CATEGORIA%ROWTYPE;
respuesta NUMBER;
mensaje VARCHAR2(100);
begin
PACK_CATEGORIA.OBTENER(21,v_registro,respuesta,mensaje);
dbms_output.put_line(v_registro.ID_CATEGORIA ||','|| v_registro.NOMBRE_CATEGORIA ||',' ||v_registro.DESCRIPCION_CAT);
end;
/

select * from categoria;

--INSERTAR CATEGORIA
declare
respuesta NUMBER;
MENSAJE VARCHAR2(100);
begin
PACK_CATEGORIA.INSERTAR(100,'COMPUTO','PRODCUCTOS DE COMPUTACION',respuesta,MENSAJE);

end;


-- ELIMINAR
declare
respuesta NUMBER;
MENSAJE VARCHAR2(100);
begin
PACK_CATEGORIA.ELIMINAR(100,respuesta,MENSAJE);

end;

--ACTUALIZAR

declare
respuesta NUMBER;
MENSAJE VARCHAR2(100);
begin
PACK_CATEGORIA.ACTUALIZAR(200,'CARNES','PRODUCTOS A BASE CARNES',respuesta,MENSAJE);

end;
