module TerisStartUpDelay(

	input		clk,
	input		rst,
	output		Starting
);

localparam		DelayTime = 'd2500_0;


reg[19:0]	timecount;

assign Starting = (timecount == DelayTime) ? 1'b1 : 1'b0;

always@(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
		timecount <= 'd0;
	else if(timecount < DelayTime)
		timecount <= timecount + 1'b1;
	else
		timecount <= timecount;
end



endmodule 
