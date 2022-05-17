`timescale 1 ps / 1 ps
module ROM_tb();
logic clk;
logic [15:0] pc;
logic [23:0] inst;
ROM meminstructions(pc,clk, inst);


initial begin
clk = 1;
pc=16'b0000000000000001;

$display("*******Cargando resultado de la ROM*******");


#5
if(inst==24'b110001001001000100000000) $display("resultado correcto de instruccion");
else $display("resultado incorrecto de instruccion"); 


endmodule 