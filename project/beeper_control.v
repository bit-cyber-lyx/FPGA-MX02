module beeper_control(
	input                   clk	        , //12M
	input                   rst_n       ,
    input                   en          ,
    input                   rx_done     , //接收数据完成标志,一个时钟脉冲
    input           [9:0]   data_length ,
    input           [959:0] data_buffer ,
    output                  piano_out   ,
    output                  play_done
);

reg		[23:0]		cnt;
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        cnt <= 24'd0;
    else if(cnt == 24'd3999999)
        cnt <= 24'd0;
    else
        cnt <= cnt + 1'b1;
        

reg [9:0]           data_length_reg;
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        data_length_reg <= 10'd0;
    else if ( rx_done )
        data_length_reg <= data_length;
    else if ( data_length_reg && cnt == 24'd3999999)
        data_length_reg <= data_length_reg - 1'b1;

reg [959:0]           data_buffer_reg;
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        data_buffer_reg <= 960'd0;
    else if ( rx_done )
        data_buffer_reg <= data_buffer;
    else if ( data_length_reg && cnt == 24'd3999999) begin
        data_buffer_reg <= data_buffer_reg>>8;
    end
        

wire [4:0]          tone;

assign tone = data_buffer_reg[4:0];

wire                play_en;
assign play_en = (data_length_reg == 10'd0)?1'b0:1'b1;

Beeper Beeper_inst(
    .clk            (clk            ),		//系统时钟
    .rst_n          (rst_n          ),	    //系统复位，低有效
    .tone_en        (play_en        ),	    //蜂鸣器使能信号
    .tone           (tone           ),		//蜂鸣器音节控制
    .piano_out      (piano_out      )	    //蜂鸣器控制输出
);

assign play_done = ( data_length_reg == 10'd1 && en)?1'b1:1'b0;

endmodule