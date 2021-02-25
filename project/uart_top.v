module uart_top #
(
parameter				BPS_PARA = 1250 //当使用12MHz时钟时波特率参数选择1250对应9600的波特率
)
(
input					clk,		//系统时钟
input					rst_n,		//系统复位，低有效
input                   flag,       
input           [11:0]  tamp_data,
input					rs232_rx,	//FPGA中UART接收端，分配给UART模块中的发送端TXD
output					rs232_tx,	//FPGA中UART发送端，分配给UART模块中的接收端RXD
output  reg     [9:0]   data_length,
output  reg     [959:0] data_buffer,
output  reg             rx_done
);		

//************flag整点后发送温度数据*******************
wire					bps_en_tx,bps_clk_tx;
wire					bps_en_rx,bps_clk_rx;
wire			[7:0]	rx_data;
reg             [1:0]   tx_data_length;
wire                    tx_done;

//bps_en_tx_r
reg	bps_en_tx0,bps_en_tx1,bps_en_tx2;	
//多级延时锁存去除亚稳态
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		bps_en_tx0 <= 1'b0;
		bps_en_tx1 <= 1'b0;
		bps_en_tx2 <= 1'b0;
	end else begin
		bps_en_tx0 <= bps_en_tx;
		bps_en_tx1 <= bps_en_tx0;
		bps_en_tx2 <= bps_en_tx1;
	end
end

//tx_done发送完成信号
assign	tx_done = bps_en_tx2 & bps_en_tx1 & (~bps_en_tx0) & (~bps_en_tx);

//tx_data_length
always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        tx_data_length <= 2'd0;
    else if ( flag )
        tx_data_length <= 2'd1;
    else if ( tx_done )
        tx_data_length <= tx_data_length - 1'b1;

//tx_data
reg             [7:0]   tx_data;
always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        tx_data <= 8'd0;
    else if ( flag )
        tx_data <= tamp_data[11:4];
    else if ( tx_done )
        tx_data <= {4'd0,tamp_data[3:0]};

//tx_en
wire                    tx_en;
assign tx_en = ( flag || (tx_done&&tx_data_length)) ? 1'b1:1'b0;

//tx_en_r
reg                     tx_en_r;
always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        tx_en_r <= 1'b0;
    else
        tx_en_r <= tx_en;

//********接收音符,接收完成后产生rx_done脉冲**********
wire                    ready;

always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        data_length <= 10'd0;
    else if ( rx_done )
        data_length <= 10'd0;
    else if ( ready && rx_data==8'h1f) //结束标志
        data_length <= data_length + 1'b1;
    else if ( ready )
        data_length <= data_length + 1'b1;

always @ ( posedge clk or negedge rst_n )
    if ( ~rst_n )
        data_buffer <= 960'd0;
    else if ( rx_done )
        data_buffer <= 960'd0;
    else if ( ready && rx_data==8'h1f)
        data_buffer <= data_buffer;
    else if ( ready ) begin
        data_buffer[7:0] <= rx_data;
        data_buffer[959:8] <= data_buffer[951:0];
    end

always @ (posedge clk or negedge rst_n)
	if(!rst_n)
        rx_done <= 1'b0;
    else if (rx_done)
        rx_done <= 1'b0;
    else if ( ready && rx_data==8'h1f)
        rx_done <= 1'b1;


/////////////////////////////////UART接收功能模块例化////////////////////////////////////
 
//UART接收波特率时钟控制模块 例化
baud_generator #
(
.BPS_PARA				(BPS_PARA		)
)
baud_rx_ins
(	
.clk					(clk			),	//系统时钟
.rst_n				    (rst_n		    ),	//系统复位，低有效
.bps_en					(bps_en_rx		),	//接收时钟使能
.bps_clk				(bps_clk_rx		)	//接收时钟输出
);
 
//UART接收数据模块 例化
uart_rx uart_rx_ins
(
.clk					(clk			),	//系统时钟
.rst_n				    (rst_n		    ),	//系统复位，低有效
.bps_en					(bps_en_rx		),	//接收时钟使能
.bps_clk				(bps_clk_rx		),	//接收时钟输入
.rs232_rx				(rs232_rx		),	//UART接收输入
.rx_data				(rx_data		),	//接收到的数据
.ready                  (ready          )
);

/////////////////////////////////UART发送功能模块例化////////////////////////////////////
 
//UART发送波特率时钟控制模块 例化
baud_generator #
(
.BPS_PARA				(BPS_PARA		)
)
baud_tx_ins
(
.clk					(clk			),	//系统时钟
.rst_n				    (rst_n		    ),	//系统复位，低有效
.bps_en					(bps_en_tx		),	//发送时钟使能
.bps_clk				(bps_clk_tx		)	//发送时钟输出
);
 
//UART发送数据模块 例化
uart_tx uart_tx_ins
(
.clk					(clk			),	//系统时钟
.rst_n				    (rst_n		    ),	//系统复位，低有效
.bps_en					(bps_en_tx		),	//发送时钟使能
.bps_clk				(bps_clk_tx		),	//发送时钟输入
.tx_en				    (tx_en_r   		),	
.tx_data				(tx_data  		),	//需要发出的数据
.rs232_tx				(rs232_tx		)	//UART发送输出
);
 
endmodule