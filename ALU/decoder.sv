module decoder(input logic [3:0] opcode, output logic regWrite, aluSrc, PCSrc, immSrc, flagUpdate,
					memToReg,memWrite,ra2Src,ra1Src, output  logic [1:0]  aluControl);

						
//flagUpdate es un enable para actualizar o no las flags.						
	

always @(*)begin
case(opcode)

4'b0000:begin
	//mult solo con registros
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	memToReg=1'b1;
	ra2Src=1'b0;
	//para que no hayan latches
	immSrc=1'b0;
	memWrite=1'b0;
	ra1Src=1'b0;
	end

4'b0001:begin
	//mult con imm
	aluControl=2'b01;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	memToReg=1'b1;
	//extensión de signo[7:0]
	immSrc=1'b0;
	flagUpdate=1'b1;
	//para que no hayan latches
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;
	end

4'b0010:begin
	//div solo con registros
	aluControl=2'b10;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	memToReg=1'b1;
	ra2Src=1'b0;
	//para que no hayan latches
	immSrc=1'b0;
	memWrite=1'b0;
	ra1Src=1'b0;
	end

4'b0011:begin
	//div con imm
	aluControl=2'b10;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	memToReg=1'b1;
	//extensión de signo[7:0]
	immSrc=1'b0;
	flagUpdate=1'b1;
	//para que no hayan latches
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;
	end

4'b0100:begin
	//suma
	aluControl=2'b00;
	regWrite=1'b1;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	memToReg=1'b1;
	ra2Src=1'b0;
	//para que no hayan latches
	immSrc=1'b0;
	memWrite=1'b0;
	ra1Src=1'b0;
	end

4'b0101:begin
	//Load 
	aluControl=2'b00;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	//extensión de signo[11:0]
	immSrc=1'b1;
	memToReg=1'b0;
	//para que no hayan latches
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;

	end

4'b0110:begin
	//Store
	aluControl=2'b00;
	regWrite=1'b0;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	flagUpdate=1'b0;
	memToReg=1'b0;
	//extensión de signo[11:0]
	immSrc=1'b1;
	memWrite=1'b1;
	ra2Src=1'b1;
	ra1Src=1'b0;
	end

4'b0111:begin
   //Branch
	aluControl=2'b00;
	regWrite=1'b0;
	aluSrc= 1'b1;
	PCSrc=1'b1;
	flagUpdate=1'b1;
	memToReg=1'b1;
	//extensión de signo[7:0]
	immSrc=1'b0;
	memWrite=1'b0;
	ra2Src=1'b1; //--------------------------------------///////////////Revisar
	ra1Src=1'b1;
	end

4'b1000:begin
   //Branch Equal
	aluControl=2'b11;
	regWrite=1'b0;
	aluSrc= 1'b0;
	PCSrc=1'b1;
	flagUpdate=1'b1;
	memToReg=1'b1;
	//extensión de signo[7:0]
	immSrc=1'b0;
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;
	end

//4'b1001:

//4'b1010:

//4'b1011:

//4'b1100:

//4'b1101:

//4'b1110:

4'b1111:begin
	//suma con inmediato
	aluControl=2'b00;
	regWrite=1'b1;
	aluSrc= 1'b1;
	PCSrc=1'b0;
	flagUpdate=1'b1;
	memToReg=1'b1;
	//para que no hayan latches
	immSrc=1'b0;
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;
	end

default:begin 
	aluControl=2'b00;
	regWrite=1'b0;
	aluSrc= 1'b0;
	PCSrc=1'b0;
	immSrc=1'b0;
	flagUpdate=1'b0;
	memToReg=1'b1;
	memWrite=1'b0;
	ra2Src=1'b0;
	ra1Src=1'b0;
	end

endcase

end	
endmodule
