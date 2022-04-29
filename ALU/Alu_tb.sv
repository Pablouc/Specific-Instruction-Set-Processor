module Alu_tb();
parameter WIDTH=3;
logic [WIDTH:0] a;
logic [WIDTH:0] b;
logic [2:0] opCode;
logic [WIDTH:0] out;
logic ci, co, negativo, cero, acarreo, desbordamiento;

muxprueba #(WIDTH) mux_tb(a,b,opCode,ci,out,co,negativo, cero, acarreo, desbordamiento);

initial begin
////////////Primer caso///////
a= 4'b0111;
b= 4'b0010;
ci=1'b0;
$display("*******resultados para a=0111 y b=0010*******");
opCode= 3'b000;
#5
if(out==4'b0010) $display("resultado correcto en AND");
else $display("resultado incorrecto en AND");

#20
opCode= 3'b001;
#5
if(out==4'b1001) $display("resultado correcto en SUMA: 1001");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 3'b010;
#5
if(out==4'b0101) $display("resultado correcto en RESTA: 0101");
else if(out!=3'b1001)$display("resultado incorrecto en RESTA");
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(desbordamiento==1'b1) $display("desbordamiento correcto: Activo");
else if(desbordamiento==1'b0)$display("desbordamiento incorrecto");
if(negativo==1'b0) $display("negativo correcto: Bajo");
else if(negativo==1'b1)$display("negativo incorrecto");

#20
opCode= 3'b011;
#5
if(out==4'b0111) $display("resultado correcto en OR: 0111");
else if(out!=3'b0010)$display("resultado incorrecto en OR");

#20
opCode= 3'b100;
#5
if(out==4'b0101) $display("resultado correcto en XOR: 0101");
else $display("resultado incorrecto en XOR");

#20
opCode= 3'b101;
#5
if(out==4'b1100) $display("resultado correcto en SHIFT LEFT: 1100");
else $display("resultado incorrecto en SHIFT LEFT");

#20
opCode= 3'b110;
#5
if(out==4'b0001) $display("resultado correcto en SHIFT RIGHT: 0001");
else $display("resultado incorrecto en SHIFT RIGHT");


////////////Segundo caso//////////
#20
a= 4'b0101;
b= 4'b0101;
ci=1'b0;
$display("*******resultados para a=0101 y b=0101*******");
opCode= 3'b000;
#5
if(out==4'b0101) $display("resultado correcto en AND");
else $display("resultado incorrecto en AND");

#20
opCode= 3'b001;
#5
if(out==4'b1010) $display("resultado correcto en SUMA: 1010");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 3'b010;
#5
if(out==4'b0000) $display("resultado correcto en RESTA: 0");
else if(out!=4'b0000)$display("resultado incorrecto en RESTA");
if(cero==1'b1) $display("cero correcto: Alto");
else if(cero==1'b0)$display("cero incorrecto");
if(desbordamiento==1'b1) $display("desbordamiento correcto: Alto");
else if(desbordamiento==1'b0)$display("desbordamiento incorrecto");
if(negativo==1'b0) $display("negativo correcto: Bajo");
else if(negativo==1'b1)$display("negativo incorrecto");

#20
opCode= 3'b011;
#5
if(out==4'b0101) $display("resultado correcto en OR: 0101");
else if(out!=4'b0101)$display("resultado incorrecto en OR");

#20
opCode= 3'b100;
#5
if(out==4'b0000) $display("resultado correcto en XOR: 0");
else $display("resultado incorrecto en XOR");

#20
opCode= 3'b101;
#5
if(out==4'b0000) $display("resultado correcto en SHIFT LEFT: 0000");
else $display("resultado incorrecto en SHIFT LEFT");

#20
opCode= 3'b110;
#5
if(out==4'b0000) $display("resultado correcto en SHIFT RIGHT: 0000");
else $display("resultado incorrecto en SHIFT RIGHT");

////////////Tercer caso//////////
#20
a= 4'b1101;
b= 4'b0011;
ci=1'b0;
$display("*******resultados para a=1101 y b=0011*******");
opCode= 3'b000;
#5
if(out==4'b0001) $display("resultado correcto en AND");
else $display("resultado incorrecto en AND");

#20
opCode= 3'b001;
#5
if(out==4'b0000) $display("resultado correcto en SUMA: 0000");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b1) $display("cero correcto: Alto");
else if(cero==1'b0)$display("cero incorrecto");
if(acarreo==1'b1) $display("acarreo correcto: Alto");
else if(acarreo==1'b0)$display("acarreo incorrecta");

#20
opCode= 3'b010;
#5
if(out==4'b1010) $display("resultado correcto en RESTA: 1010");
else if(out!=4'b1010)$display("resultado incorrecto en RESTA");
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(desbordamiento==1'b1) $display("desbordamiento correcto: Alto");
else if(desbordamiento==1'b0)$display("desbordamiento incorrecto");
if(negativo==1'b0) $display("negativo correcto: Bajo");
else if(negativo==1'b1)$display("negativo incorrecto");

#20
opCode= 3'b011;
#5
if(out==4'b1111) $display("resultado correcto en OR: 1111");
else if(out!=4'b1111)$display("resultado incorrecto en OR");

#20
opCode= 3'b100;
#5
if(out==4'b1110) $display("resultado correcto en XOR: 1110");
else $display("resultado incorrecto en XOR");

#20
opCode= 3'b101;
#5
if(out==4'b1000) $display("resultado correcto en SHIFT LEFT: 1000");
else $display("resultado incorrecto en SHIFT LEFT");

#20
opCode= 3'b110;
#5
if(out==4'b0001) $display("resultado correcto en SHIFT RIGHT: 0001");
else $display("resultado incorrecto en SHIFT RIGHT");

////////////Cuarto caso//////////
#20
a= 4'b0001;
b= 4'b0010;
ci=1'b0;
$display("*******resultados para a=0001 y b=0010*******");
opCode= 3'b000;
#5
if(out==4'b0000) $display("resultado correcto en AND");
else $display("resultado incorrecto en AND");

#20
opCode= 3'b001;
#5
if(out==4'b0011) $display("resultado correcto en SUMA: 0011");
else $display("resultado incorrecto en SUMA"); 
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(acarreo==1'b0) $display("acarreo correcto: Bajo");
else if(acarreo==1'b1)$display("acarreo incorrecta");

#20
opCode= 3'b010;
#5
if(out==4'b0001) $display("resultado correcto en RESTA: 0001");
else if(out!=4'b0001)$display("resultado incorrecto en RESTA");
if(cero==1'b0) $display("cero correcto: Bajo");
else if(cero==1'b1)$display("cero incorrecto");
if(desbordamiento==1'b0) $display("desbordamiento correcto: Bajo");
else if(desbordamiento==1'b1)$display("desbordamiento incorrecto");
if(negativo==1'b1) $display("negativo correcto: Alto");
else if(negativo==1'b0)$display("negativo incorrecto");

#20
opCode= 3'b011;
#5
if(out==4'b0011) $display("resultado correcto en OR: 0011");
else if(out!=4'b0011)$display("resultado incorrecto en OR");

#20
opCode= 3'b100;
#5
if(out==4'b0011) $display("resultado correcto en XOR: 0011");
else $display("resultado incorrecto en XOR");

#20
opCode= 3'b101;
#5
if(out==4'b0100) $display("resultado correcto en SHIFT LEFT: 0100");
else $display("resultado incorrecto en SHIFT LEFT");

#20
opCode= 3'b110;
#5
if(out==4'b0000) $display("resultado correcto en SHIFT RIGHT: 0000");
else $display("resultado incorrecto en SHIFT RIGHT");


end
endmodule
