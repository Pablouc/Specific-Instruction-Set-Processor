`timescale 1 ps / 1 ps

module RAM_tb();

logic [15:0] A;
logic memWriteM,clk;
logic [23:0] memWD,rdMemData

ram RAM(A,~clk, memWD, memWriteM, rdMemData);



initial begin
clk=1;
////////////Primer caso, Escribir en memoria///////
memWD=1;
memWrite=1;
A = 16'b0000000000000001;
memWD= 24'b000000000000000000001111;


$display("*******Cargando un resultado a la RAM*******");


#5
if(rdMemData==24'b000000000000000000001111) $display("resultado correcto de carga");
else $display("resultado incorrecto de carga"); 


#20
memWD=1;
memWrite=0;
A = 16'b0000000000000001;

#5
if(rdMemData==24'b000000000000000000001111) $display("resultado correcto de lectura");
else $display("resultado incorrecto de lectura"); 

endmodule 