// +FHDR------------------------------------------------------------------------
// Copyright (c) 2022, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : filter_original.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Zhuohao Lee
// AUTHORS EMAIL : edith_lzh@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2022/4/11           Zhuohao Lee     Signed Fixed-point Add
// -----------------------------------------------------------------------------
// KEYWORDS : Add
// -----------------------------------------------------------------------------
// PURPOSE :
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy : N/A
// Clock Domains :  N/A
// Critical Timing : N/A
// Test Features : N/A
// Asynchronous I/F : N/A
// Scan Methodology : N/A
// Instantiations : N/A
// Other :
//
// -FHDR------------------------------------------------------------------------
`timescale 1 ns/ 1 ns
module filter_original(input clk,
                       input rst,
                       input signed [7:0] data_in,
                       output reg signed [29:0] data_out);
    
    wire signed [29:0] reg_out[17:1];
    wire signed [29:0] mul_out[33:0];
    wire signed [29:0] add_out[32:0];
    
    wire signed [21:0] coe_a[17:1];
    assign coe_a[1]  = 	1048576;
    assign coe_a[2]  = 	-1152576;
    assign coe_a[3]  = 	2719864;
    assign coe_a[4]  = 	-2445072;
    assign coe_a[5]  = 	3975960;
    assign coe_a[6]  = 	-2960048;
    assign coe_a[7]  = 	3486168;
    assign coe_a[8]  = 	-2146256;
    assign coe_a[9]  = 	2047504;
    assign coe_a[10] = 	-1016744;
    assign coe_a[11] = 	785840;
    assign coe_a[12] = 	-301880;
    assign coe_a[13] = 	193296;
    assign coe_a[14] = 	-52000;
    assign coe_a[15] = 	27072;
    assign coe_a[16] = 	-3936;
    assign coe_a[17] = 	1648;
    
    wire signed [21:0] coe_b[16:0];
    
    assign coe_b[0]  = 	1473;
    assign coe_b[1]  = 	0;
    assign coe_b[2]  = 	-11789;
    assign coe_b[3]  = 	0;
    assign coe_b[4]  = 	41260;
    assign coe_b[5]  = 	0;
    assign coe_b[6]  = 	-82520;
    assign coe_b[7]  = 	0;
    assign coe_b[8]  = 	103150;
    assign coe_b[9]  = 	0;
    assign coe_b[10] = 	-82520;
    assign coe_b[11] = 	0;
    assign coe_b[12] = 	41260;
    assign coe_b[13] = 	0;
    assign coe_b[14] = 	-11789;
    assign coe_b[15] = 	0;
    assign coe_b[16] = 	1474;
    
    
    always@(posedge clk or negedge rst)
    begin
        if (!rst) begin
            data_out <= 0;
        end
        else begin
            data_out <= add_out[31];
        end
    end
    
    wire signed [29:0] data_in1;
    assign data_in1 = (data_in[7] == 1'b0) ? {22'b0, data_in} : {22'b1111111111111111111111, data_in};
    wire signed [29:0] data_in2;
    register_30bits R0(
    .clk(clk),
    .rst(rst),
    .input_data(data_in1),
    .output_data(data_in2)
    );
    
    add add_a0(
    .data1(data_in2),
    .data2(add_out[1]),
    .result(add_out[0])
    );
    add add_a1(
    .data1(mul_out[0]),
    .data2(add_out[2]),
    .result(add_out[1])
    );
    add add_a2(
    .data1(mul_out[1]),
    .data2(add_out[3]),
    .result(add_out[2])
    );
    add add_a3(
    .data1(mul_out[2]),
    .data2(add_out[4]),
    .result(add_out[3])
    );
    add add_a4(
    .data1(mul_out[3]),
    .data2(add_out[5]),
    .result(add_out[4])
    );
    add add_a5(
    .data1(mul_out[4]),
    .data2(add_out[6]),
    .result(add_out[5])
    );
    add add_a6(
    .data1(mul_out[5]),
    .data2(add_out[7]),
    .result(add_out[6])
    );
    add add_a7(
    .data1(mul_out[6]),
    .data2(add_out[8]),
    .result(add_out[7])
    );
    add add_a8(
    .data1(mul_out[7]),
    .data2(add_out[9]),
    .result(add_out[8])
    );
    add add_a9(
    .data1(mul_out[8]),
    .data2(add_out[10]),
    .result(add_out[9])
    );
    add add_a10(
    .data1(mul_out[9]),
    .data2(add_out[11]),
    .result(add_out[10])
    );
    add add_a11(
    .data1(mul_out[10]),
    .data2(add_out[12]),
    .result(add_out[11])
    );
    add add_a12(
    .data1(mul_out[11]),
    .data2(add_out[13]),
    .result(add_out[12])
    );
    add add_a13(
    .data1(mul_out[12]),
    .data2(add_out[14]),
    .result(add_out[13])
    );
    add add_a14(
    .data1(mul_out[13]),
    .data2(add_out[15]),
    .result(add_out[14])
    );
    add add_a15(
    .data1(mul_out[14]),
    .data2(add_out[32]),
    .result(add_out[15])
    );
    add add_a16(
    .data1(mul_out[16]),
    .data2(mul_out[17]),
    .result(add_out[16])
    );
    add add_a17(
    .data1(mul_out[18]),
    .data2(add_out[16]),
    .result(add_out[17])
    );
    add add_a18(
    .data1(mul_out[19]),
    .data2(add_out[17]),
    .result(add_out[18])
    );
    add add_a19(
    .data1(mul_out[20]),
    .data2(add_out[18]),
    .result(add_out[19])
    );
    add add_a20(
    .data1(mul_out[21]),
    .data2(add_out[19]),
    .result(add_out[20])
    );
    add add_a21(
    .data1(mul_out[22]),
    .data2(add_out[20]),
    .result(add_out[21])
    );
    add add_a22(
    .data1(mul_out[23]),
    .data2(add_out[21]),
    .result(add_out[22])
    );
    add add_a23(
    .data1(mul_out[24]),
    .data2(add_out[22]),
    .result(add_out[23])
    );
    add add_a24(
    .data1(mul_out[25]),
    .data2(add_out[23]),
    .result(add_out[24])
    );
    add add_a25(
    .data1(mul_out[26]),
    .data2(add_out[24]),
    .result(add_out[25])
    );
    add add_a26(
    .data1(mul_out[27]),
    .data2(add_out[25]),
    .result(add_out[26])
    );
    add add_a27(
    .data1(mul_out[28]),
    .data2(add_out[26]),
    .result(add_out[27])
    );
    add add_a28(
    .data1(mul_out[29]),
    .data2(add_out[27]),
    .result(add_out[28])
    );
    add add_a29(
    .data1(mul_out[30]),
    .data2(add_out[28]),
    .result(add_out[29])
    );
    add add_a30(
    .data1(mul_out[31]),
    .data2(add_out[29]),
    .result(add_out[30])
    );
    add add_a31(
    .data1(mul_out[32]),
    .data2(add_out[30]),
    .result(add_out[31])
    );
    register_30bits R1(
    .clk(clk),
    .rst(rst),
    .input_data(add_out[0]),
    .output_data(reg_out[1])
    );
    register_30bits R2(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[1]),
    .output_data(reg_out[2])
    );
    register_30bits R3(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[2]),
    .output_data(reg_out[3])
    );
    register_30bits R4(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[3]),
    .output_data(reg_out[4])
    );
    register_30bits R5(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[4]),
    .output_data(reg_out[5])
    );
    register_30bits R6(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[5]),
    .output_data(reg_out[6])
    );
    register_30bits R7(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[6]),
    .output_data(reg_out[7])
    );
    register_30bits R8(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[7]),
    .output_data(reg_out[8])
    );
    register_30bits R9(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[8]),
    .output_data(reg_out[9])
    );
    register_30bits R10(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[9]),
    .output_data(reg_out[10])
    );
    register_30bits R11(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[10]),
    .output_data(reg_out[11])
    );
    register_30bits R12(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[11]),
    .output_data(reg_out[12])
    );
    register_30bits R13(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[12]),
    .output_data(reg_out[13])
    );
    register_30bits R14(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[13]),
    .output_data(reg_out[14])
    );
    register_30bits R15(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[14]),
    .output_data(reg_out[15])
    );
    register_30bits R16(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[15]),
    .output_data(reg_out[16])
    );
    mul M0(
    .data1(coe_a[1]),
    .data2(reg_out[1]),
    .result(mul_out[0])
    );
    mul M1(
    .data1(coe_a[2]),
    .data2(reg_out[2]),
    .result(mul_out[1])
    );
    mul M2(
    .data1(coe_a[3]),
    .data2(reg_out[3]),
    .result(mul_out[2])
    );
    mul M3(
    .data1(coe_a[4]),
    .data2(reg_out[4]),
    .result(mul_out[3])
    );
    mul M4(
    .data1(coe_a[5]),
    .data2(reg_out[5]),
    .result(mul_out[4])
    );
    mul M5(
    .data1(coe_a[6]),
    .data2(reg_out[6]),
    .result(mul_out[5])
    );
    mul M6(
    .data1(coe_a[7]),
    .data2(reg_out[7]),
    .result(mul_out[6])
    );
    mul M7(
    .data1(coe_a[8]),
    .data2(reg_out[8]),
    .result(mul_out[7])
    );
    mul M8(
    .data1(coe_a[9]),
    .data2(reg_out[9]),
    .result(mul_out[8])
    );
    mul M9(
    .data1(coe_a[10]),
    .data2(reg_out[10]),
    .result(mul_out[9])
    );
    mul M10(
    .data1(coe_a[11]),
    .data2(reg_out[11]),
    .result(mul_out[10])
    );
    mul M11(
    .data1(coe_a[12]),
    .data2(reg_out[12]),
    .result(mul_out[11])
    );
    mul M12(
    .data1(coe_a[13]),
    .data2(reg_out[13]),
    .result(mul_out[12])
    );
    mul M13(
    .data1(coe_a[14]),
    .data2(reg_out[14]),
    .result(mul_out[13])
    );
    mul M14(
    .data1(coe_a[15]),
    .data2(reg_out[15]),
    .result(mul_out[14])
    );
    mul M15(
    .data1(coe_a[16]),
    .data2(reg_out[16]),
    .result(mul_out[15])
    );
    mul M16(
    .data1(coe_b[16]),
    .data2(reg_out[16]),
    .result(mul_out[16])
    );
    mul M17(
    .data1(coe_b[15]),
    .data2(reg_out[15]),
    .result(mul_out[17])
    );
    mul M18(
    .data1(coe_b[14]),
    .data2(reg_out[14]),
    .result(mul_out[18])
    );
    mul M19(
    .data1(coe_b[13]),
    .data2(reg_out[13]),
    .result(mul_out[19])
    );
    mul M20(
    .data1(coe_b[12]),
    .data2(reg_out[12]),
    .result(mul_out[20])
    );
    mul M21(
    .data1(coe_b[11]),
    .data2(reg_out[11]),
    .result(mul_out[21])
    );
    mul M22(
    .data1(coe_b[10]),
    .data2(reg_out[10]),
    .result(mul_out[22])
    );
    mul M23(
    .data1(coe_b[9]),
    .data2(reg_out[9]),
    .result(mul_out[23])
    );
    mul M24(
    .data1(coe_b[8]),
    .data2(reg_out[8]),
    .result(mul_out[24])
    );
    mul M25(
    .data1(coe_b[7]),
    .data2(reg_out[7]),
    .result(mul_out[25])
    );
    mul M26(
    .data1(coe_b[6]),
    .data2(reg_out[6]),
    .result(mul_out[26])
    );
    mul M27(
    .data1(coe_b[5]),
    .data2(reg_out[5]),
    .result(mul_out[27])
    );
    mul M28(
    .data1(coe_b[4]),
    .data2(reg_out[4]),
    .result(mul_out[28])
    );
    mul M29(
    .data1(coe_b[3]),
    .data2(reg_out[3]),
    .result(mul_out[29])
    );
    mul M30(
    .data1(coe_b[2]),
    .data2(reg_out[2]),
    .result(mul_out[30])
    );
    mul M31(
    .data1(coe_b[1]),
    .data2(reg_out[1]),
    .result(mul_out[31])
    );
    mul M32(
    .data1(coe_b[0]),
    .data2(add_out[0]),
    .result(mul_out[32])
    );
    // complement
    mul M33(
    .data1(coe_a[17]),
    .data2(reg_out[17]),
    .result(mul_out[33])
    );
    register_30bits R17(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[16]),
    .output_data(reg_out[17])
    );
    add add_a32(
    .data1(mul_out[33]),
    .data2(mul_out[15]),
    .result(add_out[32])
    );
    
endmodule
