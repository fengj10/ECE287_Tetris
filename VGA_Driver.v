module VGA_Driver(

	input			clk,
	input			vga_clk,
	
	input			rst,
		
	
	
	output[8:0]		x_addr,		
	output[8:0]		y_addr,		
	
	
	input[23:0]		idata, 
	
	output		VGA_CLK,		
	output		VGA_EN,
	output		H_SYNC,		
	output		V_SYNC,		
	output reg[23:0]	VGA_Data		
);



//640 * 480   clk 25MHz
localparam	H_CYCLE 	=	800;
localparam	H_Display   =	640;
localparam	H_Pulse_W	=	96;
localparam	H_Back_p	=	48;
localparam	H_Front_p	=	16;

localparam	H_Value_S	=	380;  
localparam	H_Value_E	=	800; 	


localparam	V_CYCLE 	=	525;
localparam	V_Display   =	480;
localparam	V_Pulse_W	=	2;
localparam	V_Back_p	=	33;
localparam	V_Front_p	=	10;

localparam	V_Value_S	=	162;  
localparam	V_Value_E	=	525; 

reg[9:0]	H_cnt;	
reg[8:0]	V_cnt;	




assign VGA_CLK = ~vga_clk;
assign VGA_EN = 1'b1;

assign H_SYNC = (H_cnt < H_Pulse_W) ? 1'b0 : 1'b1;
assign V_SYNC = (V_cnt < V_Pulse_W) ? 1'b0 : 1'b1;


assign x_addr = (H_cnt > H_Value_S && H_cnt < H_Value_E) ? H_cnt - H_Value_S :'d0;
assign y_addr = (V_cnt > V_Value_S && V_cnt < V_Value_E) ? V_cnt - V_Value_S :'d0;


always@(posedge vga_clk or negedge rst)
begin
	if(rst == 1'b0)
		H_cnt <= 'd0;
	else if(H_cnt == H_CYCLE)
		H_cnt <= 'd0;
	else
		H_cnt	<= H_cnt + 1'b1;
end


always@(posedge vga_clk or negedge rst)
begin
	if(rst == 1'b0)
		V_cnt <= 'd0;
	else if(V_cnt == V_CYCLE - 1'b1 && H_cnt == H_CYCLE)
		V_cnt <= 'd0;
	else if(H_cnt == H_CYCLE)
		V_cnt <= V_cnt + 1'b1;
	else
		V_cnt <= V_cnt;
end



always@(posedge vga_clk or negedge rst)
begin
	if(rst == 1'b0)
		VGA_Data <= 'd0;
	else
		VGA_Data <= idata;

end


endmodule 