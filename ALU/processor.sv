module processor(input logic clk, reset, output logic[15:0] aluRes,pc, output logic [23:0]inst);

	
	logic [23:0] instrD,rdMemData,memWD, result;
	logic [15:0] A;
	logic memWriteM;
	
	ROM meminstructions(pc,clk, inst);

	registerAROM reg1(inst,clk,instrD);
	
	asip myProcessor(clk,reset, instrD,rdMemData, pc, aluRes,result,memWD, A,memWriteM);
	 
	RAM memdata(A,~clk, memWD, memWriteM, rdMemData);

endmodule 
