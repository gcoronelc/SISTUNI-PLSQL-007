

select * from eureka.cuenta where chr_cuencodigo='00100001';
select * from eureka.movimiento where chr_cuencodigo='00100001';


call EUREKA.usp_egcc_retiro('00100001', 100, '0002', '123456' );


