CREATE TABLE SCOTT.sal_history(
    EmpNo number(4) not null,
    SalOld number(7,2) null,
    SalNew number(7,2) null,
    StartDate date not null,
    SetUser varchar2(30) not null
);

create or replace trigger tr_UpdateEmpSal
after insert or update on SCOTT.emp
for each row
begin
    insert into sal_history(EmpNo, SalOld, SalNew, StartDate, SetUser)
    values(:New.EmpNo, :Old.Sal, :New.Sal, sysdate, user);
end tr_UpdateEmpSal;

update scott.emp
set sal = 1500
where empno = 7777;

SELECT * FROM SCOTT.EMP;

select * from sal_history;

ROLLBACK;
    
   