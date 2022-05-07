module processor(input logic clk, reset, output logic[15:0] aluRes,pc, output logic [23:0]inst);
						//output logic [31:0] WriteData, DataAdr,
						//output logic MemWrite);
	
	logic [23:0] rd, data;
	logic wren;
	logic [15:0] address;
	
	ROM meminstructions(pc,clk, inst);
	
	//ram memdata(aluAddr,clk, data, wren, rd);
	
	asip myProcessor(clk,reset, inst, pc, aluRes);
	 
	 
	
	//ARM arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	//memInstructions imem(PC, Instr);
	//memData dmem(clk, sw1, sw2, sw3, sw4, sw5, DataAdr, ReadData);
endmodule 
