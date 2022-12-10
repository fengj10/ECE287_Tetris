module TerisMapDisplay(
	
	input			clk,
	input			rst,
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	
	input[9:0]		Row1,
	input[9:0]		Row2,
	input[9:0]		Row3,
	input[9:0]		Row4,
	input[9:0]		Row5,
	input[9:0]		Row6,
	input[9:0]		Row7,
	input[9:0]		Row8,
	input[9:0]		Row9,
	input[9:0]		Row10,
	input[9:0]		Row11,
	input[9:0]		Row12,
	input[9:0]		Row13,
	input[9:0]		Row14,
	input[9:0]		Row15,
	input[9:0]		Row16,
	input[9:0]		Row17,
	input[9:0]		Row18,
	input[9:0]		Row19,
	input[9:0]		Row20,
	
	output		MapDisplayEn,
	output[23:0]	MapDisplayData
);

localparam	TerisW	=	'd10;
localparam	TerisH	=	'd10;

localparam	XStart	=	'd90;
localparam	YStart	=	'd30;




reg	MapDisplayEnReg1;
reg	MapDisplayEnReg2;
reg	MapDisplayEnReg3;
reg	MapDisplayEnReg4;
reg	MapDisplayEnReg5;
reg	MapDisplayEnReg6;
reg	MapDisplayEnReg7;
reg	MapDisplayEnReg8;
reg	MapDisplayEnReg9;
reg	MapDisplayEnReg10;
reg	MapDisplayEnReg11;
reg	MapDisplayEnReg12;
reg	MapDisplayEnReg13;
reg	MapDisplayEnReg14;
reg	MapDisplayEnReg15;
reg	MapDisplayEnReg16;
reg	MapDisplayEnReg17;
reg	MapDisplayEnReg18;
reg	MapDisplayEnReg19;
reg	MapDisplayEnReg20;

wire  MapDisplayEnReg1_5;
wire  MapDisplayEnReg6_10;
wire  MapDisplayEnReg11_15;
wire  MapDisplayEnReg16_20;



wire	DisplayValid;

assign MapDisplayEnReg1_5 = MapDisplayEnReg1 || MapDisplayEnReg2 || MapDisplayEnReg3|| MapDisplayEnReg4 || MapDisplayEnReg5;
assign MapDisplayEnReg6_10 = MapDisplayEnReg6 || MapDisplayEnReg7 || MapDisplayEnReg8|| MapDisplayEnReg9 || MapDisplayEnReg10;
assign MapDisplayEnReg11_15 = MapDisplayEnReg11 || MapDisplayEnReg12 || MapDisplayEnReg13|| MapDisplayEnReg14 || MapDisplayEnReg15;
assign MapDisplayEnReg16_20 = MapDisplayEnReg16 || MapDisplayEnReg17 || MapDisplayEnReg18|| MapDisplayEnReg19 || MapDisplayEnReg20;

assign MapDisplayEn = MapDisplayEnReg1_5 || MapDisplayEnReg6_10 || MapDisplayEnReg11_15 || MapDisplayEnReg16_20;
assign MapDisplayData = 24'h55AABB;


assign DisplayValid = (x_addr >= XStart && x_addr <= XStart + TerisW*10) ? 1'b1 : 1'b0;

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg1 <= 1'b0;
	
	else if(Row1[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg1 <= 1'b0;
		else if(y_addr > YStart && y_addr < YStart + TerisH)
			MapDisplayEnReg1 <= 1'b1;
		else
			MapDisplayEnReg1 <= 1'b0;
	else
		MapDisplayEnReg1 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg2 <= 1'b0;
	
	else if(Row2[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg2 <= 1'b0;
		else if(y_addr > YStart + TerisH && y_addr < YStart + TerisH*2)
			MapDisplayEnReg2 <= 1'b1;
		else
			MapDisplayEnReg2 <= 1'b0;
	else
		MapDisplayEnReg2 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg3 <= 1'b0;
	
	else if(Row3[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg3 <= 1'b0;
		else if(y_addr > YStart + TerisH*2 && y_addr < YStart + TerisH*3)
			MapDisplayEnReg3 <= 1'b1;
		else
			MapDisplayEnReg3 <= 1'b0;
	else
		MapDisplayEnReg3 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg4 <= 1'b0;
	
	else if(Row4[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg4 <= 1'b0;
		else if(y_addr > YStart + TerisH*3 && y_addr < YStart + TerisH*4)
			MapDisplayEnReg4 <= 1'b1;
		else
			MapDisplayEnReg4 <= 1'b0;
	else
		MapDisplayEnReg4 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg5 <= 1'b0;
	
	else if(Row5[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg5 <= 1'b0;
			
		else if(y_addr > YStart + TerisH*4 && y_addr < YStart + TerisH*5)
			MapDisplayEnReg5 <= 1'b1;
		else
			MapDisplayEnReg5 <= 1'b0;
	else
		MapDisplayEnReg5 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg6 <= 1'b0;
	
	else if(Row6[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg6 <= 1'b0;
		else if(y_addr > YStart + TerisH*5 && y_addr < YStart + TerisH*6)
			MapDisplayEnReg6 <= 1'b1;
		else
			MapDisplayEnReg6 <= 1'b0;
	else
		MapDisplayEnReg6 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg7 <= 1'b0;
	
	else if(Row7[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg7 <= 1'b0;
		else if(y_addr > YStart + TerisH*6 && y_addr < YStart + TerisH*7)
			MapDisplayEnReg7 <= 1'b1;
		else
			MapDisplayEnReg7 <= 1'b0;
	else
		MapDisplayEnReg7 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg8 <= 1'b0;
	
	else if(Row8[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg8 <= 1'b0;
		else if(y_addr > YStart + TerisH*7 && y_addr < YStart + TerisH*8)
			MapDisplayEnReg8 <= 1'b1;
		else
			MapDisplayEnReg8 <= 1'b0;
	else
		MapDisplayEnReg8 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg9 <= 1'b0;
	
	else if(Row9[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg9 <= 1'b0;
			
		else if(y_addr > YStart + TerisH*8 && y_addr < YStart + TerisH*9)
			MapDisplayEnReg9 <= 1'b1;
		else
			MapDisplayEnReg9 <= 1'b0;
	else
		MapDisplayEnReg9 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg10 <= 1'b0;
	
	else if(Row10[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg10 <= 1'b0;
			
		else if(y_addr > YStart + TerisH*9 && y_addr < YStart + TerisH*10)
			MapDisplayEnReg10 <= 1'b1;
		else
			MapDisplayEnReg10 <= 1'b0;
	else
		MapDisplayEnReg10 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg11 <= 1'b0;
	
	else if(Row11[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg11 <= 1'b0;
		else if(y_addr > YStart + TerisH*10 && y_addr < YStart + TerisH*11)
			MapDisplayEnReg11 <= 1'b1;
		else
			MapDisplayEnReg11 <= 1'b0;
	else
		MapDisplayEnReg11 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg12 <= 1'b0;
	
	else if(Row12[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg12 <= 1'b0;
		else if(y_addr > YStart + TerisH*11 && y_addr < YStart + TerisH*12)
			MapDisplayEnReg12 <= 1'b1;
		else
			MapDisplayEnReg12 <= 1'b0;
	else
		MapDisplayEnReg12 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg13 <= 1'b0;
	
	else if(Row13[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg13 <= 1'b0;
		else if(y_addr > YStart + TerisH*12 && y_addr < YStart + TerisH*13)
			MapDisplayEnReg13 <= 1'b1;
		else
			MapDisplayEnReg13 <= 1'b0;
	else
		MapDisplayEnReg13 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg14 <= 1'b0;
	
	else if(Row14[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg14 <= 1'b0;
			
		else if(y_addr > YStart + TerisH*13 && y_addr < YStart + TerisH*14)
			MapDisplayEnReg14 <= 1'b1;
		else
			MapDisplayEnReg14 <= 1'b0;
	else
		MapDisplayEnReg14 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg15 <= 1'b0;
	
	else if(Row15[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg15 <= 1'b0;
		else if(y_addr > YStart + TerisH*14 && y_addr < YStart + TerisH*15)
			MapDisplayEnReg15 <= 1'b1;
		else
			MapDisplayEnReg15 <= 1'b0;
	else
		MapDisplayEnReg15 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg16 <= 1'b0;
	
	else if(Row16[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg16 <= 1'b0;
		else if(y_addr > YStart + TerisH*15 && y_addr < YStart + TerisH*16)
			MapDisplayEnReg16 <= 1'b1;
		else
			MapDisplayEnReg16 <= 1'b0;
	else
		MapDisplayEnReg16 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg17 <= 1'b0;
	
	else if(Row17[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg17 <= 1'b0;
		else if(y_addr > YStart + TerisH*16 && y_addr < YStart + TerisH*17)
			MapDisplayEnReg17 <= 1'b1;
		else
			MapDisplayEnReg17 <= 1'b0;
	else
		MapDisplayEnReg17 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg18 <= 1'b0;
	
	else if(Row18[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg18 <= 1'b0;
		else if(y_addr > YStart + TerisH*17 && y_addr < YStart + TerisH*18)
			MapDisplayEnReg18 <= 1'b1;
		else
			MapDisplayEnReg18 <= 1'b0;
	else
		MapDisplayEnReg18 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg19 <= 1'b0;
	
	else if(Row19[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg19 <= 1'b0;
		else if(y_addr > YStart + TerisH*18 && y_addr < YStart + TerisH*19)
			MapDisplayEnReg19 <= 1'b1;
		else
			MapDisplayEnReg19 <= 1'b0;
	else
		MapDisplayEnReg19 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		MapDisplayEnReg20 <= 1'b0;
	else if(Row20[(x_addr - 'd90)/10] == 1'b1 && DisplayValid == 1'b1)
		if(x_addr%TerisW == 'd0)
			MapDisplayEnReg20 <= 1'b0;
		else if(y_addr > YStart + TerisH*19 && y_addr < YStart + TerisH*20)
			MapDisplayEnReg20 <= 1'b1;
		else
			MapDisplayEnReg20 <= 1'b0;
	else
		MapDisplayEnReg20 <= 1'b0;
end

endmodule 