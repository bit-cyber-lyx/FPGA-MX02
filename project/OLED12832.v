module OLED12832(
	input				    clk,		//12MHz系统时钟
	input				    rst_n,		//系统复位，低有效

    input           [23:0]   time_data,     
    input           [11:0]  tamp_data,  //温度数据{[11:4]:整数部分,[3:0]:小数部分}

	output	reg			    oled_csn,	//OLCD液晶屏使能
	output	reg			    oled_rst,	//OLCD液晶屏复位
	output	reg			    oled_dcn,	//OLCD数据指令控制
	output	reg			    oled_clk,	//OLCD时钟信号
	output	reg			    oled_dat	//OLCD数据信号
);
 
	localparam INIT_DEPTH = 6'd29; //LCD初始化的命令的数量
	localparam IDLE = 6'h1, MAIN = 6'h2, INIT = 6'h4, SCAN = 6'h8, WRITE = 6'h10, DELAY = 6'h20;
	localparam HIGH	= 1'b1, LOW = 1'b0;
	localparam DATA	= 1'b1, CMD = 1'b0;
 
	reg [7:0] cmd [28:0];
	reg [63:0] mem1 [95:0];
	reg [63:0] mem2 [23:0];
	reg	[7:0]  x_ph, x_pl;
    reg [7:0]  y_ph, y_pl;
	reg	[7:0]  char;
	reg	[7:0]  num1, num2, char_reg;
	reg	[4:0]  cnt_main, cnt_init, cnt_scan, cnt_write;
	reg	[15:0] num1_delay, cnt_delay, cnt;
	reg	[5:0]  state, state_back;
 
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			cnt_main <= 1'b0; cnt_init <= 1'b0; cnt_scan <= 5'b0; cnt_write <= 1'b0;
			x_ph <= 8'h7f; x_pl <= 8'h00;
            y_ph <= 8'h03; y_pl <= 8'h00;
			num1 <= 8'b0; num2 <= 8'b0; char <= 8'b0; char_reg <= 8'b0;
			num1_delay <= 16'd5; cnt_delay <= 1'b0; cnt <= 1'b0;
			oled_csn <= HIGH; oled_rst <= HIGH; oled_dcn <= CMD; oled_clk <= HIGH; oled_dat <= LOW;
			state <= IDLE; state_back <= IDLE;
		end else begin
			case(state)
				IDLE:begin
						cnt_main <= 1'b0; cnt_init <= 1'b0; cnt_scan <= 5'b0; cnt_write <= 1'b0;
						x_ph <= 8'h7f; x_pl <= 8'h00;
                        y_ph <= 8'h03; y_pl <= 8'h00;
						num1 <= 8'b0; num2 <= 8'b0; char <= 8'b0; char_reg <= 1'b0;
						num1_delay <= 16'd5; cnt_delay <= 1'b0; cnt <= 1'b0;
						oled_csn <= HIGH; oled_rst <= HIGH; oled_dcn <= CMD; oled_clk <= HIGH; oled_dat <= LOW;
						state <= MAIN; state_back <= MAIN;
					end
				MAIN:begin
						if(cnt_main == 5'd14) cnt_main <= 5'd1;
						else cnt_main <= cnt_main + 1'b1;
						case(cnt_main)	//MAIN状态
							5'd0:	begin state <= INIT; end

							5'd1:	begin x_ph <= 8'h7f; x_pl <= 8'h00; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= time_data[23:20]<<3;state <= SCAN; end
							5'd2:	begin x_ph <= 8'h7f; x_pl <= 8'h10; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= time_data[19:16]<<3;state <= SCAN; end
							5'd3:	begin x_ph <= 8'h7f; x_pl <= 8'h20; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= 8'd80;state <= SCAN; end
							5'd4:	begin x_ph <= 8'h7f; x_pl <= 8'h30; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= time_data[15:12]<<3;state <= SCAN; end                                                                                        
							5'd5:	begin x_ph <= 8'h7f; x_pl <= 8'h40; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= time_data[11:8]<<3;state <= SCAN; end

							5'd6:	begin x_ph <= 8'h57; x_pl <= 8'h50; y_ph <= 8'h01; y_pl <= 8'h00; num2 <= 8'd2; char <= tamp_data[11:8]<<1;state <= SCAN; end
							5'd7:	begin x_ph <= 8'h5f; x_pl <= 8'h58; y_ph <= 8'h01; y_pl <= 8'h00; num2 <= 8'd2; char <= tamp_data[7:4]<<1;state <= SCAN; end
							5'd8:	begin x_ph <= 8'h67; x_pl <= 8'h60; y_ph <= 8'h01; y_pl <= 8'h00; num2 <= 8'd2; char <= 8'd20;state <= SCAN; end
							5'd9:	begin x_ph <= 8'h6f; x_pl <= 8'h68; y_ph <= 8'h01; y_pl <= 8'h00; num2 <= 8'd2; char <= tamp_data[3:0]<<1;state <= SCAN; end
                                                                                                             
							5'd10:	begin x_ph <= 8'h57; x_pl <= 8'h50; y_ph <= 8'h03; y_pl <= 8'h02; num2 <= 8'd2; char <= 8'd22;state <= SCAN; end
							5'd11:	begin x_ph <= 8'h5f; x_pl <= 8'h58; y_ph <= 8'h03; y_pl <= 8'h02; num2 <= 8'd2; char <= time_data[7:4]<<1;state <= SCAN; end
							5'd12:	begin x_ph <= 8'h67; x_pl <= 8'h60; y_ph <= 8'h03; y_pl <= 8'h02; num2 <= 8'd2; char <= time_data[3:0]<<1;state <= SCAN; end
							5'd13:	begin x_ph <= 8'h6f; x_pl <= 8'h68; y_ph <= 8'h03; y_pl <= 8'h02; num2 <= 8'd2; char <= 8'd22;state <= SCAN; end

                            5'd14:	begin x_ph <= 8'h7f; x_pl <= 8'h70; y_ph <= 8'h03; y_pl <= 8'h00; num1 <= 8'd8; char <= 8'd88;state <= SCAN; end
							default: state <= IDLE;
						endcase
					end
				INIT:begin	//初始化状态
						case(cnt_init)
							5'd0:	begin oled_rst <= LOW; cnt_init <= cnt_init + 1'b1; end	//复位有效
							5'd1:	begin num1_delay <= 16'd25000; state <= DELAY; state_back <= INIT; cnt_init <= cnt_init + 1'b1; end	//延时大于3us
							5'd2:	begin oled_rst <= HIGH; cnt_init <= cnt_init + 1'b1; end	//复位恢复
							5'd3:	begin num1_delay <= 16'd25000; state <= DELAY; state_back <= INIT; cnt_init <= cnt_init + 1'b1; end	//延时大于220us
							5'd4:	begin 
										if(cnt>=INIT_DEPTH) begin	//当29条指令及数据发出后，配置完成
											cnt <= 1'b0;
											cnt_init <= cnt_init + 1'b1;
										end else begin	
											cnt <= cnt + 1'b1; num1_delay <= 16'd5;
											oled_dcn <= CMD; char_reg <= cmd[cnt]; state <= WRITE; state_back <= INIT;
										end
									end
							5'd5:	begin cnt_init <= 1'b0; state <= MAIN; end	//初始化完成，返回MAIN状态
							default: state <= IDLE;
						endcase
					end
				SCAN:begin	//刷屏状态，从RAM中读取数据刷屏
						if(cnt_scan == 5'd7) begin
							if(num2) cnt_scan <= cnt_scan + 5'd10;   //16*8
							else cnt_scan <= cnt_scan + 1'b1;        //32*16
						end
                        else if(cnt_scan == 5'd16) begin
							if(num1) cnt_scan <= 5'd8;
							else cnt_scan <= cnt_scan + 5'd10;
						end
                        else if(cnt_scan == 5'd25) begin
							if(num2) cnt_scan <= 5'd17;
							else cnt_scan <= cnt_scan + 1'b1;
						end
                        else if(cnt_scan == 5'd26) cnt_scan <= 1'b0;
                        else cnt_scan <= cnt_scan + 1'b1;
						case(cnt_scan)
                            5'd0:	begin oled_dcn <= CMD; char_reg <= 8'h20; state <= WRITE; state_back <= SCAN; end
							5'd1:	begin oled_dcn <= CMD; char_reg <= 8'h01; state <= WRITE; state_back <= SCAN; end
							5'd2:	begin oled_dcn <= CMD; char_reg <= 8'h21; state <= WRITE; state_back <= SCAN; end
							5'd3:	begin oled_dcn <= CMD; char_reg <= x_pl; state <= WRITE; state_back <= SCAN; end
							5'd4:	begin oled_dcn <= CMD; char_reg <= x_ph; state <= WRITE; state_back <= SCAN; end
							5'd5:	begin oled_dcn <= CMD; char_reg <= 8'h22; state <= WRITE; state_back <= SCAN; end
							5'd6:	begin oled_dcn <= CMD; char_reg <= y_pl; state <= WRITE; state_back <= SCAN; end
							5'd7:	begin oled_dcn <= CMD; char_reg <= y_ph; state <= WRITE; state_back <= SCAN; end

                            5'd8:	begin num1 <= num1 - 1'b1;end        
							5'd9:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][63:56]; state <= WRITE; state_back <= SCAN; end
							5'd10:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][55:48]; state <= WRITE; state_back <= SCAN; end
							5'd11:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][47:40]; state <= WRITE; state_back <= SCAN; end
							5'd12:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][39:32]; state <= WRITE; state_back <= SCAN; end
							5'd13:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][31:24]; state <= WRITE; state_back <= SCAN; end
							5'd14:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][23:16]; state <= WRITE; state_back <= SCAN; end
							5'd15:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][15: 8]; state <= WRITE; state_back <= SCAN; end
							5'd16:	begin oled_dcn <= DATA; char_reg <= mem1[char+7-num1][ 7: 0]; state <= WRITE; state_back <= SCAN; end
                            
                            5'd17:	begin num2 <= num2 - 1'b1;end 
                            5'd18:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][63:56]; state <= WRITE; state_back <= SCAN; end
                            5'd19:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][55:48]; state <= WRITE; state_back <= SCAN; end
                            5'd20:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][47:40]; state <= WRITE; state_back <= SCAN; end
                            5'd21:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][39:32]; state <= WRITE; state_back <= SCAN; end
                            5'd22:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][31:24]; state <= WRITE; state_back <= SCAN; end
                            5'd23:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][23:16]; state <= WRITE; state_back <= SCAN; end
                            5'd24:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][15: 8]; state <= WRITE; state_back <= SCAN; end
                            5'd25:	begin oled_dcn <= DATA; char_reg <= mem2[char+1-num2][ 7: 0]; state <= WRITE; state_back <= SCAN; end
                            5'd26:	begin state <= MAIN; end
							default: state <= IDLE;
						endcase
					end
				WRITE:begin	//WRITE状态，将数据按照SPI时序发送给屏幕
						if(cnt_write >= 5'd17) cnt_write <= 1'b0;
						else cnt_write <= cnt_write + 1'b1;
						case(cnt_write)
							5'd0:	begin oled_csn <= LOW; end	//9位数据最高位为命令数据控制位
							5'd1:	begin oled_clk <= LOW; oled_dat <= char_reg[7]; end
							5'd2:	begin oled_clk <= HIGH; end
							5'd3:	begin oled_clk <= LOW; oled_dat <= char_reg[6]; end
							5'd4:	begin oled_clk <= HIGH; end
							5'd5:	begin oled_clk <= LOW; oled_dat <= char_reg[5]; end
							5'd6:	begin oled_clk <= HIGH; end
							5'd7:	begin oled_clk <= LOW; oled_dat <= char_reg[4]; end
							5'd8:	begin oled_clk <= HIGH; end
							5'd9:	begin oled_clk <= LOW; oled_dat <= char_reg[3]; end
							5'd10:	begin oled_clk <= HIGH; end
							5'd11:	begin oled_clk <= LOW; oled_dat <= char_reg[2]; end
							5'd12:	begin oled_clk <= HIGH; end
							5'd13:	begin oled_clk <= LOW; oled_dat <= char_reg[1]; end
							5'd14:	begin oled_clk <= HIGH; end
							5'd15:	begin oled_clk <= LOW; oled_dat <= char_reg[0]; end
							5'd16:	begin oled_clk <= HIGH; end
							5'd17:	begin oled_csn <= HIGH; state <= DELAY; end	//
							default: state <= IDLE;
						endcase
					end
				DELAY:begin	//延时状态
						if(cnt_delay >= num1_delay) begin
							cnt_delay <= 16'd0; state <= state_back; 
						end else cnt_delay <= cnt_delay + 1'b1;
					end
				default:state <= IDLE;
			endcase
		end
	end
 
	//OLED配置指令数据
	always@(posedge rst_n)
		begin
			cmd[ 0] = {8'hae}; //关闭屏幕
			cmd[ 1] = {8'h20}; //设置寻址模式
			cmd[ 2] = {8'h01}; //垂直寻址模式
			cmd[ 3] = {8'h21}; //设置起始/终止列地址
			cmd[ 4] = {8'h00}; //设置起始列地址
			cmd[ 5] = {8'h7f}; //设置终止列地址
			cmd[ 6] = {8'h22}; //设置起始/终止页地址
			cmd[ 7] = {8'h00}; //设置起始页地址
			cmd[ 8] = {8'h03}; //设置终止页地址
			cmd[ 9] = {8'h81}; //设置对比度
			cmd[10] = {8'hff}; //指定对比度
			cmd[11] = {8'ha1}; //设置SEG重映射列地址127映射到SEG0
			cmd[12] = {8'ha6}; //设置显示模式(A6:1亮0灭)
			cmd[13] = {8'ha8}; //设置复用率
			cmd[14] = {8'h1f}; //指定复用率(显示32行)
			cmd[15] = {8'hc8}; //设置COM扫描方向(C8:从COM[N-1]到COM0)
			cmd[16] = {8'hd3}; //设置偏移
			cmd[17] = {8'h00}; //指定偏移
			cmd[18] = {8'hd5}; //设置时钟分频
			cmd[19] = {8'h80}; //振荡频率:8,分频:1
			cmd[20] = {8'hd9}; //设置预充电周期
			cmd[21] = {8'h1f}; //指定预充电周期
			cmd[22] = {8'hda}; //设置COM硬件
			cmd[23] = {8'h00}; //禁止COM左右反置
			cmd[24] = {8'hdb}; //设置VCOMH电平
			cmd[25] = {8'h40}; //指定VCOMH电平
			cmd[26] = {8'h8d}; 
			cmd[27] = {8'h14};
			cmd[28] = {8'haf}; //打开屏幕
		end 
 
	//5*8点阵字库数据
	always@(posedge rst_n)
		begin
            //0
			mem1[ 0] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'hF0, 8'h1F, 8'h00}; 
            mem1[ 1] = {8'h00, 8'hFE, 8'hFF, 8'h00, 8'h00, 8'hFF, 8'hFF, 8'h03}; 
            mem1[ 2] = {8'h80, 8'h07, 8'hC0, 8'h03, 8'hC0, 8'h01, 8'h00, 8'h07};
            mem1[ 3] = {8'hC0, 8'h00, 8'h00, 8'h06, 8'hC0, 8'h00, 8'h00, 8'h0E};
            mem1[ 4] = {8'hC0, 8'h00, 8'h00, 8'h0E, 8'hC0, 8'h00, 8'h00, 8'h06}; 
            mem1[ 5] = {8'hC0, 8'h03, 8'h00, 8'h07, 8'h80, 8'h0F, 8'hE0, 8'h03}; 
            mem1[ 6] = {8'h00, 8'hFF, 8'hFF, 8'h01, 8'h00, 8'hFC, 8'h7F, 8'h00};
            mem1[ 7] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //1
            mem1[ 8] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}; 
            mem1[ 9] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h1C, 8'h00, 8'h00}; 
            mem1[10] = {8'h00, 8'h0C, 8'h00, 8'h00, 8'h00, 8'h06, 8'h00, 8'h00};
            mem1[11] = {8'h00, 8'h03, 8'h00, 8'h00, 8'hC0, 8'hFF, 8'hFF, 8'h07};
            mem1[12] = {8'hC0, 8'hFF, 8'hFF, 8'h07, 8'hC0, 8'hFF, 8'hFF, 8'h07};
            mem1[13] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[14] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[15] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //2
            mem1[16] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h04, 8'h00, 8'h00};
            mem1[17] = {8'h00, 8'h07, 8'h00, 8'h07, 8'h80, 8'h07, 8'h80, 8'h07};
            mem1[18] = {8'hC0, 8'h03, 8'hC0, 8'h07, 8'hC0, 8'h01, 8'hE0, 8'h07};
            mem1[19] = {8'hC0, 8'h00, 8'h70, 8'h06, 8'hC0, 8'h00, 8'h38, 8'h06};
            mem1[20] = {8'hC0, 8'h00, 8'h1E, 8'h06, 8'hC0, 8'h00, 8'h0F, 8'h06};
            mem1[21] = {8'hC0, 8'hC1, 8'h03, 8'h06, 8'h80, 8'hFF, 8'h01, 8'h06};
            mem1[22] = {8'h80, 8'hFF, 8'h00, 8'h06, 8'h00, 8'h1E, 8'h00, 8'h06};
            mem1[23] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //3
            mem1[24] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h40, 8'h00};
            mem1[25] = {8'h00, 8'h06, 8'hC0, 8'h01, 8'h00, 8'h0F, 8'hE0, 8'h03};
            mem1[26] = {8'h80, 8'h03, 8'h80, 8'h07, 8'hC0, 8'h01, 8'h00, 8'h07};
            mem1[27] = {8'hC0, 8'h80, 8'h01, 8'h06, 8'hC0, 8'h80, 8'h01, 8'h0E};
            mem1[28] = {8'hC0, 8'h80, 8'h01, 8'h0E, 8'hC0, 8'hC0, 8'h03, 8'h06};
            mem1[29] = {8'hC0, 8'hC1, 8'h03, 8'h07, 8'h80, 8'h7F, 8'hDF, 8'h03};
            mem1[30] = {8'h80, 8'h7F, 8'hFE, 8'h03, 8'h00, 8'h1E, 8'hFC, 8'h00};
            mem1[31] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //4
            mem1[32] = {8'h00, 8'h00, 8'h70, 8'h00, 8'h00, 8'h00, 8'h78, 8'h00};
            mem1[33] = {8'h00, 8'h00, 8'h7E, 8'h00, 8'h00, 8'h00, 8'h7F, 8'h00};
            mem1[34] = {8'h00, 8'hC0, 8'h73, 8'h00, 8'h00, 8'hE0, 8'h71, 8'h00};
            mem1[35] = {8'h00, 8'h70, 8'h70, 8'h00, 8'h00, 8'h3C, 8'h70, 8'h00};
            mem1[36] = {8'h00, 8'h1E, 8'h70, 8'h00, 8'h80, 8'h07, 8'h70, 8'h00};
            mem1[37] = {8'hC0, 8'hFF, 8'hFF, 8'h07, 8'hC0, 8'hFF, 8'hFF, 8'h07};
            mem1[38] = {8'h00, 8'h00, 8'h70, 8'h00, 8'h00, 8'h00, 8'h70, 8'h00};
            mem1[39] = {8'h00, 8'h00, 8'h70, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //5
            mem1[40] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h80, 8'hC1, 8'h01};
            mem1[41] = {8'h00, 8'hF8, 8'hE1, 8'h03, 8'hC0, 8'hFF, 8'h81, 8'h07};
            mem1[42] = {8'hC0, 8'hCF, 8'h00, 8'h06, 8'hC0, 8'h60, 8'h00, 8'h0E};
            mem1[43] = {8'hC0, 8'h60, 8'h00, 8'h0E, 8'hC0, 8'h60, 8'h00, 8'h0E};
            mem1[44] = {8'hC0, 8'h60, 8'h00, 8'h0E, 8'hC0, 8'hE0, 8'h00, 8'h07};
            mem1[45] = {8'hC0, 8'hC0, 8'h01, 8'h07, 8'hC0, 8'hC0, 8'hE7, 8'h03};
            mem1[46] = {8'hC0, 8'h80, 8'hFF, 8'h01, 8'h00, 8'h00, 8'hFE, 8'h00};
            mem1[47] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //6
            mem1[48] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h7C, 8'h00};
            mem1[49] = {8'h00, 8'h00, 8'hFF, 8'h01, 8'h00, 8'hC0, 8'hFF, 8'h03};
            mem1[50] = {8'h00, 8'hF0, 8'h83, 8'h07, 8'h00, 8'hF8, 8'h01, 8'h07};
            mem1[51] = {8'h00, 8'hFE, 8'h00, 8'h06, 8'h00, 8'hCF, 8'h00, 8'h0E};
            mem1[52] = {8'hC0, 8'hC7, 8'h00, 8'h0E, 8'hC0, 8'hC1, 8'h00, 8'h0E};
            mem1[53] = {8'hC0, 8'hC0, 8'h00, 8'h06, 8'h00, 8'hC0, 8'h01, 8'h07};
            mem1[54] = {8'h00, 8'h80, 8'hFF, 8'h03, 8'h00, 8'h00, 8'hFF, 8'h01};
            mem1[55] = {8'h00, 8'h00, 8'hFE, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //7
            mem1[56] = {8'h00, 8'h00, 8'h00, 8'h00, 8'hC0, 8'h00, 8'h00, 8'h00};
            mem1[57] = {8'hC0, 8'h00, 8'h00, 8'h00, 8'hC0, 8'h00, 8'h00, 8'h00};
            mem1[58] = {8'hC0, 8'h00, 8'h00, 8'h04, 8'hC0, 8'h00, 8'h80, 8'h07};
            mem1[59] = {8'hC0, 8'h00, 8'hF0, 8'h07, 8'hC0, 8'h00, 8'hFE, 8'h01};
            mem1[60] = {8'hC0, 8'h80, 8'h3F, 8'h00, 8'hC0, 8'hE0, 8'h07, 8'h00};
            mem1[61] = {8'hC0, 8'hF8, 8'h00, 8'h00, 8'hC0, 8'h3E, 8'h00, 8'h00};
            mem1[62] = {8'hC0, 8'h0F, 8'h00, 8'h00, 8'hC0, 8'h03, 8'h00, 8'h00};
            mem1[63] = {8'hC0, 8'h01, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //8
            mem1[64] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'hFC, 8'h01};
            mem1[65] = {8'h00, 8'h7F, 8'hFE, 8'h03, 8'h80, 8'h7F, 8'hCF, 8'h07};
            mem1[66] = {8'hC0, 8'hE1, 8'h07, 8'h07, 8'hC0, 8'hC0, 8'h03, 8'h06};
            mem1[67] = {8'hC0, 8'h80, 8'h01, 8'h0E, 8'hC0, 8'h80, 8'h01, 8'h0E};
            mem1[68] = {8'hC0, 8'h80, 8'h01, 8'h0E, 8'hC0, 8'hC0, 8'h03, 8'h06};
            mem1[69] = {8'hC0, 8'hE1, 8'h03, 8'h07, 8'h80, 8'h7F, 8'h8F, 8'h07};
            mem1[70] = {8'h00, 8'h7F, 8'hFE, 8'h03, 8'h00, 8'h1E, 8'hFC, 8'h01};
            mem1[71] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //9
            mem1[72] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'hFE, 8'h01, 8'h00};
            mem1[73] = {8'h00, 8'hFF, 8'h03, 8'h00, 8'h80, 8'h87, 8'h07, 8'h00};
            mem1[74] = {8'hC0, 8'h01, 8'h07, 8'h08, 8'hC0, 8'h01, 8'h06, 8'h0E};
            mem1[75] = {8'hC0, 8'h00, 8'h86, 8'h0F, 8'hC0, 8'h00, 8'hE6, 8'h03};
            mem1[76] = {8'hC0, 8'h00, 8'hFE, 8'h01, 8'hC0, 8'h01, 8'h7F, 8'h00};
            mem1[77] = {8'hC0, 8'h83, 8'h1F, 8'h00, 8'h80, 8'hFF, 8'h07, 8'h00};
            mem1[78] = {8'h00, 8'hFF, 8'h03, 8'h00, 8'h00, 8'h7E, 8'h00, 8'h00};
            mem1[79] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //:
            mem1[80] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[81] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[82] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[83] = {8'h00, 8'h0F, 8'hF0, 8'h00, 8'h00, 8'h0F, 8'hF0, 8'h00};
            mem1[84] = {8'h00, 8'h0F, 8'hF0, 8'h00, 8'h00, 8'h0F, 8'hF0, 8'h00};
            mem1[85] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[86] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem1[87] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //:
            mem1[88] = {8'h00, 8'h00, 8'h18, 8'h00, 8'h0C, 8'h00, 8'h3C, 8'h00};
            mem1[89] = {8'h12, 8'h00, 8'h3C, 8'h00, 8'h12, 8'h00, 8'hF8, 8'h00};
            mem1[90] = {8'h8C, 8'h0F, 8'hC0, 8'h01, 8'hE0, 8'h38, 8'h80, 8'h0F};
            mem1[91] = {8'h30, 8'h20, 8'h1C, 8'h3F, 8'h10, 8'h60, 8'hFE, 8'h7F};
            mem1[92] = {8'h18, 8'h40, 8'hFE, 8'h7F, 8'h08, 8'h40, 8'h1C, 8'h3F};
            mem1[93] = {8'h08, 8'h60, 8'h80, 8'h0F, 8'h08, 8'h20, 8'hC0, 8'h01};
            mem1[94] = {8'h10, 8'h30, 8'hF8, 8'h00, 8'h30, 8'h0C, 8'h3C, 8'h00};
            mem1[95] = {8'h00, 8'h00, 8'h3C, 8'h00, 8'h00, 8'h00, 8'h18, 8'h00};
		end

    always@(posedge rst_n)
		begin
            //0
			mem2[ 0] = {8'h00, 8'h00, 8'hE0, 8'h0F, 8'h10, 8'h10, 8'h08, 8'h20}; 
            mem2[ 1] = {8'h08, 8'h20, 8'h10, 8'h10, 8'hE0, 8'h0F, 8'h00, 8'h00};
            //1
            mem2[ 2] = {8'h00, 8'h00, 8'h10, 8'h20, 8'h10, 8'h20, 8'hF8, 8'h3F};
            mem2[ 3] = {8'h00, 8'h20, 8'h00, 8'h20, 8'h00, 8'h00, 8'h00, 8'h00};
            //2
            mem2[ 4] = {8'h00, 8'h00, 8'h70, 8'h30, 8'h08, 8'h28, 8'h08, 8'h24}; 
            mem2[ 5] = {8'h08, 8'h22, 8'h88, 8'h21, 8'h70, 8'h30, 8'h00, 8'h00};
            //3
            mem2[ 6] = {8'h00, 8'h00, 8'h30, 8'h18, 8'h08, 8'h20, 8'h88, 8'h20};
            mem2[ 7] = {8'h88, 8'h20, 8'h48, 8'h11, 8'h30, 8'h0E, 8'h00, 8'h00};
            //4
            mem2[ 8] = {8'h00, 8'h00, 8'h00, 8'h07, 8'hC0, 8'h04, 8'h20, 8'h24}; 
            mem2[ 9] = {8'h10, 8'h24, 8'hF8, 8'h3F, 8'h00, 8'h24, 8'h00, 8'h00};
            //5
            mem2[10] = {8'h00, 8'h00, 8'hF8, 8'h19, 8'h08, 8'h21, 8'h88, 8'h20};
            mem2[11] = {8'h88, 8'h20, 8'h08, 8'h11, 8'h08, 8'h0E, 8'h00, 8'h00};
            //6
            mem2[12] = {8'h00, 8'h00, 8'hE0, 8'h0F, 8'h10, 8'h11, 8'h88, 8'h20};
            mem2[13] = {8'h88, 8'h20, 8'h18, 8'h11, 8'h00, 8'h0E, 8'h00, 8'h00};
            //7
            mem2[14] = {8'h00, 8'h00, 8'h38, 8'h00, 8'h08, 8'h00, 8'h08, 8'h3F};
            mem2[15] = {8'hC8, 8'h00, 8'h38, 8'h00, 8'h08, 8'h00, 8'h00, 8'h00};
            //8
            mem2[16] = {8'h00, 8'h00, 8'h70, 8'h1C, 8'h88, 8'h22, 8'h08, 8'h21};
            mem2[17] = {8'h08, 8'h21, 8'h88, 8'h22, 8'h70, 8'h1C, 8'h00, 8'h00};
            //9
            mem2[18] = {8'h00, 8'h00, 8'hE0, 8'h00, 8'h10, 8'h31, 8'h08, 8'h22};
            mem2[19] = {8'h08, 8'h22, 8'h10, 8'h11, 8'hE0, 8'h0F, 8'h00, 8'h00};
            //.
            mem2[20] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h30};
            mem2[21] = {8'h00, 8'h30, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            //space
            mem2[22] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            mem2[23] = {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
        end

endmodule