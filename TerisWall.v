module TerisWall(
	
	input			clk,
	input			rst,
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	output		Wall,
	output[23:0] 	WallData
);

localparam	TerisW	= 	'd10;
localparam	TerisH	=	'd10;


localparam	StartX	=	'd20;
localparam	StartY 	=	'd20;


localparam	XNum		=	'd180;  //10 * 18;
localparam  YNum		=	'd220;  //10 * 22;


reg	WallReg;


assign Wall     =  WallReg;
assign WallData =  24'hFF0000;


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		WallReg <= 1'b0;
	else if(y_addr >= StartY && y_addr < StartY + TerisH)
		if(x_addr%TerisW == 'd0)    //the aim is generate gap
			WallReg <= 1'b0;
		else if(x_addr > StartX && x_addr < StartX + XNum)
			WallReg <= 1'b1;
		else
			WallReg <= 1'b0;
	else if(y_addr > (StartY + YNum - TerisH) && y_addr < (StartY + YNum))
		if(x_addr%TerisW == 'd0)
			WallReg <= 1'b0;
		else if(x_addr > StartX && x_addr < StartX + XNum)
			WallReg <= 1'b1;
		else
			WallReg <= 1'b0;
	else if(y_addr > StartY + TerisH && y_addr < (StartY + YNum - TerisH))
		if(y_addr%TerisH == 'd0)
			WallReg <= 1'b0;
		else if(x_addr > StartX + TerisW*4'd6  && x_addr < StartX + TerisW*4'd7)
			WallReg <= 1'b1;
		else if(x_addr > StartX && x_addr < StartX + TerisW)
			WallReg <= 1'b1;
		else if(x_addr > (StartX + XNum -TerisW) && x_addr < StartX + XNum)
			WallReg <= 1'b1;
		else
			WallReg <= 1'b0;
	else
		WallReg <= 1'b0;	
end


endmodule 
