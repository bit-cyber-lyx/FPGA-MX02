module uart_tx
(
input					clk,			//系统时钟
input					rst_n,		//系统复位，低有效
output	reg				bps_en,			//发送时钟使能
input					bps_clk,		//发送时钟输入
input					tx_en,          //发送使能脉冲
input			[7:0]	tx_data,		//需要发出的数据
output	reg				rs232_tx		//UART发送输出
);
 
reg				[3:0]	num;
reg				[10:0]	tx_data_r;	
//根据接收数据的完成，驱动发送数据操作
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		bps_en <= 1'b0;
		tx_data_r <= 11'd0;
	end else if(tx_en)begin	
		bps_en <= 1'b1;						//当检测到接收时钟使能信号的下降沿，表明接收完成，需要发送数据，使能发送时钟使能信号
		tx_data_r <= {1'b1,1'b1,tx_data,1'b0};	
	end else if(num==4'd11) begin	
		bps_en <= 1'b0;	//一次UART发送需要10个时钟信号，然后结束
	end
end
 
//当处于工作状态中时，按照发送时钟的节拍发送数据
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		num <= 1'b0;
		rs232_tx <= 1'b1;
	end else if(bps_en) begin
		if(bps_clk) begin
			num <= num + 1'b1;
			rs232_tx <= tx_data_r[num];
		end else if(num==4'd11) 
			num <= 4'd0;	
	end
end
 
endmodule