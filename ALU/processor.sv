module processor(input logic clk, reset, output logic[15:0] pc, output logic [23:0]inst);

	
	logic [23:0] instrD,rdMemData,memWD, result, outputDataForTxt;
	logic [15:0] A, outputAddrForTxt;
	logic memWriteM, stallF;
	
	ROM meminstructions(pc,clk, inst);

	registerAROM reg1(inst,clk, reset, stallF,instrD);
	
	asip myProcessor(clk,reset, instrD,rdMemData, pc,result,memWD,outputDataForTxt, A,outputAddrForTxt,memWriteM, stallF);
	 
	RAM memdata(A,~clk, memWD, memWriteM, rdMemData);

endmodule 
