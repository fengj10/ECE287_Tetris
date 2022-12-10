module main(

	input			clk,
	input			rst,

	output			VGA_CLK,
	output			VGA_EN,
	output			H_SYNC,
	output			V_SYNC,
	output [23:0]		VGA_Data,
	
	
	input			KeyLeft,
	input			KeyRight,
	input			KeyChange
);

wire vga_clk;


wire[8:0]	x_addr;
wire[8:0]	y_addr;
wire[23:0]	data;



wire    LeftDown;
wire    RightDown;
wire    ChangeDown;


clk_gen_module clks(
	
	.clk_in 		(clk),
	.clk_25MHz		(vga_clk)
);




TetrisTop    TetrisTop_HP(
	
	.clk		(vga_clk),
	.rst		(rst),

	.KeyLeft	(LeftDown),
	.KeyRight	(RightDown),
	.KeyChange	(ChangeDown),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	.odata		(data)
);




VGA_Driver   VGA_Driver_HP(

	.clk			(clk),
	.vga_clk		(vga_clk),
	.rst			(rst),
	
	.x_addr			(x_addr),		
	.y_addr			(y_addr),		
	
	.idata			(data),

	.VGA_CLK		(VGA_CLK),		
	.VGA_EN			(VGA_EN),
	.H_SYNC			(H_SYNC),		
	.V_SYNC			(V_SYNC),		
	.VGA_Data		(VGA_Data) 		
);



btn_dis_shake_HP1(
			
			.clk		(vga_clk),
			.rst_n		(rst),
			
			
			.ikey		(KeyLeft),				
			.okey		(LeftDown)			
);

btn_dis_shake_HP2(
			
			.clk		(vga_clk),
			.rst_n		(rst),
			
			
			.ikey		(KeyRight),				
			.okey		(RightDown)			
);


btn_dis_shake_HP3(
			
			.clk		(vga_clk),
			.rst_n		(rst),
			
			
			.ikey		(KeyChange),				
			.okey		(ChangeDown)			
);


endmodule 
