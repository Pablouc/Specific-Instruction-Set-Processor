`timescale 1 ps / 1 ps

module processor_tb();

logic clk, rst; 
logic[15:0] aluRes,pc;
logic [23:0]inst;

processor procesador(clk, rst, aluRes,pc, inst);


always #0.5 clk=~clk;

initial begin
clk<=0;
rst<=1;

#0.5
rst<=0;






end


endmodule
