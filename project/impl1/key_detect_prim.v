// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.0.396.4
// Netlist written on Mon Feb 22 11:45:01 2021
//
// Verilog Description of module key_detect
//

module key_detect (clk, rst_n, key, key_en) /* synthesis syn_module_defined=1 */ ;   // g:/fpga/mxo2/system/btn_detect.v(1[8:18])
    input clk;   // g:/fpga/mxo2/system/btn_detect.v(2[22:25])
    input rst_n;   // g:/fpga/mxo2/system/btn_detect.v(3[20:25])
    input [2:0]key;   // g:/fpga/mxo2/system/btn_detect.v(4[24:27])
    output [2:0]key_en;   // g:/fpga/mxo2/system/btn_detect.v(5[26:32])
    
    wire clk_c /* synthesis is_clock=1, SET_AS_NETWORK=clk_c */ ;   // g:/fpga/mxo2/system/btn_detect.v(2[22:25])
    
    wire GND_net, VCC_net, rst_n_c, key_c_2, key_c_1, key_c_0, key_en_c_2, 
        key_en_c_1, key_en_c_0;
    wire [15:0]cnt;   // g:/fpga/mxo2/system/btn_detect.v(9[13:16])
    
    wire n16_adj_1, n10, n11, n12, n13, n14, n15, n16, n17, 
        n18, n19, n20, n21, n22, n23, n24, n25;
    wire [15:0]cnt_15__N_22;
    
    wire key_en_2__N_41, n231, n303, n301, n15_adj_2, n300, n299, 
        n298, n297, n325, clk_c_enable_2, n10_adj_3, n195, n8, 
        n296, clk_c_enable_1, n295, n294, n17_adj_4, n349;
    
    VHI i251 (.Z(VCC_net));
    LUT4 i2_3_lut (.A(key_c_0), .B(key_c_1), .C(key_c_2), .Z(clk_c_enable_1)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // g:/fpga/mxo2/system/btn_detect.v(32[8] 34[25])
    defparam i2_3_lut.init = 16'h1010;
    CCU2D add_9_17 (.A0(cnt[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n301), 
          .S0(n10));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_17.INIT0 = 16'h5aaa;
    defparam add_9_17.INIT1 = 16'h0000;
    defparam add_9_17.INJECT1_0 = "NO";
    defparam add_9_17.INJECT1_1 = "NO";
    OB key_en_pad_2 (.I(key_en_c_2), .O(key_en[2]));   // g:/fpga/mxo2/system/btn_detect.v(5[26:32])
    FD1P3AX key_en_i3 (.D(key_en_2__N_41), .SP(clk_c_enable_1), .CK(clk_c), 
            .Q(key_en_c_2));   // g:/fpga/mxo2/system/btn_detect.v(31[8] 34[25])
    defparam key_en_i3.GSR = "ENABLED";
    FD1P3AX key_en_i2 (.D(key_en_2__N_41), .SP(clk_c_enable_2), .CK(clk_c), 
            .Q(key_en_c_1));   // g:/fpga/mxo2/system/btn_detect.v(31[8] 34[25])
    defparam key_en_i2.GSR = "ENABLED";
    FD1S3IX cnt__i1 (.D(n24), .CK(clk_c), .CD(n195), .Q(cnt[1]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i1.GSR = "ENABLED";
    CCU2D add_9_15 (.A0(cnt[13]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n300), 
          .COUT(n301), .S0(n12), .S1(n11));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_15.INIT0 = 16'h5aaa;
    defparam add_9_15.INIT1 = 16'h5aaa;
    defparam add_9_15.INJECT1_0 = "NO";
    defparam add_9_15.INJECT1_1 = "NO";
    CCU2D add_9_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n299), 
          .COUT(n300), .S0(n14), .S1(n13));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_13.INIT0 = 16'h5aaa;
    defparam add_9_13.INIT1 = 16'h5aaa;
    defparam add_9_13.INJECT1_0 = "NO";
    defparam add_9_13.INJECT1_1 = "NO";
    LUT4 i3_4_lut (.A(cnt[8]), .B(cnt[15]), .C(cnt[9]), .D(cnt[6]), 
         .Z(n8)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i4_3_lut_4_lut (.A(cnt[5]), .B(cnt[11]), .C(cnt[10]), .D(n303), 
         .Z(n10_adj_3)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i4_3_lut_4_lut.init = 16'h0100;
    CCU2D add_9_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n298), 
          .COUT(n299), .S0(n16), .S1(n15));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_11.INIT0 = 16'h5aaa;
    defparam add_9_11.INIT1 = 16'h5aaa;
    defparam add_9_11.INJECT1_0 = "NO";
    defparam add_9_11.INJECT1_1 = "NO";
    LUT4 i2_4_lut (.A(n15_adj_2), .B(cnt[4]), .C(n10_adj_3), .D(n325), 
         .Z(key_en_2__N_41)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2_4_lut.init = 16'h1000;
    CCU2D add_9_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n297), 
          .COUT(n298), .S0(n18), .S1(n17));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_9.INIT0 = 16'h5aaa;
    defparam add_9_9.INIT1 = 16'h5aaa;
    defparam add_9_9.INJECT1_0 = "NO";
    defparam add_9_9.INJECT1_1 = "NO";
    CCU2D add_9_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n296), 
          .COUT(n297), .S0(n20), .S1(n19));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_7.INIT0 = 16'h5aaa;
    defparam add_9_7.INIT1 = 16'h5aaa;
    defparam add_9_7.INJECT1_0 = "NO";
    defparam add_9_7.INJECT1_1 = "NO";
    LUT4 i73_2_lut (.A(key_c_1), .B(key_c_0), .Z(clk_c_enable_2)) /* synthesis lut_function=(!((B)+!A)) */ ;   // g:/fpga/mxo2/system/btn_detect.v(32[8] 34[25])
    defparam i73_2_lut.init = 16'h2222;
    LUT4 i1_4_lut (.A(n17_adj_4), .B(n325), .C(n15_adj_2), .D(n16_adj_1), 
         .Z(n231)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i1_4_lut.init = 16'h0004;
    LUT4 i247_3_lut_rep_3 (.A(key_c_0), .B(key_c_1), .C(key_c_2), .Z(n349)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i247_3_lut_rep_3.init = 16'h0101;
    LUT4 i1_2_lut_4_lut (.A(key_c_0), .B(key_c_1), .C(key_c_2), .D(n231), 
         .Z(n195)) /* synthesis lut_function=(A (D)+!A (B (D)+!B ((D)+!C))) */ ;
    defparam i1_2_lut_4_lut.init = 16'hff01;
    LUT4 i6_4_lut (.A(cnt[3]), .B(cnt[2]), .C(cnt[0]), .D(cnt[4]), .Z(n16_adj_1)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i6_4_lut.init = 16'hfeff;
    LUT4 i1_2_lut (.A(n21), .B(n231), .Z(cnt_15__N_22[4])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    CCU2D add_9_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n295), 
          .COUT(n296), .S0(n22), .S1(n21));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_5.INIT0 = 16'h5aaa;
    defparam add_9_5.INIT1 = 16'h5aaa;
    defparam add_9_5.INJECT1_0 = "NO";
    defparam add_9_5.INJECT1_1 = "NO";
    FD1P3AX key_en_i1 (.D(key_en_2__N_41), .SP(key_c_0), .CK(clk_c), .Q(key_en_c_0));   // g:/fpga/mxo2/system/btn_detect.v(31[8] 34[25])
    defparam key_en_i1.GSR = "ENABLED";
    FD1S3IX cnt__i0 (.D(n25), .CK(clk_c), .CD(n195), .Q(cnt[0]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i0.GSR = "ENABLED";
    LUT4 i5_2_lut (.A(cnt[13]), .B(cnt[7]), .Z(n15_adj_2)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i5_2_lut.init = 16'heeee;
    FD1S3IX cnt__i4 (.D(cnt_15__N_22[4]), .CK(clk_c), .CD(n349), .Q(cnt[4]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i4.GSR = "ENABLED";
    LUT4 i1_2_lut_adj_1 (.A(n19), .B(n231), .Z(cnt_15__N_22[6])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_1.init = 16'heeee;
    OB key_en_pad_1 (.I(key_en_c_1), .O(key_en[1]));   // g:/fpga/mxo2/system/btn_detect.v(5[26:32])
    OB key_en_pad_0 (.I(key_en_c_0), .O(key_en[0]));   // g:/fpga/mxo2/system/btn_detect.v(5[26:32])
    IB clk_pad (.I(clk), .O(clk_c));   // g:/fpga/mxo2/system/btn_detect.v(2[22:25])
    IB rst_n_pad (.I(rst_n), .O(rst_n_c));   // g:/fpga/mxo2/system/btn_detect.v(3[20:25])
    IB key_pad_2 (.I(key[2]), .O(key_c_2));   // g:/fpga/mxo2/system/btn_detect.v(4[24:27])
    IB key_pad_1 (.I(key[1]), .O(key_c_1));   // g:/fpga/mxo2/system/btn_detect.v(4[24:27])
    IB key_pad_0 (.I(key[0]), .O(key_c_0));   // g:/fpga/mxo2/system/btn_detect.v(4[24:27])
    CCU2D add_9_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n294), 
          .COUT(n295), .S0(n24), .S1(n23));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_3.INIT0 = 16'h5aaa;
    defparam add_9_3.INIT1 = 16'h5aaa;
    defparam add_9_3.INJECT1_0 = "NO";
    defparam add_9_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_2 (.A(n17), .B(n231), .Z(cnt_15__N_22[8])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_2.init = 16'heeee;
    LUT4 i7_3_lut_4_lut (.A(cnt[5]), .B(cnt[11]), .C(cnt[10]), .D(cnt[1]), 
         .Z(n17_adj_4)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i7_3_lut_4_lut.init = 16'hfffe;
    FD1S3IX cnt__i2 (.D(n23), .CK(clk_c), .CD(n195), .Q(cnt[2]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i2.GSR = "ENABLED";
    FD1S3IX cnt__i3 (.D(n22), .CK(clk_c), .CD(n195), .Q(cnt[3]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i3.GSR = "ENABLED";
    FD1S3IX cnt__i5 (.D(n20), .CK(clk_c), .CD(n195), .Q(cnt[5]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i5.GSR = "ENABLED";
    FD1S3IX cnt__i6 (.D(cnt_15__N_22[6]), .CK(clk_c), .CD(n349), .Q(cnt[6]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i6.GSR = "ENABLED";
    FD1S3IX cnt__i7 (.D(n18), .CK(clk_c), .CD(n195), .Q(cnt[7]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i7.GSR = "ENABLED";
    FD1S3IX cnt__i8 (.D(cnt_15__N_22[8]), .CK(clk_c), .CD(n349), .Q(cnt[8]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i8.GSR = "ENABLED";
    FD1S3IX cnt__i9 (.D(cnt_15__N_22[9]), .CK(clk_c), .CD(n349), .Q(cnt[9]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i9.GSR = "ENABLED";
    FD1S3IX cnt__i10 (.D(n15), .CK(clk_c), .CD(n195), .Q(cnt[10]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i10.GSR = "ENABLED";
    FD1S3IX cnt__i11 (.D(n14), .CK(clk_c), .CD(n195), .Q(cnt[11]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i11.GSR = "ENABLED";
    FD1S3IX cnt__i12 (.D(n13), .CK(clk_c), .CD(n195), .Q(cnt[12]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i12.GSR = "ENABLED";
    FD1S3IX cnt__i13 (.D(n12), .CK(clk_c), .CD(n195), .Q(cnt[13]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i13.GSR = "ENABLED";
    FD1S3IX cnt__i14 (.D(cnt_15__N_22[14]), .CK(clk_c), .CD(n349), .Q(cnt[14]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i14.GSR = "ENABLED";
    FD1S3IX cnt__i15 (.D(cnt_15__N_22[15]), .CK(clk_c), .CD(n349), .Q(cnt[15]));   // g:/fpga/mxo2/system/btn_detect.v(18[8] 25[17])
    defparam cnt__i15.GSR = "ENABLED";
    LUT4 i1_2_lut_adj_3 (.A(n16), .B(n231), .Z(cnt_15__N_22[9])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_3.init = 16'heeee;
    LUT4 i1_2_lut_adj_4 (.A(n11), .B(n231), .Z(cnt_15__N_22[14])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_4.init = 16'heeee;
    LUT4 i1_2_lut_adj_5 (.A(n10), .B(n231), .Z(cnt_15__N_22[15])) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_5.init = 16'heeee;
    CCU2D add_9_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n294), 
          .S1(n25));   // g:/fpga/mxo2/system/btn_detect.v(22[12:22])
    defparam add_9_1.INIT0 = 16'hF000;
    defparam add_9_1.INIT1 = 16'h5555;
    defparam add_9_1.INJECT1_0 = "NO";
    defparam add_9_1.INJECT1_1 = "NO";
    LUT4 i4_3_lut (.A(cnt[12]), .B(n8), .C(cnt[14]), .Z(n325)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;
    defparam i4_3_lut.init = 16'h4040;
    GSR GSR_INST (.GSR(rst_n_c));
    LUT4 i3_4_lut_adj_6 (.A(cnt[0]), .B(cnt[2]), .C(cnt[1]), .D(cnt[3]), 
         .Z(n303)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut_adj_6.init = 16'h8000;
    VLO i1 (.Z(GND_net));
    TSALL TSALL_INST (.TSALL(GND_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

