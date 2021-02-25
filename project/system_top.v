module system_top(
	input				    clk,		//12MHz系统时钟
	input				    rst_n,		//系统复位，低有效

    input           [2:0]   key,        //2个按键控制时分
    output reg      [6:0]   led,
    output reg      [2:0]   rgb_led1,
    output reg      [2:0]   rgb_led2,
    output reg              en,

    inout				    one_wire,   //DS18B20Z传感器单总线

    input                   rs232_rx,
    output                  rs232_tx,

    output                  piano_out,

	output   			    oled_csn,	//OLCD液晶屏使能
	output  			    oled_rst,	//OLCD液晶屏复位
	output  			    oled_dcn,	//OLCD数据指令控制
	output  			    oled_clk,	//OLCD时钟信号
	output  			    oled_dat	//OLCD数据信号
);

wire [11:0]         tamp_data;  //温度数据{[11:4]:整数部分,[3:0]:小数部分,BCD码}
wire [23:0]         time_data;  //时间数据{[11:8]:时,[7:4]:分,[3:0]:秒,BCD码}
wire                flag;
wire                play_done;

always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n ) begin
        led <= 8'd0;
        rgb_led1 <= 3'd0;
        rgb_led2 <= 3'd0;
    end
    else begin
        led <= 8'b11111111;
        rgb_led1 <= 3'b111;
        rgb_led2 <= 3'b111;
    end

always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        en <= 1'b1;
    else if ( flag )
        en <= 1'b0;
    else if ( play_done )
        en <= 1'b1;

//时间产生
time_generator time_generator_inst(
	.clk	        (clk	        ),	
	.rst_n          (rst_n          ),
    .control        (key            ),
    .en             (en             ),
    .time_out       (time_data      ),
    .flag           (flag           )
);

//温度采集
DS18B20Z DS18B20Z_inst(
	.clk	        (clk	        ),	
	.rst_n          (rst_n          ),
    .en             (en             ),
	.one_wire       (one_wire       ),
	.tamp_out       (tamp_data      )	
);

//显示
OLED12832 OLED12832_inst(
	.clk            (clk            ),
	.rst_n          (rst_n          ),
    .time_data      (time_data      ),
    .tamp_data      (tamp_data      ),
	.oled_csn       (oled_csn       ),
	.oled_rst       (oled_rst       ),
	.oled_dcn       (oled_dcn       ),
	.oled_clk       (oled_clk       ),
	.oled_dat       (oled_dat       )
);

wire                rx_done;
wire [9:0]   data_length;
wire [959:0] data_buffer;
//串口
uart_top #
(
.BPS_PARA			(1250   		)
)
uart_top_inst(
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .flag           (flag           ),
    .tamp_data      (tamp_data      ),
    .rs232_rx       (rs232_rx       ),
    .rs232_tx       (rs232_tx       ),
    .data_length    (data_length    ),
    .data_buffer    (data_buffer    ),
    .rx_done        (rx_done        )
);

//蜂鸣器控制
beeper_control beeper_control_inst(
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .en             (~en            ),
    .rx_done        (rx_done        ),
    .data_length    (data_length    ),
    .data_buffer    (data_buffer    ),
    .piano_out      (piano_out      ),
    .play_done      (play_done      )
);


endmodule