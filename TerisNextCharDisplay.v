module TerisNextCharDisplay(

	input			clk,
	input			rst,

	input[8:0]		x_addr,
	input[8:0]		y_addr,

	input[9:0]		dot1,
	input[9:0]		dot2,
	input[9:0]		dot3,
	input[9:0]		dot4,
	

	output		NextDisplayEn,
	output[23:0]	NextDisplayData
	
);

localparam	TerisW	=	'd10;
localparam	TerisH	=	'd10;

localparam	XStart	=	'd00;
localparam	YStart	=	'd50;

reg NextDisplayEnReg1;
reg NextDisplayEnReg2;
reg NextDisplayEnReg3;
reg NextDisplayEnReg4;


assign NextDisplayEn = NextDisplayEnReg1 || NextDisplayEnReg2 || NextDisplayEnReg3 || NextDisplayEnReg4;
assign NextDisplayData = 23'h00FF00;	


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		NextDisplayEnReg1 <= 1'b0;
	else if(x_addr > (TerisW*dot1[9:5] + XStart)  && x_addr < (TerisW*dot1[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot1[4:0] + YStart) && y_addr < (TerisH*dot1[4:0] + YStart + TerisH))
			NextDisplayEnReg1 <= 1'b1;
		else
			NextDisplayEnReg1 <= 1'b0;
	else
		NextDisplayEnReg1 <= 1'b0;

end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		NextDisplayEnReg2 <= 1'b0;
	else if(x_addr > (TerisW*dot2[9:5] + XStart)  && x_addr < (TerisW*dot2[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot2[4:0] + YStart) && y_addr < (TerisH*dot2[4:0] + YStart + TerisH))
			NextDisplayEnReg2 <= 1'b1;
		else
			NextDisplayEnReg2 <= 1'b0;
	else
		NextDisplayEnReg2 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		NextDisplayEnReg3 <= 1'b0;
	else if(x_addr > (TerisW*dot3[9:5] + XStart)  && x_addr < (TerisW*dot3[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot3[4:0] + YStart) && y_addr < (TerisH*dot3[4:0] + YStart + TerisH))
			NextDisplayEnReg3 <= 1'b1;
		else
			NextDisplayEnReg3 <= 1'b0;
	else
		NextDisplayEnReg3 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		NextDisplayEnReg4 <= 1'b0;
	else if(x_addr > (TerisW*dot4[9:5] + XStart)  && x_addr < (TerisW*dot4[9:5] + XStart + TerisW))
		if(y_addr > (TerisH*dot4[4:0] + YStart) && y_addr < (TerisH*dot4[4:0] + YStart + TerisH))
			NextDisplayEnReg4 <= 1'b1;
		else
			NextDisplayEnReg4 <= 1'b0;
	else
		NextDisplayEnReg4 <= 1'b0;
end


endmodule 
