module time_generator(
	input                   clk	    , //12M
	input                   rst_n   ,
    input           [2:0]   control , 
    input                   en      ,
    output          [23:0]  time_out,
    output  reg             flag
);

//计数器分频产5Hz的时钟信号(设置时间)
wire				clk_5hz;
reg		[23:0]		cnt_5hz;
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_5hz <= 24'd0;
    else if(cnt_5hz == 24'd2399999)
        cnt_5hz <= 24'd0;
    else if( en )
        cnt_5hz <= cnt_5hz + 1'b1;

assign clk_5hz = (cnt_5hz == 24'd2000000)?1'b1:1'b0;

reg [2:0]           cnt;
always @ ( posedge clk or negedge rst_n )
    if (~rst_n)
        cnt <= 3'd0;
    else if ( cnt == 3'd4 && cnt_5hz == 24'd2399999)
        cnt <= 3'd0;
    else if (cnt_5hz == 24'd2399999)
        cnt <= cnt + 1'b1;

reg [7:0]           time_shi;
reg [7:0]           time_fen;
reg [7:0]           time_miao;

//time_shi
always @ ( posedge clk_5hz or negedge rst_n )
    if (~rst_n)
        time_shi <= 8'd0;
    else if( en && ((time_fen[7:4]==4'd5 && time_fen[3:0]==4'd9 && time_miao[7:4]==4'd5 && time_miao[3:0]==4'd9 && cnt == 3'd4) || ~control[2]) )begin
        if( time_shi[7:4]==4'd2 && time_shi[3:0]==4'd3 )
            time_shi <= 8'd0;
        else if ( time_shi[3:0]==4'd9 ) begin
            time_shi[7:4] <= time_shi[7:4] + 1'b1;
            time_shi[3:0] <= 4'd0;
        end
        else
            time_shi[3:0] <= time_shi[3:0] + 1'b1;
    end

//time_fen
always @ ( posedge clk_5hz or negedge rst_n )
    if (~rst_n)
        time_fen <= 8'd0;
    else if( en && ((time_miao[7:4]==4'd5 && time_miao[3:0]==4'd9  && cnt == 3'd4) || ~control[1]) )begin
        if( time_fen[7:4]==4'd5 && time_fen[3:0]==4'd9 )
            time_fen <= 8'd0;
        else if ( time_fen[3:0]==4'd9 ) begin
            time_fen[7:4] <= time_fen[7:4] + 1'b1;
            time_fen[3:0] <= 4'd0;
        end
        else
            time_fen[3:0] <= time_fen[3:0] + 1'b1;
    end

//time_miao
always @ ( posedge clk_5hz or negedge rst_n )
    if (~rst_n)
        time_miao <= 8'd0;
    else if ( en && (cnt == 3'd4 || ~control[0])) begin
        if( time_miao[7:4]==4'd5 && time_miao[3:0]==4'd9)
            time_miao <= 8'd0;
        else if ( time_miao[3:0]==4'd9 ) begin
            time_miao[7:4] <= time_miao[7:4] + 1'b1;
            time_miao[3:0] <= 4'd0;
        end
        else
            time_miao[3:0] <= time_miao[3:0] + 1'b1;
    end

assign time_out = {time_shi,time_fen,time_miao};

always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        flag <= 1'b0;
    else if ( flag == 1'b1 )
        flag <= 1'b0;
    else if (time_fen==8'd0&&time_miao==8'd0&&cnt==3'd0&&cnt_5hz == 24'd2399999)
        flag <= 1'b1;

endmodule