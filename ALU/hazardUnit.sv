module hazardUnit(input logic pcSrc, pcSrcE, pcSrcM, pcSrcW, 
						output logic stallF); //, stallD, stallE, stallM );

						


assign stallF = (((pcSrc == 1'b1) | (pcSrcE == 1'b1) | (pcSrcM == 1'b1)) & (pcSrcW != 1'b1)) ? 1'b1 : 1'b0;
			


endmodule
  