module nbit_multiplier #(parameter WIDTH)(input logic [WIDTH:0] a, b ,output logic[WIDTH:0] out);

wire [(WIDTH+1)*(WIDTH+1)-1:0] p;  
genvar i; 
assign p[WIDTH : 0] = a[0] ? b : 0; 
generate for (i = 1; i < (WIDTH+1); i = i+1) begin:gen     
assign p[(WIDTH+1)*(i+1)-1 : (WIDTH+1)*i] = (a[i] ? b << i : 0) +  p[(WIDTH+1)*i-1 : (WIDTH+1)*(i-1)]; 
end 
endgenerate  
assign out = p[(WIDTH+1)*(WIDTH+1)-1 : (WIDTH+1)*((WIDTH+1)-1)];  


endmodule
