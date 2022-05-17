module processor(input logic clk, reset, input[3:0] btn, output logic[15:0] aluRes, pc, output logic [23:0]inst, output logic [39:0] data, output logic enable);

	
	logic [23:0] instrD,rdMemData,memWD, result, outputDataForTxt, value;
	logic [15:0] A, outputAddrForTxt, addr;
	logic memWriteM, stallF, counter;
	
	ROM meminstructions(pc,clk, inst);

	registerAROM reg1(inst,clk, reset, stallF,instrD);
	
	asip myProcessor(clk,reset, instrD,rdMemData, pc,result,memWD,outputDataForTxt, A,outputAddrForTxt,memWriteM, stallF);
	 
	RAM memdata(A,~clk, memWD, memWriteM, rdMemData);
	
	assign data={outputAddrForTxt, outputDataForTxt};
	assign enable= (outputAddrForTxt!=15'b0) & (outputDataForTxt!=23'b0) ? 1'b1 : 1'b0;
	
	
	//WriteMemory writeBitstream( clk,reset, data , memory);

endmodule 
