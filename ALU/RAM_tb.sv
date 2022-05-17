`timescale 1 ns / 1 ns

module RAM_tb();

logic [15:0] A;
logic memWriteM,clk;
logic [23:0] memWD,rdMemData;

RAM ram(A,~clk, memWD, memWriteM, rdMemData);

always #1 clk=~clk;

initial begin
clk<=0;
////////////Primer caso, Escribir en memoria///////
memWriteM<=1'b0;
A <= 16'b0000000000000001;



$display("*******Cargando un resultado a la RAM*******");


#1
if(rdMemData==24'b000000000000000000001111) $display("resultado correcto de lectura");
else $display("resultado incorrecto de carga"); 



memWriteM<=1'b1;
memWD<= 24'b000000000000000000001100;
A <= 16'b0000000000000001;

#2
if(rdMemData==24'b000000000000000000001100) $display("resultado correcto de escritura");
else $display("resultado incorrecto de lectura"); 
end
endmodule 