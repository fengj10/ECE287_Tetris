module TerisDisplay(
	
	input			clk,
	input			rst,
	
	
	input			Wall,
	input[23:0]		WallData,
	
	input			NextDisplayEn,
	input[23:0]		NextDisplayData,
	
	input			CurrDisplayEn,
	input[23:0]		CurrDisplayData,
	
	input			MapDisplayEn,
	input[23:0]		MapDisplayData,
	
	output[23:0]	odata
	
);


assign odata = (Wall == 1'b1) ? WallData : (NextDisplayEn == 1'b1) ? NextDisplayData :
		   (CurrDisplayEn == 1'b1) ? CurrDisplayData : (MapDisplayEn == 1'b1) ? MapDisplayData :'d0;

endmodule 
