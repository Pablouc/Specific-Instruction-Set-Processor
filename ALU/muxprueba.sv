module muxprueba #(parameter WIDTH=3)(input [WIDTH:0] a, input [WIDTH:0] b, input [2:0] opCode, input ci, 
													output logic [WIDTH:0] out, output logic co, negativo, cero, acarreo, desbordamiento);

logic [WIDTH:0] outAnd;
logic [WIDTH:0] outOr;
logic [WIDTH:0] outXor;
logic [WIDTH:0] outSL;
logic [WIDTH:0] outSR;

logic [WIDTH:0] outSum;
logic  coSum;

logic [WIDTH+1:0]outSub;
logic [WIDTH+1:0]outSubToPos;
logic [WIDTH+1:0] aSub;
logic [WIDTH+1:0] bSub;
logic coSub;


//Instanciando los modulos	
andGate #(WIDTH) andGate_instance(a,b,outAnd);

nbit_full_adder #(WIDTH) sum_instance(a,b,ci,outSum,coSum);

comp2 #(WIDTH) c_instance(a,b,bSub,aSub);

nbit_full_adder #(WIDTH+1) sub_instance(aSub,bSub,ci,outSub,coSub);

orGate #(WIDTH) or_instance(a,b,outOr);

xorGate #(WIDTH) xor_instance(a,b,outXor);

shiftLeft #(WIDTH) sl(a,b,outSL);

shifRight #(WIDTH) sr(a,b,outSR);

////



always @(*)begin
case(opCode)

3'b000:begin
out=outAnd;
//Bandera cero
if(out==0) cero=1'b1;
else if(out!=0) cero=1'b0;

//Fijando banderas
acarreo=1'b0;
desbordamiento=1'b0;
negativo=1'b0;
end

3'b001: begin
	out=outSum;
	//Bandera cero
	if(out==0) cero=1'b1;
	else if(out!=0) cero=1'b0;
	
	co=coSum;
	//Bandera acarreo
	if(co==1) acarreo=1'b1;
	else if(co==0) acarreo=1'b0;
	
	//Fijando banderas
	desbordamiento=1'b0;
	negativo=1'b0;
	end

3'b010: begin
	co=coSub;
	//Bandera desbordamiento
	if(co==1) desbordamiento=1'b1;
	else if(co==0) desbordamiento=1'b0;
	
	if(outSub[WIDTH+1]==0)begin 
		//Bandera negativo
		negativo=1'b0;
		
		out=outSub[WIDTH:0];
		//Bandera cero
		if(out==0) cero=1'b1;
		else if(out!=0) cero=1'b0;
	end

	else if(outSub[WIDTH+1]==1)begin
	negativo=1'b1;
	outSubToPos=~outSub+1;
	out=outSubToPos[WIDTH:0];
	end

end

3'b011: begin
out=outOr;
//Bandera cero
if(out==0) cero=1'b1;
else if(out!=0) cero=1'b0;

//Fijando banderas
acarreo=1'b0;
desbordamiento=1'b0;
negativo=1'b0;
end

3'b100:begin
out=outXor;
//Bandera cero
if(out==0) cero=1'b1;
else if(out!=0) cero=1'b0;

//Fijando banderas
acarreo=1'b0;
desbordamiento=1'b0;
negativo=1'b0;
end

3'b101:begin
out=outSL;
//Bandera cero
if(out==0) cero=1'b1;
else if(out!=0) cero=1'b0;

//Fijando banderas
acarreo=1'b0;
desbordamiento=1'b0;
negativo=1'b0;
end

3'b110:
begin
out=outSR;
//Bandera cero
if(out==0) cero=1'b1;
else if(out!=0) cero=1'b0;

//Fijando banderas
acarreo=1'b0;
desbordamiento=1'b0;
negativo=1'b0;
end

//3'b111: ---Caso innecesario

default:out=3'b000;


endcase

end	
endmodule
