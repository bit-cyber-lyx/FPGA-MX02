module Beeper
(
input					clk,		//系统时钟
input					rst_n,	//系统复位，低有效
input					tone_en,	//蜂鸣器使能信号
input			[4:0]	tone,		//蜂鸣器音节控制
output	reg				piano_out	//蜂鸣器控制输出
);

reg [15:0] time_end;

always@(tone) begin
	case(tone)
		5'd1:	time_end =	16'd22935;	//L1,
		5'd2:	time_end =	16'd20428;	//L2,
		5'd3:	time_end =	16'd18203;	//L3,
		5'd4:	time_end =	16'd17181;	//L4,
		5'd5:	time_end =	16'd15305;	//L5,
		5'd6:	time_end =	16'd13635;	//L6,
		5'd7:	time_end =	16'd12147;	//L7,
		5'd8:	time_end =	16'd11464;	//M1,
		5'd9:	time_end =	16'd10215;	//M2,
		5'd10:	time_end =	16'd9100;	//M3,
		5'd11:	time_end =	16'd8589;	//M4,
		5'd12:	time_end =	16'd7652;	//M5,
		5'd13:	time_end =	16'd6817;	//M6,
		5'd14:	time_end =	16'd6073;	//M7,
		5'd15:	time_end =	16'd5740;	//H1,
		5'd16:	time_end =	16'd5107;	//H2,
		5'd17:	time_end =	16'd4549;	//H3,
		5'd18:	time_end =	16'd4294;	//H4,
		5'd19:	time_end =	16'd3825;	//H5,
		5'd20:	time_end =	16'd3408;	//H6,
		5'd21:	time_end =	16'd3036;	//H7,
		default:time_end =	16'd65535;	
	endcase
end
 
reg [17:0] time_cnt;
//当蜂鸣器使能时，计数器按照计数终值（分频系数）计数
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		time_cnt <= 1'b0;
	end else if(!tone_en) begin
		time_cnt <= 1'b0;
	end else if(time_cnt>=time_end) begin
		time_cnt <= 1'b0;
	end else begin
		time_cnt <= time_cnt + 1'b1;
	end
end
 
//根据计数器的周期，翻转蜂鸣器控制信号
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		piano_out <= 1'b0;
	end else if(time_cnt==time_end && ~(tone==5'd0)) begin
		piano_out <= ~piano_out;
	end else begin
		piano_out <= piano_out;
	end
end
 
endmodule