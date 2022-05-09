module processor(input logic clk, reset, output logic[15:0] aluRes,pc, output logic [23:0]inst);

	
	logic [23:0] rdMemData,data, result;
	logic [15:0] address;
	logic memWrite;
	
	ROM meminstructions(pc,clk, inst);

	RAM memdata(aluRes,~clk, data, memWrite, rdMemData);
	
	asip myProcessor(clk,reset, inst,rdMemData, pc, aluRes,result,data, memWrite);
	 

endmodule 
