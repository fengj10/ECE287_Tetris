module btn_dis_shake(
			input	clk,
			input	rst_n,
			input	ikey,				
			output	okey				
);

input clk;
input rst_n;
input ikey;
output okey;

/**************************************************/

reg ikey_dly1;
reg ikey_dly2;
reg [17:0] count_debouncer;
reg okey_r;
reg okey_dly1_r;

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
       begin
         ikey_dly1 <= 1'b0;
         ikey_dly2 <= 1'b0;
       end
    else    
       begin
         ikey_dly1 <= ikey;
         ikey_dly2 <= ikey_dly1;
       end
  end

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      begin
        count_debouncer <= 18'd260_000;
	      okey_r <= 1'b0;
      end
    else if( ikey_dly2 )
      begin
        count_debouncer <= 18'd0;
	      okey_r <= 1'b0;
      end
    else if( count_debouncer == 18'd250_000 )
      begin
        okey_r <= 1'b1;
      end
    else if( count_debouncer == 18'd260_000 )
      begin
        okey_r <= 1'b0;
      end
    else
      count_debouncer <= count_debouncer + 1'b1;
  end

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      okey_dly1_r <= 1'b0;
    else
      okey_dly1_r <= okey_r;
  end
  
/**************************************************/  

assign okey = okey_r & ( ~okey_dly1_r );

/**************************************************/

endmodule
