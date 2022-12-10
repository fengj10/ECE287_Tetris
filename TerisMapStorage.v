module TerisMapStorage(
	
	input			clk,
	input			rst,
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	input[9:0]		CurrDot1,
	input[9:0]		CurrDot2,
	input[9:0]		CurrDot3,
	input[9:0]		CurrDot4,
	
	input			TimeUp,
	
	output		UpdateEnable,
	
	
	output		MapDisplayEn,
	output[23:0]	MapDisplayData
);


reg[9:0] Row[19:0];




reg		UpdateEnableReg1;
reg		UpdateEnableReg2;
reg		UpdateEnableReg3;
reg		UpdateEnableReg4;


reg[9:0]	CurrDotReg1;
reg[9:0]	CurrDotReg2;
reg[9:0]	CurrDotReg3;
reg[9:0]	CurrDotReg4;


assign UpdateEnable = (UpdateEnableReg1 || UpdateEnableReg2 || UpdateEnableReg3 || UpdateEnableReg4);


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		Row[0] <= 'd0;
		Row[1] <= 'd0;
		Row[2] <= 'd0;
		Row[3] <= 'd0;
		Row[4] <= 'd0;
		Row[5] <= 'd0;
		Row[6] <= 'd0;
		Row[7] <= 'd0;
		Row[8] <= 'd0;
		Row[9] <= 'd0;
		Row[10] <= 'd0;
		Row[11] <= 'd0;
		Row[12] <= 'd0;
		Row[13] <= 'd0;
		Row[14] <= 'd0;
		Row[15] <= 'd0;
		Row[16] <= 'd0;
		Row[17] <= 'd0;
		Row[18] <= 'd0;
		Row[19] <= 'd0;
	end
	
	else if(UpdateEnable == 1'b1) 
	begin
		Row[CurrDotReg1[4:0]][CurrDotReg1[9:5]] = 1'b1;
		Row[CurrDotReg2[4:0]][CurrDotReg2[9:5]] = 1'b1;
		Row[CurrDotReg3[4:0]][CurrDotReg3[9:5]] = 1'b1;
		Row[CurrDotReg4[4:0]][CurrDotReg4[9:5]] = 1'b1;
	end
	else if(Row[19] == 10'b1111_1111_11)
	begin
		Row[19] <= Row[18];
		Row[18] <= Row[17];
		Row[17] <= Row[16];
		Row[16] <= Row[15];
		Row[15] <= Row[14];
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[18] == 10'b1111_1111_11)
	begin
		Row[18] <= Row[17];
		Row[17] <= Row[16];
		Row[16] <= Row[15];
		Row[15] <= Row[14];
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[17] == 10'b1111_1111_11)
	begin
		Row[17] <= Row[16];
		Row[16] <= Row[15];
		Row[15] <= Row[14];
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[16] == 10'b1111_1111_11)
	begin
		Row[16] <= Row[15];
		Row[15] <= Row[14];
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[15] == 10'b1111_1111_11)
	begin
		Row[15] <= Row[14];
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[14] == 10'b1111_1111_11)
	begin
		Row[14] <= Row[13];
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[13] == 10'b1111_1111_11)
	begin
		Row[13] <= Row[12];
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[12] == 10'b1111_1111_11)
	begin
		Row[12] <= Row[11];
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[11] == 10'b1111_1111_11)
	begin
		Row[11] <= Row[10];
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[10] == 10'b1111_1111_11)
	begin
		Row[10] <= Row[9];
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[9] == 10'b1111_1111_11)
	begin
		Row[9] <= Row[8];
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[8] == 10'b1111_1111_11)
	begin
		Row[8] <= Row[7];
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[7] == 10'b1111_1111_11)
	begin
		Row[7] <= Row[6];
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[6] == 10'b1111_1111_11)
	begin
		Row[6] <= Row[5];
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[5] == 10'b1111_1111_11)
	begin
		Row[5] <= Row[4];
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else if(Row[4] == 10'b1111_1111_11)
	begin
		Row[4] <= Row[3];
		Row[3] <= Row[2];
		Row[2] <= Row[1];
		Row[1] <= Row[0];
	end
	else begin
		Row[0]  <= Row[0];
	      Row[1]  <= Row[1];
            Row[2]  <= Row[2];
            Row[3]  <= Row[3];
            Row[4]  <= Row[4];
            Row[5]  <= Row[5];
            Row[6]  <= Row[6];
            Row[7]  <= Row[7];
            Row[8]  <= Row[8];
            Row[9]  <= Row[9];
            Row[10] <= Row[10];
            Row[11] <= Row[11];
            Row[12] <= Row[12];
            Row[13] <= Row[13];
            Row[14] <= Row[14];
            Row[15] <= Row[15];
            Row[16] <= Row[16];
            Row[17] <= Row[17];
            Row[18] <= Row[18];
            Row[19] <= Row[19];
	end
end






always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		UpdateEnableReg1 <= 1'b0;
	else if(TimeUp == 1'b1)  
	begin
		if(CurrDot1[4:0] == 'd19)
	          UpdateEnableReg1 <= 1'b1;
		else if(Row[CurrDot1[4:0] + 1'b1][CurrDot1[9:5]] == 1'b1)
		    UpdateEnableReg1 <= 1'b1;
		else
	          UpdateEnableReg1 <= 1'b0;
	end
	
	else
		UpdateEnableReg1 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		UpdateEnableReg2 <= 1'b0;
	else if(TimeUp == 1'b1) 
	begin
		if(CurrDot2[4:0] == 'd19)
	          UpdateEnableReg2 <= 1'b1;
		else if(Row[CurrDot2[4:0] + 1'b1][CurrDot2[9:5]] == 1'b1)
		    UpdateEnableReg2 <= 1'b1;
		else
	          UpdateEnableReg2 <= 1'b0;
	end	
	else
		UpdateEnableReg2 <= 1'b0;
end

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		UpdateEnableReg3 <= 1'b0;
	else if(TimeUp == 1'b1)  
	begin
		if(CurrDot3[4:0] == 'd19)
	          UpdateEnableReg3 <= 1'b1;
		else if(Row[CurrDot3[4:0] + 1'b1][CurrDot3[9:5]] == 1'b1)
		    UpdateEnableReg3 <= 1'b1;
		else
	          UpdateEnableReg3 <= 1'b0;
	end
	
	else
		UpdateEnableReg3 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		UpdateEnableReg4 <= 1'b0;
	else if(TimeUp == 1'b1)  
	begin
		if(CurrDot4[4:0] == 'd19)
	          UpdateEnableReg4 <= 1'b1;
		else if(Row[CurrDot4[4:0] + 1'b1][CurrDot4[9:5]] == 1'b1)
		    UpdateEnableReg4 <= 1'b1;
		else
	          UpdateEnableReg4 <= 1'b0;
	end
	
	else
		UpdateEnableReg4 <= 1'b0;
end


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		CurrDotReg1 <= 'd0;
		CurrDotReg2 <= 'd0;
		CurrDotReg3 <= 'd0;
		CurrDotReg4 <= 'd0;
	end
	else if(TimeUp == 1'b1)
	begin
		CurrDotReg1 <= CurrDot1;
		CurrDotReg2 <= CurrDot2;
		CurrDotReg3 <= CurrDot3;
		CurrDotReg4 <= CurrDot4;
	end
	else
	begin
		CurrDotReg1 <= CurrDotReg1;
		CurrDotReg2 <= CurrDotReg2;
		CurrDotReg3 <= CurrDotReg3;
		CurrDotReg4 <= CurrDotReg4;
	end



end


TerisMapDisplay  TerisMapDisplay_HP(
	
	.clk			(clk),
	.rst			(rst),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	
	.Row1			(Row[0]),
	.Row2			(Row[1]),
	.Row3			(Row[2]),
	.Row4			(Row[3]),
	.Row5			(Row[4]),
	.Row6			(Row[5]),
	.Row7			(Row[6]),
	.Row8			(Row[7]),
	.Row9			(Row[8]),
	.Row10		(Row[9]),
	.Row11		(Row[10]),
	.Row12		(Row[11]),
	.Row13		(Row[12]),
	.Row14		(Row[13]),
	.Row15		(Row[14]),
	.Row16		(Row[15]),
	.Row17		(Row[16]),
	.Row18		(Row[17]),
	.Row19		(Row[18]),
	.Row20		(Row[19]),
	
	
	.MapDisplayEn	(MapDisplayEn),
	.MapDisplayData	(MapDisplayData)	
);


endmodule 
