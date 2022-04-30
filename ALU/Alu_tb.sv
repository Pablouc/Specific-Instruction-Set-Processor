module Alu_tb();
parameter WIDTH=31;
logic [WIDTH:0] a;
logic [WIDTH:0] b;
logic [1:0] opCode;
logic [WIDTH:0] out;
logic ci, co, negativo, cero, acarreo, desbordamiento;

muxprueba #(WIDTH) mux_tb(a,b,opCode,ci,out,co,negativo, cero, acarreo, desbordamiento);

initial begin
////////////Primer caso///////
a= 4'b0111;
b= 4'b0010;
ci=1'b0;
$display("*******resultados para a=0111 y b=0010*******");


opCode= 2'b00;
#5
if(out==4'b1001) $display("resultado correcto en SUMA: 1001");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");


#20
opCode= 2'b01;
#5
if(out==4'b1110) $display("resultado correcto en MULTIPLICACIÓN: 0001");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0011) $display("resultado correcto en DIVISION: 0011");
else $display("resultado incorrecto en DIVISION");


////////////Segundo caso//////////
#20
a= 4'b0101;
b= 4'b0101;
ci=1'b0;
$display("*******resultados para a=0101 y b=0101*******");

opCode= 2'b00;
#5
if(out==4'b1010) $display("resultado correcto en SUMA: 1010");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 2'b01;
#5
if(out==6'b011001) $display("resultado correcto en MULTIPLICACIÓN: 0001");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0001) $display("resultado correcto en DIVISION: 0001");
else $display("resultado incorrecto en DIVISION");


////////////Tercer caso//////////
#20
a= 4'b1101;
b= 4'b0011;
ci=1'b0;
$display("*******resultados para a=1101 y b=0011*******");

opCode= 2'b00;
#5
if(out==5'b10000) $display("resultado correcto en SUMA: 10000");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 2'b01;
#5
if(out==7'b0100111) $display("resultado correcto en MULTIPLICACIÓN: 0001");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0100) $display("resultado correcto en DIVISION: 0100");
else $display("resultado incorrecto en DIVISION");

////////////Cuarto caso//////////
#20
a= 4'b0001;
b= 4'b0010;
ci=1'b0;
$display("*******resultados para a=0001 y b=0010*******");

opCode= 2'b00;
#5
if(out==4'b0011) $display("resultado correcto en SUMA: 0011");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 2'b01;
#5
if(out==2'b10) $display("resultado correcto en MULTIPLICACIÓN: 0001");
else $display("resultado incorrecto en MULTIPLICACIÓN");

#20
opCode= 2'b10;
#5
if(out==4'b0000) $display("resultado correcto en DIVISION: 0000");
else $display("resultado incorrecto en DIVISION");

end
endmodule
