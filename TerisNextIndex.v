module TerisNextIndex(

	input		clk,
	input		rst,
	
	
	input[9:0]	seed,
	input		IndexEn,
	
	
	output[2:0]	Index

);

reg[9:0] rand;


assign Index = rand % 3'd7;


always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		rand <= seed;
	else if(IndexEn)
	begin
	rand[0] <= rand[9];
	rand[1] <= rand[0];
	rand[2] <= rand[1] ^ rand[9] ;
	rand[3] <= rand[2] ^ rand[9];
	rand[4] <= rand[3] ^ rand[9];
	rand[5] <= rand[4];
	rand[6] <= rand[5];
	rand[7] <= rand[6];
	rand[8] <= rand[7]^ rand[9];
	rand[9] <= rand[8];
	end
	else
		rand <= rand;
end


endmodule