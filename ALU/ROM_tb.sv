`timescale 1 ns / 1 ns
module ROM_tb();
logic clk;
logic [15:0] pc;
logic [23:0] inst;
ROM meminstructions(pc,clk, inst);

always #1 clk=~clk;
initial begin
clk <= 0;
pc=16'b0000000000000001;


$display("*******Cargando resultado de la ROM*******");


#2			
if(inst==24'b111110101010000000000000) $display("resultado correcto de instruccion");
else $display("resultado incorrecto de instruccion"); 

pc=16'b0000000000000101;

#2
if(inst==24'b111101100110000001100000) $display("resultado correcto de instruccion");
else $display("resultado incorrecto de instruccion"); 


end

endmodule 