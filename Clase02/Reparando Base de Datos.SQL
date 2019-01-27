select * from v$logfile;

-- GRUPO 1

ALTER DATABASE DROP LOGFILE GROUP 1; 

alter database 
add logfile GROUP 1
('E:\APP\ORACLE\ORADATA\ORCL\REDO01.LOG') 
size 100M; 


select * from v$logfile;


select group#,members,status,sequence# from v$log; 

-- GRUPO 2

ALTER DATABASE DROP LOGFILE GROUP 2; 

alter database 
add logfile GROUP 2
('E:\APP\ORACLE\ORADATA\ORCL\REDO02.LOG') 
size 100M; 

select group#,members,status,sequence# from v$log;



-- GRUPO 3

alter system switch logfile;

ALTER DATABASE DROP LOGFILE GROUP 3; 

alter database 
add logfile GROUP 3
('E:\APP\ORACLE\ORADATA\ORCL\REDO03.LOG') 
size 100M; 

select group#,members,status,sequence# from v$log;


