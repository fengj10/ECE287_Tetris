module TerisCurrChartDisplay(
	
	input			clk,
	input			rst,
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	
	
	input[9:0]		dot1,
	input[9:0]		dot2,
	input[9:0]		dot3,
	input[9:0]		dot4,
	
	

	output		CurrDisplayEn,
	output[23:0]	CurrDisplayData

);
localparam	TerisW	=	'd10;
localparam	TerisH	=	'd10;

localparam	XStart	=	'd90;
localparam	YStart	=	'd30;

reg CurrDisplayEnReg1;
reg CurrDisplayEnReg2;
reg CurrDisplayEnReg3;
reg CurrDisplayEnReg4;


assign CurrDisplayEn = CurrDisplayEnReg1 || CurrDisplayEnReg2 || CurrDisplayEnReg3 || CurrDisplayEnReg4;
assign CurrDisplayData = 23'h00FFFF;	


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDisplayEnReg1 <= 1'b0;
	else if(x_addr > (TerisW*dot1[9:5] + XStart)  && x_addr < (TerisW*dot1[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot1[4:0] + YStart) && y_addr < (TerisH*dot1[4:0] + YStart + TerisH))
			CurrDisplayEnReg1 <= 1'b1;
		else
			CurrDisplayEnReg1 <= 1'b0;
	else
		CurrDisplayEnReg1 <= 1'b0;

end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDisplayEnReg2 <= 1'b0;
	else if(x_addr > (TerisW*dot2[9:5] + XStart)  && x_addr < (TerisW*dot2[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot2[4:0] + YStart) && y_addr < (TerisH*dot2[4:0] + YStart + TerisH))
			CurrDisplayEnReg2 <= 1'b1;
		else
			CurrDisplayEnReg2 <= 1'b0;
	else
		CurrDisplayEnReg2 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDisplayEnReg3 <= 1'b0;
	else if(x_addr > (TerisW*dot3[9:5] + XStart)  && x_addr < (TerisW*dot3[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot3[4:0] + YStart) && y_addr < (TerisH*dot3[4:0] + YStart + TerisH))
			CurrDisplayEnReg3 <= 1'b1;
		else
			CurrDisplayEnReg3 <= 1'b0;
	else
		CurrDisplayEnReg3 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDisplayEnReg4 <= 1'b0;
	else if(x_addr > (TerisW*dot4[9:5] + XStart)  && x_addr < (TerisW*dot4[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot4[4:0] + YStart) && y_addr < (TerisH*dot4[4:0] + YStart + TerisH))
			CurrDisplayEnReg4 <= 1'b1;
		else
			CurrDisplayEnReg4 <= 1'b0;
	else
		CurrDisplayEnReg4 <= 1'b0;
end

endmodule 
