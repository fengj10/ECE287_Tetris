module TerisNextChart(

	input			clk,
	input			rst,
	
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	input			UpdateEnable,
				
	
	output		NextDisplayEn,
	output[23:0]	NextDisplayData,
	
	output[2:0]		CurrIndex,
	
	output[9:0]	NextDot1,
	output[9:0]	NextDot2,
	output[9:0]	NextDot3,
	output[9:0]	NextDot4	
);


wire[2:0]	Index;




reg[9:0] dot1;
reg[9:0] dot2;
reg[9:0] dot3;
reg[9:0] dot4;


reg[2:0]	CurrIndexReg;


assign CurrIndex = CurrIndexReg;

assign    NextDot1 = dot1;
assign    NextDot2 = dot2;
assign    NextDot3 = dot3;
assign    NextDot4 = dot4;



always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrIndexReg <= 'd0;
	else if(UpdateEnable == 1'b1)
		CurrIndexReg <= Index;
	else
		CurrIndexReg <= CurrIndexReg;


end



always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		dot1 <= 'd0;
	else if(Index == 'd0)
		dot1 <= {5'd5,5'd0};
	else if(Index == 'd1)
		dot1 <= {5'd5,5'd0};
	else if(Index == 'd2)
		dot1 <= {5'd5,5'd0};
	else if(Index == 'd3)
		dot1 <= {5'd4,5'd0};
	else if(Index == 'd4)
		dot1 <= {5'd5,5'd0};
	else if(Index == 'd5)
		dot1 <= {5'd6,5'd0};
	else if(Index == 'd6)
		dot1 <= {5'd4,5'd0};
	else
		dot1 <= {5'd5,5'd0};
		
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		dot2 <= 'd0;
	else if(Index == 'd0)
		dot2 <= {5'd5,5'd1};
	else if(Index == 'd1)
		dot2 <= {5'd6,5'd0};
	else if(Index == 'd2)
		dot2 <= {5'd4,5'd1};
	else if(Index == 'd3)
		dot2 <= {5'd5,5'd0};
	else if(Index == 'd4)
		dot2 <= {5'd6,5'd0};
	else if(Index == 'd5)
		dot2 <= {5'd4,5'd1};
	else if(Index == 'd6)
		dot2 <= {5'd4,5'd1};
	else
		dot2 <= {5'd5,5'd1};
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		dot3 <= 'd0;
	else if(Index == 'd0)
		dot3 <= {5'd5,5'd2};
	else if(Index == 'd1)
		dot3 <= {5'd5,5'd1};
	else if(Index == 'd2)
		dot3 <= {5'd5,5'd1};
	else if(Index == 'd3)
		dot3 <= {5'd5,5'd1};
	else if(Index == 'd4)
		dot3 <= {5'd4,5'd1};
	else if(Index == 'd5)
		dot3 <= {5'd5,5'd1};
	else if(Index == 'd6)
		dot3 <= {5'd5,5'd1};
	else
		dot3 <= {5'd5,5'd2};
	
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		dot4 <= 'd0;
	else if(Index == 'd0)
		dot4 <= {5'd5,5'd3};
	else if(Index == 'd1)
		dot4 <= {5'd6,5'd1};
	else if(Index == 'd2)
		dot4 <= {5'd6,5'd1};
	else if(Index == 'd3)
		dot4 <= {5'd6,5'd1};
	else if(Index == 'd4)
		dot4 <= {5'd5,5'd1};
	else if(Index == 'd5)
		dot4 <= {5'd6,5'd1};
	else if(Index == 'd6)
		dot4 <= {5'd6,5'd1};
	else
		dot4 <= {5'd5,5'd3};
end











TerisNextIndex TerisNextIndex_HP(

	.clk		(clk),
	.rst		(rst),
	
	.seed		('d134),
	.IndexEn	(UpdateEnable),
	
	.Index	(Index)
);


TerisNextCharDisplay  TerisNextCharDisplay_HP(

	.clk			(clk),
	.rst			(rst),
	
	

	.x_addr		(x_addr),
	.y_addr		(y_addr),


	

	.dot1			(dot1),
	.dot2			(dot2),
	.dot3			(dot3),
	.dot4			(dot4),
	
	

	.NextDisplayEn	(NextDisplayEn),
	.NextDisplayData	(NextDisplayData)
	
);


endmodule 
