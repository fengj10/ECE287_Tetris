module TIME(
	
	input			        clk_50M,
	input				rst,
	input				Starting,
	
	output	reg			clk_1s
);



reg[30:0]		cnt;


localparam CNT_half_1S = 'd45_000_00;


always@(posedge clk_50M)
begin
	if(rst == 1'b0)
		cnt <= 'd0;
	else if(Starting == 1'b0)
		cnt <= 'd0;
	else if(cnt >= CNT_half_1S)
		cnt <= 'd0;
	else
		cnt <= cnt + 1'b1;
end


always@(posedge clk_50M)
begin
	if(rst == 1'b0)
		clk_1s <= 'd0;
	else if(cnt >= CNT_half_1S)
		clk_1s <= 1'b1;
	else
		clk_1s <= 1'b0;
end







endmodule 
