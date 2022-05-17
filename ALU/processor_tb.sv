`timescale 1 ps / 1 ps

module processor_tb();

logic clk, rst; 
logic[15:0] aluRes,pc;
logic [23:0]inst;
logic [3:0] btn;
processor procesador(clk, rst, btn, aluRes,pc, inst);


always #0.5 clk=~clk;

initial begin
clk<=0;
rst<=1;
btn<=4'b0001;

#0.5
rst<=0;






end


endmodule
