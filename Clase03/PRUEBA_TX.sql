

select * from eureka.cuenta where chr_cuencodigo='00200001';

select * from eureka.movimiento where chr_cuencodigo='00200001'
ORDER BY 2;


call EUREKA.usp_egcc_retiro('00200001', 4700, '0002', '123456' );



