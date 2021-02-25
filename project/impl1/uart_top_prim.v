// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.0.396.4
// Netlist written on Tue Feb 23 09:01:40 2021
//
// Verilog Description of module uart_top
//

module uart_top (clk, rst_n, rs232_rx, rs232_tx) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(1[8:16])
    input clk;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    input rst_n;   // g:/fpga/mxo2/system/uart_top.v(7[11:16])
    input rs232_rx;   // g:/fpga/mxo2/system/uart_top.v(8[11:19])
    output rs232_tx;   // g:/fpga/mxo2/system/uart_top.v(9[12:20])
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    
    wire rst_n_c, rs232_rx_c, rs232_tx_c, bps_clk_rx;
    wire [7:0]rx_data;   // g:/fpga/mxo2/system/uart_top.v(14[14:21])
    
    wire bps_en_tx, bps_clk_tx, VCC_net;
    wire [12:0]cnt;   // g:/fpga/mxo2/system/baud_generator.v(12[15:18])
    
    wire GND_net, n6, n5, n851, bps_en_N_108, n630;
    
    VHI i762 (.Z(VCC_net));
    IB rs232_rx_pad (.I(rs232_rx), .O(rs232_rx_c));   // g:/fpga/mxo2/system/uart_top.v(8[11:19])
    GSR GSR_INST (.GSR(rst_n_c));
    IB rst_n_pad (.I(rst_n), .O(rst_n_c));   // g:/fpga/mxo2/system/uart_top.v(7[11:16])
    IB clk_pad (.I(clk), .O(clk_c));   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    OB rs232_tx_pad (.I(rs232_tx_c), .O(rs232_tx));   // g:/fpga/mxo2/system/uart_top.v(9[12:20])
    VLO i1 (.Z(GND_net));
    TSALL TSALL_INST (.TSALL(GND_net));
    uart_rx uart_rx_ins (.bps_clk_rx(bps_clk_rx), .clk_c(clk_c), .rs232_rx_c(rs232_rx_c), 
            .bps_en_N_108(bps_en_N_108), .rx_data({rx_data}), .\cnt[8] (cnt[8]), 
            .n5(n5), .\cnt[9] (cnt[9]), .n6(n6), .n630(n630)) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(30[9] 38[2])
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    baud_generator_U0 baud_rx_ins (.clk_c(clk_c), .\cnt[9] (cnt[9]), .\cnt[8] (cnt[8]), 
            .GND_net(GND_net), .bps_en_N_108(bps_en_N_108), .n630(n630), 
            .n5(n5), .n6(n6), .bps_clk_rx(bps_clk_rx)) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(21[1] 27[2])
    LUT4 m1_lut (.Z(n851)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    uart_tx uart_tx_ins (.clk_c(clk_c), .bps_en_N_108(bps_en_N_108), .rx_data({rx_data}), 
            .bps_en_tx(bps_en_tx), .bps_clk_tx(bps_clk_tx), .rs232_tx_c(rs232_tx_c), 
            .n851(n851)) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(58[9] 67[2])
    baud_generator baud_tx_ins (.GND_net(GND_net), .bps_clk_tx(bps_clk_tx), 
            .clk_c(clk_c), .bps_en_tx(bps_en_tx)) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(49[1] 55[2])
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module uart_rx
//

module uart_rx (bps_clk_rx, clk_c, rs232_rx_c, bps_en_N_108, rx_data, 
            \cnt[8] , n5, \cnt[9] , n6, n630) /* synthesis syn_module_defined=1 */ ;
    input bps_clk_rx;
    input clk_c;
    input rs232_rx_c;
    output bps_en_N_108;
    output [7:0]rx_data;
    input \cnt[8] ;
    input n5;
    input \cnt[9] ;
    input n6;
    output n630;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    wire [3:0]num;   // g:/fpga/mxo2/system/uart_rx.v(30[14:17])
    
    wire n799;
    wire [7:0]rx_data_r;   // g:/fpga/mxo2/system/uart_rx.v(41[14:23])
    
    wire clk_c_enable_2, clk_c_enable_3, clk_c_enable_25, clk_c_enable_24, 
        n802, rs232_rx1, rs232_rx0, rs232_rx2, n752, clk_c_enable_5, 
        clk_c_enable_7, n71, n64, clk_c_enable_11, n797, n751, n803, 
        clk_c_enable_9, n750;
    wire [3:0]n21;
    
    wire clk_c_enable_14, clk_c_enable_15;
    
    LUT4 i1_2_lut_rep_9 (.A(bps_clk_rx), .B(num[3]), .Z(n799)) /* synthesis lut_function=(!((B)+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_rep_9.init = 16'h2222;
    FD1P3AX rx_data_r_i0_i1 (.D(rs232_rx_c), .SP(clk_c_enable_2), .CK(clk_c), 
            .Q(rx_data_r[1])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i1.GSR = "ENABLED";
    FD1P3AX rx_data_r_i0_i2 (.D(rs232_rx_c), .SP(clk_c_enable_3), .CK(clk_c), 
            .Q(rx_data_r[2])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i2.GSR = "ENABLED";
    FD1P3IX num_64__i0 (.D(n802), .SP(clk_c_enable_25), .CD(clk_c_enable_24), 
            .CK(clk_c), .Q(num[0]));   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam num_64__i0.GSR = "ENABLED";
    FD1S3AX rs232_rx1_50 (.D(rs232_rx0), .CK(clk_c), .Q(rs232_rx1)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(20[11] 24[5])
    defparam rs232_rx1_50.GSR = "ENABLED";
    LUT4 i547_1_lut_rep_12 (.A(num[0]), .Z(n802)) /* synthesis lut_function=(!(A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i547_1_lut_rep_12.init = 16'h5555;
    FD1S3AX rs232_rx2_51 (.D(rs232_rx1), .CK(clk_c), .Q(rs232_rx2)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(20[11] 24[5])
    defparam rs232_rx2_51.GSR = "ENABLED";
    FD1S3AX bps_en_52 (.D(n752), .CK(clk_c), .Q(bps_en_N_108)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(35[7] 38[18])
    defparam bps_en_52.GSR = "ENABLED";
    FD1P3AX rx_data_r_i0_i3 (.D(rs232_rx_c), .SP(clk_c_enable_5), .CK(clk_c), 
            .Q(rx_data_r[3])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i3.GSR = "ENABLED";
    FD1P3AX rx_data_r_i0_i0 (.D(rs232_rx_c), .SP(clk_c_enable_7), .CK(clk_c), 
            .Q(rx_data_r[0])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i0.GSR = "ENABLED";
    LUT4 i1_3_lut (.A(bps_en_N_108), .B(n71), .C(bps_clk_rx), .Z(clk_c_enable_25)) /* synthesis lut_function=(A (B+(C))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(35[7] 38[18])
    defparam i1_3_lut.init = 16'ha8a8;
    FD1P3AX rx_data_i0_i0 (.D(rx_data_r[0]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[0])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i0.GSR = "ENABLED";
    FD1S3AX rs232_rx0_49 (.D(rs232_rx_c), .CK(clk_c), .Q(rs232_rx0)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(20[11] 24[5])
    defparam rs232_rx0_49.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(bps_clk_rx), .B(n71), .C(bps_en_N_108), .Z(clk_c_enable_24)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(35[7] 38[18])
    defparam i2_3_lut.init = 16'h4040;
    LUT4 i1_2_lut_4_lut (.A(n799), .B(num[1]), .C(n64), .D(num[2]), 
         .Z(clk_c_enable_2)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_4_lut.init = 16'h0080;
    LUT4 i1_2_lut_4_lut_adj_8 (.A(n799), .B(num[1]), .C(n64), .D(num[2]), 
         .Z(clk_c_enable_11)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_4_lut_adj_8.init = 16'h8000;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(num[0]), .B(num[2]), .C(n797), 
         .D(num[1]), .Z(clk_c_enable_5)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'h0040;
    LUT4 num_0__bdd_4_lut (.A(rs232_rx1), .B(rs232_rx2), .C(rs232_rx_c), 
         .D(rs232_rx0), .Z(n751)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam num_0__bdd_4_lut.init = 16'h0008;
    LUT4 i1_2_lut (.A(bps_en_N_108), .B(num[0]), .Z(n64)) /* synthesis lut_function=(!((B)+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut.init = 16'h2222;
    LUT4 i1_2_lut_rep_13 (.A(num[0]), .B(num[2]), .Z(n803)) /* synthesis lut_function=(!((B)+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_rep_13.init = 16'h2222;
    LUT4 i2_3_lut_4_lut (.A(num[0]), .B(num[2]), .C(num[3]), .D(num[1]), 
         .Z(n71)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i2_3_lut_4_lut.init = 16'h0020;
    LUT4 i1_2_lut_3_lut_4_lut (.A(num[1]), .B(n797), .C(num[0]), .D(num[2]), 
         .Z(clk_c_enable_9)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h4000;
    FD1P3AX rx_data_r_i0_i4 (.D(rs232_rx_c), .SP(clk_c_enable_9), .CK(clk_c), 
            .Q(rx_data_r[4])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i4.GSR = "ENABLED";
    PFUMX i730 (.BLUT(n751), .ALUT(n750), .C0(bps_en_N_108), .Z(n752));
    FD1P3AX rx_data_r_i0_i5 (.D(rs232_rx_c), .SP(clk_c_enable_11), .CK(clk_c), 
            .Q(rx_data_r[5])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i5.GSR = "ENABLED";
    FD1P3IX num_64__i1 (.D(n21[1]), .SP(clk_c_enable_25), .CD(clk_c_enable_24), 
            .CK(clk_c), .Q(num[1]));   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam num_64__i1.GSR = "ENABLED";
    FD1P3AX rx_data_r_i0_i6 (.D(rs232_rx_c), .SP(clk_c_enable_14), .CK(clk_c), 
            .Q(rx_data_r[6])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i6.GSR = "ENABLED";
    LUT4 i2_4_lut (.A(\cnt[8] ), .B(n5), .C(\cnt[9] ), .D(n6), .Z(n630)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(12[15:18])
    defparam i2_4_lut.init = 16'hfefa;
    FD1P3AX rx_data_r_i0_i7 (.D(rs232_rx_c), .SP(clk_c_enable_15), .CK(clk_c), 
            .Q(rx_data_r[7])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_r_i0_i7.GSR = "ENABLED";
    LUT4 i549_2_lut (.A(num[1]), .B(num[0]), .Z(n21[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i549_2_lut.init = 16'h6666;
    LUT4 i3_4_lut (.A(num[2]), .B(n64), .C(bps_clk_rx), .D(num[1]), 
         .Z(clk_c_enable_15)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i3_4_lut.init = 16'h0040;
    LUT4 i1_2_lut_3_lut_4_lut_adj_9 (.A(bps_en_N_108), .B(n799), .C(n803), 
         .D(num[1]), .Z(clk_c_enable_7)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_3_lut_4_lut_adj_9.init = 16'h0080;
    LUT4 i556_2_lut_3_lut (.A(num[1]), .B(num[0]), .C(num[2]), .Z(n21[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i556_2_lut_3_lut.init = 16'h7878;
    LUT4 num_0__bdd_4_lut_729 (.A(num[0]), .B(num[2]), .C(num[1]), .D(num[3]), 
         .Z(n750)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;
    defparam num_0__bdd_4_lut_729.init = 16'hfdff;
    LUT4 i1_2_lut_rep_7_3_lut (.A(bps_clk_rx), .B(num[3]), .C(bps_en_N_108), 
         .Z(n797)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_rep_7_3_lut.init = 16'h2020;
    LUT4 i563_3_lut_4_lut (.A(num[1]), .B(num[0]), .C(num[2]), .D(num[3]), 
         .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i563_3_lut_4_lut.init = 16'h7f80;
    FD1P3IX num_64__i2 (.D(n21[2]), .SP(clk_c_enable_25), .CD(clk_c_enable_24), 
            .CK(clk_c), .Q(num[2]));   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam num_64__i2.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_4_lut_adj_10 (.A(bps_en_N_108), .B(n799), .C(n803), 
         .D(num[1]), .Z(clk_c_enable_3)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i1_2_lut_3_lut_4_lut_adj_10.init = 16'h8000;
    FD1P3AX rx_data_i0_i7 (.D(rx_data_r[7]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[7])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i7.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i6 (.D(rx_data_r[6]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[6])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i6.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i5 (.D(rx_data_r[5]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[5])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i5.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i4 (.D(rx_data_r[4]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[4])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i4.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i3 (.D(rx_data_r[3]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[3])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i3.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i2 (.D(rx_data_r[2]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[2])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i2.GSR = "ENABLED";
    FD1P3AX rx_data_i0_i1 (.D(rx_data_r[1]), .SP(clk_c_enable_24), .CK(clk_c), 
            .Q(rx_data[1])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=30, LSE_RLINE=38 */ ;   // g:/fpga/mxo2/system/uart_rx.v(48[11] 57[5])
    defparam rx_data_i0_i1.GSR = "ENABLED";
    FD1P3IX num_64__i3 (.D(n21[3]), .SP(clk_c_enable_25), .CD(clk_c_enable_24), 
            .CK(clk_c), .Q(num[3]));   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam num_64__i3.GSR = "ENABLED";
    LUT4 i2_3_lut_4_lut_adj_11 (.A(num[1]), .B(n797), .C(num[0]), .D(num[2]), 
         .Z(clk_c_enable_14)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // g:/fpga/mxo2/system/uart_rx.v(50[11:19])
    defparam i2_3_lut_4_lut_adj_11.init = 16'h8000;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module baud_generator_U0
//

module baud_generator_U0 (clk_c, \cnt[9] , \cnt[8] , GND_net, bps_en_N_108, 
            n630, n5, n6, bps_clk_rx) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output \cnt[9] ;
    output \cnt[8] ;
    input GND_net;
    input bps_en_N_108;
    input n630;
    output n5;
    output n6;
    output bps_clk_rx;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    wire [12:0]cnt;   // g:/fpga/mxo2/system/baud_generator.v(12[15:18])
    
    wire cnt_12__N_29;
    wire [12:0]n57;
    
    wire n8, n681, n7, n718, n606, n607, n608, n801, n603, 
        n604, n605, bps_clk_N_33;
    
    FD1S3IX cnt_63__i0 (.D(n57[0]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i0.GSR = "ENABLED";
    LUT4 i1_4_lut (.A(\cnt[9] ), .B(\cnt[8] ), .C(n8), .D(n681), .Z(n7)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;
    defparam i1_4_lut.init = 16'hfffd;
    LUT4 i699_2_lut (.A(cnt[5]), .B(cnt[4]), .Z(n718)) /* synthesis lut_function=(A (B)) */ ;
    defparam i699_2_lut.init = 16'h8888;
    CCU2D cnt_63_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(\cnt[8] ), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n606), 
          .COUT(n607), .S0(n57[7]), .S1(n57[8]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_9.INJECT1_0 = "NO";
    defparam cnt_63_add_4_9.INJECT1_1 = "NO";
    CCU2D cnt_63_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n608), 
          .S0(n57[11]), .S1(n57[12]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_13.INJECT1_0 = "NO";
    defparam cnt_63_add_4_13.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_6 (.A(bps_en_N_108), .B(n801), .C(n630), .D(cnt[10]), 
         .Z(cnt_12__N_29)) /* synthesis lut_function=((B+(C (D)))+!A) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i1_4_lut_adj_6.init = 16'hfddd;
    LUT4 i1_4_lut_adj_7 (.A(n681), .B(cnt[6]), .C(cnt[0]), .D(cnt[4]), 
         .Z(n5)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i1_4_lut_adj_7.init = 16'hccc8;
    CCU2D cnt_63_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n603), 
          .COUT(n604), .S0(n57[1]), .S1(n57[2]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_3.INJECT1_0 = "NO";
    defparam cnt_63_add_4_3.INJECT1_1 = "NO";
    LUT4 i2_2_lut (.A(cnt[7]), .B(cnt[5]), .Z(n6)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i2_3_lut (.A(cnt[1]), .B(cnt[2]), .C(cnt[3]), .Z(n681)) /* synthesis lut_function=(A+(B+(C))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i2_3_lut.init = 16'hfefe;
    CCU2D cnt_63_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n604), 
          .COUT(n605), .S0(n57[3]), .S1(n57[4]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_5.INJECT1_0 = "NO";
    defparam cnt_63_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_63_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n605), 
          .COUT(n606), .S0(n57[5]), .S1(n57[6]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_7.INJECT1_0 = "NO";
    defparam cnt_63_add_4_7.INJECT1_1 = "NO";
    CCU2D cnt_63_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n603), 
          .S1(n57[0]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_1.INIT0 = 16'hF000;
    defparam cnt_63_add_4_1.INIT1 = 16'h0555;
    defparam cnt_63_add_4_1.INJECT1_0 = "NO";
    defparam cnt_63_add_4_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_11 (.A(cnt[11]), .B(cnt[12]), .Z(n801)) /* synthesis lut_function=(A+(B)) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i1_2_lut_rep_11.init = 16'heeee;
    LUT4 i3_3_lut_4_lut (.A(cnt[11]), .B(cnt[12]), .C(cnt[7]), .D(cnt[10]), 
         .Z(n8)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i3_3_lut_4_lut.init = 16'hfffe;
    FD1S3AX bps_clk_17 (.D(bps_clk_N_33), .CK(clk_c), .Q(bps_clk_rx)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=1, LSE_RCOL=2, LSE_LLINE=21, LSE_RLINE=27 */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[8] 31[20])
    defparam bps_clk_17.GSR = "ENABLED";
    FD1S3IX cnt_63__i12 (.D(n57[12]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i12.GSR = "ENABLED";
    FD1S3IX cnt_63__i11 (.D(n57[11]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i11.GSR = "ENABLED";
    FD1S3IX cnt_63__i10 (.D(n57[10]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i10.GSR = "ENABLED";
    FD1S3IX cnt_63__i9 (.D(n57[9]), .CK(clk_c), .CD(cnt_12__N_29), .Q(\cnt[9] )) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i9.GSR = "ENABLED";
    FD1S3IX cnt_63__i8 (.D(n57[8]), .CK(clk_c), .CD(cnt_12__N_29), .Q(\cnt[8] )) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i8.GSR = "ENABLED";
    FD1S3IX cnt_63__i7 (.D(n57[7]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i7.GSR = "ENABLED";
    FD1S3IX cnt_63__i6 (.D(n57[6]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i6.GSR = "ENABLED";
    FD1S3IX cnt_63__i5 (.D(n57[5]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i5.GSR = "ENABLED";
    FD1S3IX cnt_63__i4 (.D(n57[4]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i4.GSR = "ENABLED";
    FD1S3IX cnt_63__i3 (.D(n57[3]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i3.GSR = "ENABLED";
    FD1S3IX cnt_63__i2 (.D(n57[2]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i2.GSR = "ENABLED";
    FD1S3IX cnt_63__i1 (.D(n57[1]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63__i1.GSR = "ENABLED";
    LUT4 i715_4_lut (.A(cnt[0]), .B(n7), .C(cnt[6]), .D(n718), .Z(bps_clk_N_33)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i715_4_lut.init = 16'h2000;
    CCU2D cnt_63_add_4_11 (.A0(\cnt[9] ), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n607), .COUT(n608), .S0(n57[9]), .S1(n57[10]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_63_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_63_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_63_add_4_11.INJECT1_0 = "NO";
    defparam cnt_63_add_4_11.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module uart_tx
//

module uart_tx (clk_c, bps_en_N_108, rx_data, bps_en_tx, bps_clk_tx, 
            rs232_tx_c, n851) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input bps_en_N_108;
    input [7:0]rx_data;
    output bps_en_tx;
    input bps_clk_tx;
    output rs232_tx_c;
    input n851;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    wire [3:0]num;   // g:/fpga/mxo2/system/uart_tx.v(12[14:17])
    
    wire clk_c_enable_12, n274;
    wire [3:0]n21;
    wire [9:0]tx_data_r;   // g:/fpga/mxo2/system/uart_tx.v(13[14:23])
    
    wire n767, n764, n768, n5, n4, n763, n265, n765, n766, 
        n690, clk_c_enable_16, n6, rs232_tx_N_113;
    
    FD1P3IX num_66__i1 (.D(n21[1]), .SP(clk_c_enable_12), .CD(n274), .CK(clk_c), 
            .Q(num[1]));   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam num_66__i1.GSR = "ENABLED";
    FD1P3IX num_66__i0 (.D(n21[0]), .SP(clk_c_enable_12), .CD(n274), .CK(clk_c), 
            .Q(num[0]));   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam num_66__i0.GSR = "ENABLED";
    FD1P3AX tx_data_r__i1 (.D(rx_data[0]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[1])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i1.GSR = "ENABLED";
    LUT4 n767_bdd_3_lut (.A(n767), .B(n764), .C(num[3]), .Z(n768)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam n767_bdd_3_lut.init = 16'hcaca;
    LUT4 num_3__I_0_i5_3_lut (.A(tx_data_r[6]), .B(tx_data_r[7]), .C(num[0]), 
         .Z(n5)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // g:/fpga/mxo2/system/uart_tx.v(35[26:29])
    defparam num_3__I_0_i5_3_lut.init = 16'hcaca;
    LUT4 tx_data_r_9__bdd_4_lut_734 (.A(num[3]), .B(num[1]), .C(n4), .D(n5), 
         .Z(n763)) /* synthesis lut_function=(!(A+!(B (D)+!B (C)))) */ ;
    defparam tx_data_r_9__bdd_4_lut_734.init = 16'h5410;
    FD1S3AX bps_en_24 (.D(n265), .CK(clk_c), .Q(bps_en_tx)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam bps_en_24.GSR = "ENABLED";
    FD1P3IX num_66__i2 (.D(n21[2]), .SP(clk_c_enable_12), .CD(n274), .CK(clk_c), 
            .Q(num[2]));   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam num_66__i2.GSR = "ENABLED";
    FD1P3IX num_66__i3 (.D(n21[3]), .SP(clk_c_enable_12), .CD(n274), .CK(clk_c), 
            .Q(num[3]));   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam num_66__i3.GSR = "ENABLED";
    LUT4 tx_data_r_9__bdd_4_lut (.A(tx_data_r[9]), .B(tx_data_r[8]), .C(num[0]), 
         .D(num[1]), .Z(n764)) /* synthesis lut_function=(!(A (B (D)+!B ((D)+!C))+!A ((C+(D))+!B))) */ ;
    defparam tx_data_r_9__bdd_4_lut.init = 16'h00ac;
    LUT4 num_3__I_0_i4_3_lut (.A(tx_data_r[4]), .B(tx_data_r[5]), .C(num[0]), 
         .Z(n4)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // g:/fpga/mxo2/system/uart_tx.v(35[26:29])
    defparam num_3__I_0_i4_3_lut.init = 16'hcaca;
    LUT4 tx_data_r_3__bdd_3_lut (.A(tx_data_r[3]), .B(tx_data_r[1]), .C(num[1]), 
         .Z(n765)) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;
    defparam tx_data_r_3__bdd_3_lut.init = 16'hacac;
    LUT4 tx_data_r_3__bdd_2_lut (.A(tx_data_r[2]), .B(num[1]), .Z(n766)) /* synthesis lut_function=(A (B)) */ ;
    defparam tx_data_r_3__bdd_2_lut.init = 16'h8888;
    LUT4 i2_4_lut (.A(num[1]), .B(num[0]), .C(num[3]), .D(num[2]), .Z(n690)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;
    defparam i2_4_lut.init = 16'hffdf;
    LUT4 i255_3_lut (.A(n690), .B(bps_en_N_108), .C(bps_en_tx), .Z(n265)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam i255_3_lut.init = 16'hecec;
    LUT4 i141_2_lut (.A(bps_clk_tx), .B(bps_en_tx), .Z(clk_c_enable_16)) /* synthesis lut_function=(A (B)) */ ;   // g:/fpga/mxo2/system/uart_tx.v(32[11] 38[5])
    defparam i141_2_lut.init = 16'h8888;
    LUT4 i95_2_lut (.A(num[1]), .B(num[2]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i95_2_lut.init = 16'heeee;
    FD1P3AY rs232_tx_28 (.D(rs232_tx_N_113), .SP(clk_c_enable_16), .CK(clk_c), 
            .Q(rs232_tx_c)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(32[11] 38[5])
    defparam rs232_tx_28.GSR = "ENABLED";
    LUT4 i585_2_lut_3_lut (.A(num[1]), .B(num[0]), .C(num[2]), .Z(n21[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam i585_2_lut_3_lut.init = 16'h7878;
    LUT4 i471_4_lut_rep_8 (.A(n6), .B(bps_en_tx), .C(bps_clk_tx), .D(num[3]), 
         .Z(clk_c_enable_12)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i471_4_lut_rep_8.init = 16'hc8c0;
    LUT4 i592_3_lut_4_lut (.A(num[1]), .B(num[0]), .C(num[2]), .D(num[3]), 
         .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam i592_3_lut_4_lut.init = 16'h7f80;
    PFUMX i737 (.BLUT(n768), .ALUT(n763), .C0(num[2]), .Z(rs232_tx_N_113));
    LUT4 i576_1_lut (.A(num[0]), .Z(n21[0])) /* synthesis lut_function=(!(A)) */ ;   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam i576_1_lut.init = 16'h5555;
    LUT4 i717_2_lut_4_lut (.A(n6), .B(bps_en_tx), .C(bps_clk_tx), .D(num[3]), 
         .Z(n274)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i717_2_lut_4_lut.init = 16'h0800;
    FD1P3AX tx_data_r__i9 (.D(n851), .SP(bps_en_N_108), .CK(clk_c), .Q(tx_data_r[9])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i9.GSR = "ENABLED";
    FD1P3AX tx_data_r__i8 (.D(rx_data[7]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[8])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i8.GSR = "ENABLED";
    FD1P3AX tx_data_r__i7 (.D(rx_data[6]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[7])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i7.GSR = "ENABLED";
    FD1P3AX tx_data_r__i6 (.D(rx_data[5]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[6])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i6.GSR = "ENABLED";
    FD1P3AX tx_data_r__i5 (.D(rx_data[4]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[5])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i5.GSR = "ENABLED";
    FD1P3AX tx_data_r__i4 (.D(rx_data[3]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[4])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i4.GSR = "ENABLED";
    FD1P3AX tx_data_r__i3 (.D(rx_data[2]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[3])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i3.GSR = "ENABLED";
    FD1P3AX tx_data_r__i2 (.D(rx_data[1]), .SP(bps_en_N_108), .CK(clk_c), 
            .Q(tx_data_r[2])) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=58, LSE_RLINE=67 */ ;   // g:/fpga/mxo2/system/uart_tx.v(19[11] 24[5])
    defparam tx_data_r__i2.GSR = "ENABLED";
    LUT4 i578_2_lut (.A(num[1]), .B(num[0]), .Z(n21[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // g:/fpga/mxo2/system/uart_tx.v(34[11:21])
    defparam i578_2_lut.init = 16'h6666;
    PFUMX i735 (.BLUT(n766), .ALUT(n765), .C0(num[0]), .Z(n767));
    
endmodule
//
// Verilog Description of module baud_generator
//

module baud_generator (GND_net, bps_clk_tx, clk_c, bps_en_tx) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    output bps_clk_tx;
    input clk_c;
    input bps_en_tx;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // g:/fpga/mxo2/system/uart_top.v(6[11:14])
    
    wire n610;
    wire [12:0]cnt;   // g:/fpga/mxo2/system/baud_generator.v(12[15:18])
    wire [12:0]n57;
    
    wire n611, n684, n5, bps_clk_N_33, n6, n636, n800, cnt_12__N_29, 
        n8, n615, n614, n7, n720, n613, n612;
    
    CCU2D cnt_65_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n610), 
          .COUT(n611), .S0(n57[1]), .S1(n57[2]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_3.INJECT1_0 = "NO";
    defparam cnt_65_add_4_3.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(n684), .B(cnt[6]), .C(cnt[0]), .D(cnt[4]), .Z(n5)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i1_4_lut.init = 16'hccc8;
    FD1S3AX bps_clk_17 (.D(bps_clk_N_33), .CK(clk_c), .Q(bps_clk_tx)) /* synthesis LSE_LINE_FILE_ID=11, LSE_LCOL=1, LSE_RCOL=2, LSE_LLINE=49, LSE_RLINE=55 */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[8] 31[20])
    defparam bps_clk_17.GSR = "ENABLED";
    LUT4 i2_4_lut (.A(cnt[9]), .B(cnt[8]), .C(n5), .D(n6), .Z(n636)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;
    defparam i2_4_lut.init = 16'hfeee;
    CCU2D cnt_65_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n610), 
          .S1(n57[0]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_1.INIT0 = 16'hF000;
    defparam cnt_65_add_4_1.INIT1 = 16'h0555;
    defparam cnt_65_add_4_1.INJECT1_0 = "NO";
    defparam cnt_65_add_4_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_10 (.A(cnt[12]), .B(cnt[11]), .Z(n800)) /* synthesis lut_function=(A+(B)) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i1_2_lut_rep_10.init = 16'heeee;
    FD1S3IX cnt_65__i0 (.D(n57[0]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i0.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(cnt[1]), .B(cnt[2]), .C(cnt[3]), .Z(n684)) /* synthesis lut_function=(A+(B+(C))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i2_3_lut.init = 16'hfefe;
    FD1S3IX cnt_65__i12 (.D(n57[12]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i12.GSR = "ENABLED";
    LUT4 i3_3_lut_4_lut (.A(cnt[12]), .B(cnt[11]), .C(cnt[10]), .D(cnt[7]), 
         .Z(n8)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i3_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_4_lut_adj_4 (.A(n636), .B(n800), .C(bps_en_tx), .D(cnt[10]), 
         .Z(cnt_12__N_29)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B+!(C))) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i1_4_lut_adj_4.init = 16'hefcf;
    FD1S3IX cnt_65__i11 (.D(n57[11]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i11.GSR = "ENABLED";
    FD1S3IX cnt_65__i10 (.D(n57[10]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i10.GSR = "ENABLED";
    FD1S3IX cnt_65__i9 (.D(n57[9]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i9.GSR = "ENABLED";
    FD1S3IX cnt_65__i8 (.D(n57[8]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i8.GSR = "ENABLED";
    FD1S3IX cnt_65__i7 (.D(n57[7]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i7.GSR = "ENABLED";
    FD1S3IX cnt_65__i6 (.D(n57[6]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i6.GSR = "ENABLED";
    FD1S3IX cnt_65__i5 (.D(n57[5]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i5.GSR = "ENABLED";
    FD1S3IX cnt_65__i4 (.D(n57[4]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i4.GSR = "ENABLED";
    FD1S3IX cnt_65__i3 (.D(n57[3]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i3.GSR = "ENABLED";
    FD1S3IX cnt_65__i2 (.D(n57[2]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i2.GSR = "ENABLED";
    FD1S3IX cnt_65__i1 (.D(n57[1]), .CK(clk_c), .CD(cnt_12__N_29), .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65__i1.GSR = "ENABLED";
    CCU2D cnt_65_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n615), 
          .S0(n57[11]), .S1(n57[12]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_13.INJECT1_0 = "NO";
    defparam cnt_65_add_4_13.INJECT1_1 = "NO";
    CCU2D cnt_65_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n614), 
          .COUT(n615), .S0(n57[9]), .S1(n57[10]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_11.INJECT1_0 = "NO";
    defparam cnt_65_add_4_11.INJECT1_1 = "NO";
    LUT4 i719_4_lut (.A(cnt[0]), .B(n7), .C(cnt[6]), .D(n720), .Z(bps_clk_N_33)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // g:/fpga/mxo2/system/baud_generator.v(28[11:31])
    defparam i719_4_lut.init = 16'h2000;
    CCU2D cnt_65_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n613), 
          .COUT(n614), .S0(n57[7]), .S1(n57[8]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_9.INJECT1_0 = "NO";
    defparam cnt_65_add_4_9.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_5 (.A(cnt[9]), .B(cnt[8]), .C(n8), .D(n684), .Z(n7)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;
    defparam i1_4_lut_adj_5.init = 16'hfffd;
    CCU2D cnt_65_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n612), 
          .COUT(n613), .S0(n57[5]), .S1(n57[6]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_7.INJECT1_0 = "NO";
    defparam cnt_65_add_4_7.INJECT1_1 = "NO";
    CCU2D cnt_65_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n611), 
          .COUT(n612), .S0(n57[3]), .S1(n57[4]));   // g:/fpga/mxo2/system/baud_generator.v(20[10:20])
    defparam cnt_65_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_65_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_65_add_4_5.INJECT1_0 = "NO";
    defparam cnt_65_add_4_5.INJECT1_1 = "NO";
    LUT4 i2_2_lut (.A(cnt[7]), .B(cnt[5]), .Z(n6)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i701_2_lut (.A(cnt[5]), .B(cnt[4]), .Z(n720)) /* synthesis lut_function=(A (B)) */ ;
    defparam i701_2_lut.init = 16'h8888;
    
endmodule
