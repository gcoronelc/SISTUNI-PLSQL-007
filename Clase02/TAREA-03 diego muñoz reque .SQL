CREATE OR REPLACE FUNCTION calc_promedio(
  P_1 NUMBER, p_2 NUMBER, p_3 NUMBER, p_4 NUMBER
)
return number
IS
  PROMEDIO number;
  M_NOTA NUMBER;
BEGIN

  M_NOTA := P_1;

  IF P_2 < M_NOTA THEN
     M_NOTA := P_2;
  END IF;

  IF P_3 < M_NOTA THEN
     M_NOTA := P_3;
  END IF;

  IF P_4 < M_NOTA THEN
     M_NOTA := P_4;
  END IF;


  promedio:=((p_1+p_2+p_3+p_4)-m_nota)/3;
  
  return promedio;
end;
/

select calc_promedio(10,20,10,2) from dual