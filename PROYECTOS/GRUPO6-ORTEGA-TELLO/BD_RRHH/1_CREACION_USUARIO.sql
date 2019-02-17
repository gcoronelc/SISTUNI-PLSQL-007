
-- ==========================================================
-- CREACIÓN DEL ESQUEMA
-- ==========================================================

declare
  n number(3);
begin
  -- Verificar Cuenta
  select count(*) into n from dba_users where username = 'IDO_RRHH';
  if(n = 1) then
    execute immediate 'drop user IDO_RRHH cascade';
  end if;
  -- Crear Cuenta
  execute immediate 'create user IDO_RRHH identified by admin';  
end;


-- Asigna privilegios
grant connect, resource to IDO_RRHH;


-- Conexión con la base de datos
/*
connect IDO_RRHH/admin
HH
