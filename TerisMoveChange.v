module TerisMoveChange(

	input		clk,
	input		rst,
	
	
	input		Starting,
	
	input[8:0]	x_addr,
	input[8:0]	y_addr,

	input[2:0]	Index,

	input[9:0]		NextDot1,
	input[9:0]		NextDot2,
	input[9:0]		NextDot3,
	input[9:0]		NextDot4,
	
	
	output[9:0]		CurrDot11,
	output[9:0]		CurrDot22,
	output[9:0]		CurrDot33,
	output[9:0]		CurrDot44,

	input			KeyLeft,
	input			KeyRight,
	input			KeyChange,
	
	input			UpdateEnable,
	
	input			TimeUp,
		
	output		CurrDisplayEn,
	output[23:0]	CurrDisplayData
);

reg[9:0]	CurrDot1;
reg[9:0]	CurrDot2;
reg[9:0]	CurrDot3;
reg[9:0]	CurrDot4;


assign CurrDot11 = CurrDot1;
assign CurrDot22 = CurrDot2;
assign CurrDot33 = CurrDot3;
assign CurrDot44 = CurrDot4;


reg			ChangeChart1;
reg[1:0]		ChangeChart3;
reg			ChangeChart4;
reg			ChangeChart5;
reg[1:0]		ChangeChart6;
reg[1:0]		ChangeChart7;

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart1 <= 1'b0;
	else if(Index == 'd0 && KeyChange == 1'b1)
		ChangeChart1 <= ChangeChart1 + 1'b1;
	else if(Index == 'd0 && UpdateEnable == 1'b0)
		ChangeChart1 <= ChangeChart1;
	else
		ChangeChart1 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart3 <= 1'b0;
	else if(Index == 'd2 && KeyChange == 1'b1)
		ChangeChart3 <= ChangeChart3 + 1'b1;
	else if(Index == 'd2 && UpdateEnable == 1'b0)
		ChangeChart3 <= ChangeChart3;
	else
		ChangeChart3 <= 'd0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart4 <= 1'b0;
	else if(Index == 'd3 && KeyChange == 1'b1)
		ChangeChart4 <= ChangeChart4 + 1'b1;
	else if(Index == 'd3 && UpdateEnable == 1'b0)
		ChangeChart4 <= ChangeChart4;
	else
		ChangeChart4 <= 'd0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart5 <= 1'b0;
	else if(Index == 'd4 && KeyChange == 1'b1)
		ChangeChart5 <= ChangeChart5 + 1'b1;
	else if(Index == 'd4 && UpdateEnable == 1'b0)
		ChangeChart5 <= ChangeChart5;
	else
		ChangeChart5 <= 'd0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart6 <= 1'b0;
	else if(Index == 'd5 && KeyChange == 1'b1)
		ChangeChart6 <= ChangeChart6 + 1'b1;
	else if(Index == 'd5 && UpdateEnable == 1'b0)
		ChangeChart6 <= ChangeChart6;
	else
		ChangeChart6 <= 'd0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		ChangeChart7 <= 1'b0;
	else if(Index == 'd6 && KeyChange == 1'b1)
		ChangeChart7 <= ChangeChart7 + 1'b1;
	else if(Index == 'd6 && UpdateEnable == 1'b0)
		ChangeChart7 <= ChangeChart7;
	else
		ChangeChart7 <= 'd0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDot1 <= 'd0;
	else if(Starting == 1'b0)
		CurrDot1 <= NextDot1;
	else if(UpdateEnable == 1'b1) 
		CurrDot1 <= NextDot1;
	else if(TimeUp == 1'b1)
		CurrDot1[4:0] <= CurrDot1[4:0] + 1'b1;	
	else if(KeyLeft == 1'b1)   
		if(CurrDot1[9:5] == 'd0 || CurrDot2[9:5] == 'd0 || CurrDot3[9:5] == 'd0 || CurrDot4[9:5] == 'd0)
			CurrDot1[9:5] <= CurrDot1[9:5];
		else
			CurrDot1[9:5] <= CurrDot1[9:5] - 1'b1;
	else if(KeyRight == 1'b1)  
		if(CurrDot1[9:5] == 'd9 || CurrDot2[9:5] == 'd9 || CurrDot3[9:5] == 'd9 || CurrDot4[9:5] == 'd9)
			CurrDot1[9:5] <= CurrDot1[9:5];
		else
			CurrDot1[9:5] <= CurrDot1[9:5] + 1'b1;
	else if(KeyChange == 1'b1)
		if(Index == 'd0)
		begin
			if(ChangeChart1 == 1'b0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd2;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd2;
			end
			else
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd2;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd2;
			end
		end
		else if(Index == 'd2)
		begin
			if(ChangeChart3 == 'd0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else if(ChangeChart3 == 'd1)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;		
			end
			else if(ChangeChart3 == 'd2)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;		
			end
			else
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;		
			end
		end
		else if(Index == 'd3)
		begin
			if(ChangeChart4 == 'd0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
			else
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
		end
		else if(Index == 'd4)
		begin
			if(ChangeChart5 == 'd0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
		end
		else if(Index == 'd5)
		begin
			if(ChangeChart6 == 'd0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else if(ChangeChart6 == 'd1)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else if(ChangeChart6 == 'd2)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
			else 
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
		end
		else if(Index == 'd6)
		begin
			if(ChangeChart7 == 'd0)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else if(ChangeChart7 == 'd1)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] + 'd1;
			end
			else if(ChangeChart7 == 'd2)
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] - 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
			else 
			begin
				CurrDot1[9:5] <= CurrDot1[9:5] + 'd1;
				CurrDot1[4:0] <= CurrDot1[4:0] - 'd1;
			end
		end
	else
		CurrDot1 <= CurrDot1;
end



always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDot2 <= 'd0;
	else if(Starting == 1'b0)
		CurrDot2 <= NextDot2;
	else if(UpdateEnable == 1'b1)
		CurrDot2 <= NextDot2;
	else if(TimeUp == 1'b1)
		CurrDot2[4:0] <= CurrDot2[4:0] + 1'b1;
	else if(KeyLeft == 1'b1)
		if(CurrDot1[9:5] == 'd0 || CurrDot2[9:5] == 'd0 || CurrDot3[9:5] == 'd0 || CurrDot4[9:5] == 'd0)
			CurrDot2[9:5] <= CurrDot2[9:5];
		else
			CurrDot2[9:5] <= CurrDot2[9:5] - 1'b1;
	else if(KeyRight == 1'b1)
		if(CurrDot1[9:5] == 'd9 || CurrDot2[9:5] == 'd9 || CurrDot3[9:5] == 'd9 || CurrDot4[9:5] == 'd9)
			CurrDot2[9:5] <= CurrDot2[9:5];
		else
			CurrDot2[9:5] <= CurrDot2[9:5] + 1'b1;
	else if(KeyChange == 1'b1)
		if(Index == 'd0)
		begin
			if(ChangeChart1 == 1'b0)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] + 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd1;
			end
			else
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] - 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd1;
			end
		end
		else if(Index == 'd2)
		begin
			if(ChangeChart3 == 'd0)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] + 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd1;
			end
			else if(ChangeChart3 == 'd1)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] + 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd1;		
			end
			else if(ChangeChart3 == 'd2)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] - 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd1;		
			end
			else
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] - 'd1;
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd1;		
			end
		end
		else if(Index == 'd3)
		begin
			if(ChangeChart4 == 'd0)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5];
				CurrDot2[4:0] <= CurrDot2[4:0];
			end
			else
			begin
				CurrDot2[9:5] <= CurrDot2[9:5];
				CurrDot2[4:0] <= CurrDot2[4:0];
			end
		end
		else if(Index == 'd4)
		begin
			if(ChangeChart5 == 'd0)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5];
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd2;
			end
			else
			begin
				CurrDot2[9:5] <= CurrDot2[9:5];
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd2;
			end
		end
		else if(Index == 'd5)
		begin
			if(ChangeChart6 == 'd0)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] + 'd2;
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd2;
			end
			else if(ChangeChart6 == 'd1)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] + 'd2;
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd2;
			end
			else if(ChangeChart6 == 'd2)
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] - 'd2;
				CurrDot2[4:0] <= CurrDot2[4:0] + 'd2;
			end
			else 
			begin
				CurrDot2[9:5] <= CurrDot2[9:5] - 'd2;
				CurrDot2[4:0] <= CurrDot2[4:0] - 'd2;
			end
		end
		
	else
		CurrDot2 <= CurrDot2;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDot3 <= 'd0;
	else if(Starting == 1'b0)
		CurrDot3 <= NextDot3;
	else if(UpdateEnable == 1'b1)
		CurrDot3 <= NextDot3;
	else if(TimeUp == 1'b1)
		CurrDot3[4:0] <= CurrDot3[4:0] + 1'b1;
	else if(KeyLeft == 1'b1)
		if(CurrDot1[9:5] == 'd0 || CurrDot2[9:5] == 'd0 || CurrDot3[9:5] == 'd0 || CurrDot4[9:5] == 'd0)
			CurrDot3[9:5] <= CurrDot3[9:5];
		else
			CurrDot3[9:5] <= CurrDot3[9:5] - 1'b1;
	else if(KeyRight == 1'b1)
		if(CurrDot1[9:5] == 'd9 || CurrDot2[9:5] == 'd9 || CurrDot3[9:5] == 'd9 || CurrDot4[9:5] == 'd9)
			CurrDot3[9:5] <= CurrDot3[9:5];
		else
			CurrDot3[9:5] <= CurrDot3[9:5] + 1'b1;
	else if(KeyChange == 1'b1)
		if(Index == 'd0)
		begin
			CurrDot3[9:5] <= CurrDot3[9:5];
			CurrDot3[4:0] <= CurrDot3[4:0];
		end
		else if(Index == 'd3)
		begin
			if(ChangeChart4 == 'd0)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] - 'd1;
			end
			else
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] + 'd1;
			end
		end
		else if(Index == 'd4)
		begin
			if(ChangeChart5 == 'd0)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] - 'd1;
			end
			else
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] + 'd1;
			end
		end
		else if(Index == 'd5)
		begin
			if(ChangeChart6 == 'd0)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] - 'd1;
			end
			else if(ChangeChart6 == 'd1)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] + 'd1;
			end
			else if(ChangeChart6 == 'd2)
			begin
				CurrDot3[9:5] <= CurrDot2[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot2[4:0] + 'd1;
			end
			else 
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] - 'd1;
			end
		end
		else if(Index == 'd6)
		begin
			if(ChangeChart7 == 'd0)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] + 'd1;
			end
			else if(ChangeChart7 == 'd1)
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] - 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] - 'd1;
			end
			else if(ChangeChart7 == 'd2)
			begin
				CurrDot3[9:5] <= CurrDot2[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot2[4:0] - 'd1;
			end
			else 
			begin
				CurrDot3[9:5] <= CurrDot3[9:5] + 'd1;
				CurrDot3[4:0] <= CurrDot3[4:0] + 'd1;
			end
		end
		
	else
		CurrDot3 <= CurrDot3;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		CurrDot4 <= 'd0;
	else if(Starting == 1'b0)
		CurrDot4 <= NextDot4;
	else if(UpdateEnable == 1'b1)
		CurrDot4 <= NextDot4;
	else if(TimeUp == 1'b1)
		CurrDot4[4:0] <= CurrDot4[4:0] + 1'b1;
	else if(KeyLeft == 1'b1)
		if(CurrDot1[9:5] == 'd0 || CurrDot2[9:5] == 'd0 || CurrDot3[9:5] == 'd0 || CurrDot4[9:5] == 'd0)
			CurrDot4[9:5] <= CurrDot4[9:5];
		else
			CurrDot4[9:5] <= CurrDot4[9:5] - 1'b1;
	else if(KeyRight == 1'b1)
		if(CurrDot1[9:5] == 'd9 || CurrDot2[9:5] == 'd9 || CurrDot3[9:5] == 'd9 || CurrDot4[9:5] == 'd9)
			CurrDot4[9:5] <= CurrDot4[9:5];
		else
			CurrDot4[9:5] <= CurrDot4[9:5] + 1'b1;
	else if(KeyChange == 1'b1)
		if(Index == 'd0)
		begin
			if(ChangeChart1 == 1'b0)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] - 'd1;
			end
			else
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] + 'd1;
			end
		end
		else if(Index == 'd2)
		begin
			if(ChangeChart3 == 'd0)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] + 'd1;
			end
			else if(ChangeChart3 == 'd1)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] - 'd1;		
			end
			else if(ChangeChart3 == 'd2)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] - 'd1;		
			end
			else
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd1;
				CurrDot4[4:0] <= CurrDot4[4:0] + 'd1;		
			end
		end
		else if(Index == 'd3)
		begin
			if(ChangeChart4 == 'd0)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0];
			end
			else
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0];
			end
		end
		else if(Index == 'd4)
		begin
			if(ChangeChart5 == 'd0)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5];
				CurrDot4[4:0] <= CurrDot4[4:0];
			end
			else
			begin
				CurrDot4[9:5] <= CurrDot4[9:5];
				CurrDot4[4:0] <= CurrDot4[4:0];
			end
		end
		else if(Index == 'd6)
		begin
			if(ChangeChart7 == 'd0)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0] + 'd2;
			end
			else if(ChangeChart7 == 'd1)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] - 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0] - 'd2;
			end
			else if(ChangeChart7 == 'd2)
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0] - 'd2;
			end
			else 
			begin
				CurrDot4[9:5] <= CurrDot4[9:5] + 'd2;
				CurrDot4[4:0] <= CurrDot4[4:0] + 'd2;
			end
		end	
		
	else
		CurrDot4 <= CurrDot4;
end



TerisCurrChartDisplay  TerisCurrChartDisplay_HP(
	
	.clk			(clk),
	.rst			(rst),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	.dot1			(CurrDot1),
	.dot2			(CurrDot2),
	.dot3			(CurrDot3),
	.dot4			(CurrDot4),

	.CurrDisplayEn	(CurrDisplayEn),
	.CurrDisplayData	(CurrDisplayData)
);


endmodule 
