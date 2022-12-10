module TetrisTop(
	
	input			clk,
	input			rst,
	
	input			KeyLeft,
	input			KeyRight,
	input			KeyChange,

	input[8:0]		x_addr,
	input[8:0]		y_addr,

	output[23:0]	odata
);


wire		Wall;
wire[23:0]	WallData;


wire		NextDisplayEn;
wire[23:0]  NextDisplayData;



wire		UpdateEnable;


wire[9:0]	NextDot1;
wire[9:0]	NextDot2;
wire[9:0]	NextDot3;
wire[9:0]	NextDot4;


wire		CurrDisplayEn;
wire[23:0]	CurrDisplayData;


wire		MapDisplayEn;
wire[23:0]	MapDisplayData;



wire[2:0]	Index;


TerisWall  TerisWall_HP(
	
	.clk			(clk),
	.rst			(rst),
	

	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	.Wall			(Wall),
	.WallData		(WallData)
);










TerisNextChart TerisNextChart_HP(

	.clk			(clk),
	.rst			(rst),
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	.UpdateEnable	(UpdateEnable),
	
	.NextDisplayEn	(NextDisplayEn),
	.NextDisplayData  (NextDisplayData),
	
	.CurrIndex		(Index),
	
	.NextDot1		(NextDot1),
	.NextDot2		(NextDot2),
	.NextDot3		(NextDot3),
	.NextDot4		(NextDot4)			
);


TerisDisplay  TerisDisplay_HP(
	
	.clk			(clk),
	.rst			(rst),
	
	
	.Wall			(Wall),
	.WallData		(WallData),
	
	.NextDisplayEn	(NextDisplayEn),
	.NextDisplayData	(NextDisplayData),
	
	.CurrDisplayEn	(CurrDisplayEn),
	.CurrDisplayData	(CurrDisplayData),
	
	.MapDisplayEn	(MapDisplayEn),
	.MapDisplayData	(MapDisplayData),
	
	
	.odata		(odata)
);

TerisGaming TerisGaming_HP(
	
	.clk			(clk),
	.rst			(rst),
	
	
	.KeyLeft		(KeyLeft),
	.KeyRight		(KeyRight),
	.KeyChange		(KeyChange),
	
	
	.x_addr		(x_addr),
	.y_addr		(y_addr),
	
	.Index		(Index),
	
	.NextDot1		(NextDot1),
	.NextDot2		(NextDot2),
	.NextDot3		(NextDot3),
	.NextDot4		(NextDot4),
	
	
	.UpdateEnable	(UpdateEnable),

	
	.MapDisplayEn	(MapDisplayEn),
	.MapDisplayData	(MapDisplayData),
	
	.CurrDisplayEn	(CurrDisplayEn),
	.CurrDisplayData	(CurrDisplayData)
);


endmodule 
