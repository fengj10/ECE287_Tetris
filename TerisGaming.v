module TerisGaming(
	
	input			clk,
	input			rst,
	
	input			KeyLeft,
	input			KeyRight,
	input			KeyChange,
	
	
	input[8:0]		x_addr,
	input[8:0]		y_addr,
	
	input[2:0]		Index,
	
	input[9:0]		NextDot1,
	input[9:0]		NextDot2,
	input[9:0]		NextDot3,
	input[9:0]		NextDot4,
	
	output		UpdateEnable,
	
	
	output		MapDisplayEn,
	output[23:0]	MapDisplayData,
	
	output		CurrDisplayEn,
	output[23:0]	CurrDisplayData
);



wire	 TimeUp; 
wire   Starting;

	

wire[9:0]	CurrDot1;
wire[9:0]	CurrDot2;
wire[9:0]	CurrDot3;
wire[9:0]	CurrDot4;	
	
	
	
	
	
	
	
	
	
TerisStartUpDelay TerisStartUpDelay_HP(

	.clk			(clk),
	.rst			(rst),
	
	
	.Starting		(Starting)
);	
	


TIME	TIME_HP(
	.clk_50M			(clk),
	.rst				(rst),
	.Starting			(Starting),
	.clk_1s			(TimeUp)		
);


TerisMoveChange  TerisMoveChange_HP(

	.clk			(clk),
	.rst			(rst),
	
	
	.Starting		(Starting),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	
	.Index		(Index),	
	.NextDot1		(NextDot1),
	.NextDot2		(NextDot2),
	.NextDot3		(NextDot3),
	.NextDot4		(NextDot4),
	
	
	.CurrDot11		(CurrDot1),
	.CurrDot22		(CurrDot2),
	.CurrDot33		(CurrDot3),
	.CurrDot44		(CurrDot4),

	.KeyLeft		(KeyLeft),
	.KeyRight		(KeyRight),
	.KeyChange		(KeyChange),
	
	
	.UpdateEnable	(UpdateEnable),
	.TimeUp		(TimeUp),	
	
	
	.CurrDisplayEn	(CurrDisplayEn),
	.CurrDisplayData	(CurrDisplayData)
	
	
);


TerisMapStorage TerisMapStorage_HP(
	
	.clk			(clk),
	.rst			(rst),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	.CurrDot1		(CurrDot1),
	.CurrDot2		(CurrDot2),
	.CurrDot3		(CurrDot3),
	.CurrDot4		(CurrDot4),
	
	.TimeUp		(TimeUp),
	
	.UpdateEnable	(UpdateEnable),
	
	
	.MapDisplayEn	(MapDisplayEn),
	.MapDisplayData	(MapDisplayData)
);


endmodule 
