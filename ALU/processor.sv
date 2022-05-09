module processor(input logic clk, reset, output logic[15:0] aluRes,pc, output logic [23:0]inst);
						//output logic [31:0] WriteData, DataAdr,
						//output logic MemWrite);
	
	logic [23:0] rdMemData,data, result;
	logic [15:0] address;
	logic memWrite;
	//assign data=24'b100;
	ROM meminstructions(pc,clk, inst);

	RAM memdata(aluRes,~clk, rd2, memWrite, rdMemData);
	
	asip myProcessor(clk,reset, inst,rdMemData, pc, aluRes,result,rd2, memWrite);
	 

endmodule 
