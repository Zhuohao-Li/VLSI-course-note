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
// 0.1               2022/4/11           Zhuohao Lee    The Main original Filter Module without optimization
// -----------------------------------------------------------------------------
// KEYWORDS : Filter, 1st Edition
// -----------------------------------------------------------------------------
// PURPOSE : Lowpass Filter Module
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy : rst
// Clock Domains : clk
// Critical Timing : N/A
// Test Features : N/A
// Asynchronous I/F : N/A
// Scan Methodology : N/A
// Instantiations : N/A
// Other :
//
// -FHDR------------------------------------------------------------------------
`timescale 1 ns/ 1 ns
module filter_original(input clk,                      // clock signal
                       input rst,                      // reset signal
                       input signed [7:0] data_in,     // input data
                       output signed [18:0] data_out); // output data
    
    // define the internal variables
    wire signed [7:0] reg_out[16:0]; // output port for each register
    wire signed [18:0] mul_out[32:0]; // output port for each multiplier
    wire signed [18:0] add_out[32:0]; // output port for each adder
    
    // coefficient determination with the calculation in MATLAB
    wire signed [9:0] coe_a[17:1]; // coefficient for the multiplier
    assign coe_a[1]  = 	10'b0010000000;
    assign coe_a[2]  = 	10'b1101110011;
    assign coe_a[3]  = 	10'b0101001100;
    assign coe_a[4]  = 	10'b1011010110;
    assign coe_a[5]  = 	10'b0111100101;
    assign coe_a[6]  = 	10'b1010010111;
    assign coe_a[7]  = 	10'b0110101010;
    assign coe_a[8]  = 	10'b1011111010;
    assign coe_a[9]  = 	10'b0011111010;
    assign coe_a[10] = 	10'b1110000100;
    assign coe_a[11] = 	10'b0001100000;
    assign coe_a[12] = 	10'b1111011011;
    assign coe_a[13] = 	10'b0000011000;
    assign coe_a[14] = 	10'b1111111010;
    assign coe_a[15] = 	10'b0000000011;
    assign coe_a[16] = 	10'b0000000000;
    assign coe_a[17] = 	10'b0000000000; // So I don't design 34th MUL
    wire signed [9:0] coe_b[16:0]; // coefficient for the multiplier
    assign coe_b[0]  = 	10'b0000000110;
    assign coe_b[1]  = 	10'b0000000000;
    assign coe_b[2]  = 	10'b1111010010;
    assign coe_b[3]  = 	10'b0000000000;
    assign coe_b[4]  = 	10'b0000000000;
    assign coe_b[5]  = 	10'b0000000000;
    assign coe_b[6]  = 	10'b1010111110;
    assign coe_b[7]  = 	10'b0000000000;
    assign coe_b[8]  = 	10'b0110010011;
    assign coe_b[9]  = 	10'b0000000000;
    assign coe_b[10] = 	10'b1010111110;
    assign coe_b[11] = 	10'b0000000000;
    assign coe_b[12] = 	10'b0010100001;
    assign coe_b[13] = 	10'b0000000000;
    assign coe_b[14] = 	10'b1111010010;
    assign coe_b[15] = 	10'b0000000000;
    assign coe_b[16] = 	10'b0000000110;
    // connect all the module, including multipliers, adds, registers, the input and the output port
    // At first, we need to complete the task to shift the add_out[17] to get the data_out
    //assign data_out = add_out[17];
    
    reg[18:0] lzh;
    assign data_out = lzh;
    always@(posedge clk or negedge rst)
    begin
        if (!rst) begin
            lzh <= 0; // reset the register as long as the rst signal comes
        end
        else begin
            lzh <= add_out[31]; // the register exports the data on the rising edge of the clock
        end
    end
    
    wire signed [7:0] data_in1;
    register_8bits R101(
    .clk(clk), // clock signal
    .rst(rst), // reset signal
    .input_data(data_in), // input data from input port or previous registers
    .output_data(data_in1) // output data for the mul module or next registers
    );
    
    wire signed [18:0] data_in_1;
    assign data_in_1 = (data_in1[7] == 1'b0) ? {11'b00000000000, data_in1} : {11'b11111111111, data_in1};
    
    
    add A_input(
    .data1(data_in_1),
    .data2(add_out[30]),
    .result(add_out[32])
    );
    
    
    mul M_b0(
    .data1(add_out[32]),
    .data2(coe_b[0]),
    .result(mul_out[0])
    );
    register_8bits R0(
    .clk(clk),
    .rst(rst),
    .input_data(add_out[32]),
    .output_data(reg_out[0])
    );
    
    mul M_b1(
    .data1(reg_out[0]),
    .data2(coe_b[1]),
    .result(mul_out[1])
    );
    mul M_a1(
    .data1(reg_out[0]),
    .data2(coe_a[1]),
    .result(mul_out[0])
    );
    add A_b1(
    .data1(mul_out[1]),
    .data2(mul_out[32]),
    .result(add_out[1])
    );
    add A_a1(
    .data1(mul_out[0]),
    .data2(add_out[32]),
    .result(add_out[0])
    );
    
    register_8bits R1(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[0]),
    .output_data(reg_out[1])
    );
    mul M_b2(
    .data1(reg_out[1]),
    .data2(coe_b[2]),
    .result(mul_out[3])
    );
    mul M_a2(
    .data1(reg_out[1]),
    .data2(coe_a[2]),
    .result(mul_out[2])
    );
    add A_b2(
    .data1(mul_out[3]),
    .data2(add_out[1]),
    .result(add_out[3])
    );
    add A_a2(
    .data1(mul_out[2]),
    .data2(add_out[0]),
    .result(add_out[2])
    );
    
    
    register_8bits R2(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[1]),
    .output_data(reg_out[2])
    );
    mul M_b3(
    .data1(reg_out[2]),
    .data2(coe_b[3]),
    .result(mul_out[5])
    );
    mul M_a3(
    .data1(reg_out[2]),
    .data2(coe_a[3]),
    .result(mul_out[4])
    );
    add A_b3(
    .data1(mul_out[5]),
    .data2(add_out[3]),
    .result(add_out[5])
    );
    add A_a3(
    .data1(mul_out[4]),
    .data2(add_out[2]),
    .result(add_out[4])
    );
    
    register_8bits R3(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[2]),
    .output_data(reg_out[3])
    );
    mul M_b4(
    .data1(reg_out[3]),
    .data2(coe_b[4]),
    .result(mul_out[7])
    );
    mul M_a4(
    .data1(reg_out[3]),
    .data2(coe_a[4]),
    .result(mul_out[6])
    );
    add A_b4(
    .data1(mul_out[7]),
    .data2(add_out[5]),
    .result(add_out[7])
    );
    add A_a4(
    .data1(mul_out[6]),
    .data2(add_out[4]),
    .result(add_out[6])
    );
    
    register_8bits R4(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[3]),
    .output_data(reg_out[4])
    );
    mul M_b5(
    .data1(reg_out[4]),
    .data2(coe_b[5]),
    .result(mul_out[9])
    );
    mul M_a5(
    .data1(reg_out[4]),
    .data2(coe_a[5]),
    .result(mul_out[8])
    );
    add A_b5(
    .data1(mul_out[9]),
    .data2(add_out[7]),
    .result(add_out[9])
    );
    add A_a5(
    .data1(mul_out[8]),
    .data2(add_out[6]),
    .result(add_out[8])
    );
    
    register_8bits R5(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[4]),
    .output_data(reg_out[5])
    );
    mul M_b6(
    .data1(reg_out[5]),
    .data2(coe_b[6]),
    .result(mul_out[11])
    );
    mul M_a6(
    .data1(reg_out[5]),
    .data2(coe_a[6]),
    .result(mul_out[10])
    );
    add A_b6(
    .data1(mul_out[11]),
    .data2(add_out[9]),
    .result(add_out[11])
    );
    add A_a6(
    .data1(mul_out[10]),
    .data2(add_out[8]),
    .result(add_out[10])
    );
    
    
    register_8bits R6(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[5]),
    .output_data(reg_out[6])
    );
    mul M_b7(
    .data1(reg_out[6]),
    .data2(coe_b[7]),
    .result(mul_out[13])
    );
    mul M_a7(
    .data1(reg_out[6]),
    .data2(coe_a[7]),
    .result(mul_out[12])
    );
    add A_b7(
    .data1(mul_out[13]),
    .data2(add_out[11]),
    .result(add_out[13])
    );
    add A_a7(
    .data1(mul_out[12]),
    .data2(add_out[10]),
    .result(add_out[12])
    );
    
    
    register_8bits R7(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[6]),
    .output_data(reg_out[7])
    );
    mul M_b8(
    .data1(reg_out[7]),
    .data2(coe_b[8]),
    .result(mul_out[15])
    );
    mul M_a8(
    .data1(reg_out[7]),
    .data2(coe_a[8]),
    .result(mul_out[14])
    );
    add A_b8(
    .data1(mul_out[15]),
    .data2(add_out[13]),
    .result(add_out[15])
    );
    add A_a8(
    .data1(mul_out[14]),
    .data2(add_out[12]),
    .result(add_out[14])
    );
    
    
    register_8bits R8(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[7]),
    .output_data(reg_out[8])
    );
    mul M_b9(
    .data1(reg_out[8]),
    .data2(coe_b[9]),
    .result(mul_out[17])
    );
    mul M_a9(
    .data1(reg_out[8]),
    .data2(coe_a[9]),
    .result(mul_out[16])
    );
    add A_b9(
    .data1(mul_out[17]),
    .data2(add_out[15]),
    .result(add_out[17])
    );
    add A_a9(
    .data1(mul_out[16]),
    .data2(add_out[14]),
    .result(add_out[16])
    );
    
    
    register_8bits R9(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[8]),
    .output_data(reg_out[9])
    );
    mul M_b10(
    .data1(reg_out[9]),
    .data2(coe_b[10]),
    .result(mul_out[19])
    );
    mul M_a10(
    .data1(reg_out[9]),
    .data2(coe_a[10]),
    .result(mul_out[18])
    );
    add A_b10(
    .data1(mul_out[19]),
    .data2(add_out[17]),
    .result(add_out[19])
    );
    add A_a10(
    .data1(mul_out[18]),
    .data2(add_out[16]),
    .result(add_out[18])
    );
    
    
    register_8bits R10(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[9]),
    .output_data(reg_out[10])
    );
    mul M_b11(
    .data1(reg_out[10]),
    .data2(coe_b[11]),
    .result(mul_out[21])
    );
    mul M_a11(
    .data1(reg_out[10]),
    .data2(coe_a[11]),
    .result(mul_out[20])
    );
    add A_b11(
    .data1(mul_out[21]),
    .data2(add_out[19]),
    .result(add_out[21])
    );
    add A_a11(
    .data1(mul_out[20]),
    .data2(add_out[18]),
    .result(add_out[20])
    );
    
    
    register_8bits R11(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[10]),
    .output_data(reg_out[11])
    );
    mul M_b12(
    .data1(reg_out[11]),
    .data2(coe_b[12]),
    .result(mul_out[23])
    );
    mul M_a12(
    .data1(reg_out[11]),
    .data2(coe_a[12]),
    .result(mul_out[22])
    );
    add A_b12(
    .data1(mul_out[23]),
    .data2(add_out[21]),
    .result(add_out[23])
    );
    add A_a12(
    .data1(mul_out[22]),
    .data2(add_out[20]),
    .result(add_out[22])
    );
    
    
    register_8bits R12(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[11]),
    .output_data(reg_out[12])
    );
    mul M_b13(
    .data1(reg_out[12]),
    .data2(coe_b[13]),
    .result(mul_out[25])
    );
    mul M_a13(
    .data1(reg_out[12]),
    .data2(coe_a[13]),
    .result(mul_out[24])
    );
    add A_b13(
    .data1(mul_out[25]),
    .data2(add_out[23]),
    .result(add_out[25])
    );
    add A_a13(
    .data1(mul_out[24]),
    .data2(add_out[22]),
    .result(add_out[24])
    );
    
    
    register_8bits R13(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[12]),
    .output_data(reg_out[13])
    );
    mul M_b14(
    .data1(reg_out[13]),
    .data2(coe_b[14]),
    .result(mul_out[27])
    );
    mul M_a14(
    .data1(reg_out[13]),
    .data2(coe_a[14]),
    .result(mul_out[26])
    );
    add A_b14(
    .data1(mul_out[27]),
    .data2(add_out[25]),
    .result(add_out[27])
    );
    add A_a14(
    .data1(mul_out[26]),
    .data2(add_out[24]),
    .result(add_out[26])
    );
    
    
    register_8bits R14(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[13]),
    .output_data(reg_out[14])
    );
    mul M_b15(
    .data1(reg_out[14]),
    .data2(coe_b[15]),
    .result(mul_out[29])
    );
    mul M_a15(
    .data1(reg_out[14]),
    .data2(coe_a[15]),
    .result(mul_out[28])
    );
    add A_b15(
    .data1(mul_out[29]),
    .data2(add_out[27]),
    .result(add_out[29])
    );
    add A_a15(
    .data1(mul_out[28]),
    .data2(add_out[26]),
    .result(add_out[28])
    );
    
    
    register_8bits R15(
    .clk(clk),
    .rst(rst),
    .input_data(reg_out[14]),
    .output_data(reg_out[15])
    );
    mul M_b16(
    .data1(reg_out[15]),
    .data2(coe_b[16]),
    .result(mul_out[31])
    );
    mul M_a16(
    .data1(reg_out[15]),
    .data2(coe_a[16]),
    .result(mul_out[30])
    );
    add A_b16(
    .data1(mul_out[31]),
    .data2(add_out[29]),
    .result(add_out[31])
    );
    add A_a16(
    .data1(mul_out[30]),
    .data2(add_out[28]),
    .result(add_out[30])
    );
    
    // register_8bits R_out(
    // .clk(clk),
    // .rst(rst),
    // .data_in(add_out[31]),
    // .data_out(lzh)
    // );
    
    
endmodule
