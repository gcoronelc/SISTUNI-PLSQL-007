set serveroutput on;
DECLARE

CURSOR c_n IS
SELECT  distinct id_producto,unidades_pedida
FROM SCOTT.PRODUCTOS;

CURSOR c_nuevo(p_major NUMBER) IS
SELECT  nombre_producto,precio_unitario
from SCOTT.PRODUCTOS
WHERE id_producto=p_major;
BEGIN
   DBMS_OUTPUT.PUT_LINE('******REGISTRO******');
FOR a_student IN c_n 
LOOP
    DBMS_OUTPUT.PUT_LINE('-------------------');
    if(a_student.unidades_pedida >15)
    THEN
    DBMS_OUTPUT.PUT_LINE('ID' ||' '||a_student.id_producto ||' con unidades pedidas de : '|| a_student.unidades_pedida); 
    else
     DBMS_OUTPUT.PUT_LINE('ID' ||' '||a_student.id_producto || ' UNIDADES <15'); 
    end if;
    FOR r_student IN c_nuevo(a_student.id_producto) 
    LOOP
    DBMS_OUTPUT.PUT_LINE(r_student.nombre_producto||' ' || r_student.precio_unitario);
    END LOOP;
END LOOP;
END;