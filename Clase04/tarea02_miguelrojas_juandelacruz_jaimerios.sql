CREATE OR REPLACE TRIGGER SCOTT.tr_test_emp
AFTER INSERT OR DELETE OR UPDATE ON SCOTT.EMP
FOR EACH ROW
BEGIN
    if inserting then
        dbms_output.put_line('Nuevo empleado se ha insertado');
    elsif updating then 
        dbms_output.put_line('Un empleado se ha modificado');
    elsif deleting then
        dbms_output.put_line('Un empleado se ha eliminado');
    end if;
END tr_test_emp;

--insercion
insert into scott.emp values(8002, 'WARD', 'SALESMAN', 7698, '20/02/81', 1500, 300, 30);

--actualización
update scott.emp
set ename = 'JUAN PEREZ'
where empno = 7499;

--eliminación
delete scott.emp 
where empno = 7369;
