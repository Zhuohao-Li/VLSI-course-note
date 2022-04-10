// +FHDR------------------------------------------------------------------------
// Copyright (c) 2019, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : filter_original.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Lv Dongxu
// AUTHORS EMAIL : lvdongxu@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2019/3/24           Lv Dongxu     The Main original Filter Module without optimization
// 0.2               2019/3/28           Lv Dongxu     Bitwidth Change
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
module filter_original( 
    input clk, // clock signal
    input rst, // reset signal
    input signed [9:0] data_in1, // input data   
    output signed [23:0] data_out // output data
    );
    
    // define the internal variables 
    wire signed [9:0] reg_out[17:0]; // output port for each register
    wire signed [23:0] mul_out[18:0]; // output port for each multiplier
    wire signed [23:0] add_out[17:0]; // output port for each adder

    // coefficient determination with the calculation in MATLAB
    wire signed [8:0] coe[9:0]; // coefficient for the multiplier
    assign coe[0] = 9'b000000001;                                                
    assign coe[1] =	9'b000000000;                                                
	assign coe[2] =	9'b111111100;                                                
	assign coe[3] =	9'b000000000;                                                
	assign coe[4] =	9'b000001010;                                                
	assign coe[5] =	9'b000000000;                                                
	assign coe[6] =	9'b111101001;                                                
	assign coe[7] =	9'b000000000;                                                
	assign coe[8] =	9'b001010000;                                                
	assign coe[9] =	9'b010000000;                                                
    // connect all the module, including multipliers, adds, registers, the input and the output port
    // At first, we need to complete the task to shift the add_out[17] to get the data_out
    //assign data_out = add_out[17];
    
    reg[23:0] zjm;
    assign data_out=zjm;
    always@(posedge clk or negedge rst) 
    begin
        if (!rst) begin
            zjm <= 0; // reset the register as long as the rst signal comes
        end
        else begin
            zjm <= add_out[17]; // the register exports the data on the rising edge of the clock
        end
    end
    
    wire signed [9:0] data_in;
    register_9bits R101(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(data_in1), // input data from input port or previous registers  
        .output_data(data_in) // output data for the mul module or next registers
    );
    
    
    // Next, we can connect the complex wires one order by another
    // original order 
    register_9bits R0(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(data_in), // input data from input port or previous registers  
        .output_data(reg_out[0]) // output data for the mul module or next registers
    );
    mul M0(
        .data1(coe[0]),
        .data2(data_in),
        .result(mul_out[0])
    );
    // 1st order
    register_9bits R1(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[0]), // input data from input port or previous registers  
        .output_data(reg_out[1]) // output data for the mul module or next registers
    );
    mul M1(
        .data1(coe[1]),
        .data2(reg_out[0]),
        .result(mul_out[1])
    );
    add A1(
        .data1(mul_out[0]),
        .data2(mul_out[1]),
        .result(add_out[0])
    );
    // 2nd order
    register_9bits R2(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[1]), // input data from input port or previous registers  
        .output_data(reg_out[2]) // output data for the mul module or next registers
    );
    mul M2(
        .data1(coe[2]),
        .data2(reg_out[1]),
        .result(mul_out[2])
    );
    add A2(
        .data1(add_out[0]),
        .data2(mul_out[2]),
        .result(add_out[1])
    );
    // 3rd order
    register_9bits R3(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[2]), // input data from input port or previous registers  
        .output_data(reg_out[3]) // output data for the mul module or next registers
    );
    mul M3(
        .data1(coe[3]),
        .data2(reg_out[2]),
        .result(mul_out[3])
    );
    add A3(
        .data1(add_out[1]),
        .data2(mul_out[3]),
        .result(add_out[2])
    );
    // 4th order
    register_9bits R4(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[3]), // input data from input port or previous registers  
        .output_data(reg_out[4]) // output data for the mul module or next registers
    );
    mul M4(
        .data1(coe[4]),
        .data2(reg_out[3]),
        .result(mul_out[4])
    );
    add A4(
        .data1(add_out[2]),
        .data2(mul_out[4]),
        .result(add_out[3])
    );
    // 5th order
    register_9bits R5(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[4]), // input data from input port or previous registers  
        .output_data(reg_out[5]) // output data for the mul module or next registers
    );
    mul M5(
        .data1(coe[5]),
        .data2(reg_out[4]),
        .result(mul_out[5])
    );
    add A5(
        .data1(add_out[3]),
        .data2(mul_out[5]),
        .result(add_out[4])
    );
    // 6th order
    register_9bits R6(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[5]), // input data from input port or previous registers  
        .output_data(reg_out[6]) // output data for the mul module or next registers
    );
    mul M6(
        .data1(coe[6]),
        .data2(reg_out[5]),
        .result(mul_out[6])
    );
    add A6(
        .data1(add_out[4]),
        .data2(mul_out[6]),
        .result(add_out[5])
    );
    // 7th order
    register_9bits R7(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[6]), // input data from input port or previous registers  
        .output_data(reg_out[7]) // output data for the mul module or next registers
    );
    mul M7(
        .data1(coe[7]),
        .data2(reg_out[6]),
        .result(mul_out[7])
    );
    add A7(
        .data1(add_out[5]),
        .data2(mul_out[7]),
        .result(add_out[6])
    );
    // 8th order
    register_9bits R8(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[7]), // input data from input port or previous registers  
        .output_data(reg_out[8]) // output data for the mul module or next registers
    );
    mul M8(
        .data1(coe[8]),
        .data2(reg_out[7]),
        .result(mul_out[8])
    );
    add A8(
        .data1(add_out[6]),
        .data2(mul_out[8]),
        .result(add_out[7])
    );
    // 9th order
    register_9bits R9(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[8]), // input data from input port or previous registers  
        .output_data(reg_out[9]) // output data for the mul module or next registers
    );
    mul M9(
        .data1(coe[9]),
        .data2(reg_out[8]),
        .result(mul_out[9])
    );
    add A9(
        .data1(add_out[7]),
        .data2(mul_out[9]),
        .result(add_out[8])
    );
    // 10th order
    register_9bits R10(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[9]), // input data from input port or previous registers  
        .output_data(reg_out[10]) // output data for the mul module or next registers
    );
    mul M10(
        .data1(coe[8]),
        .data2(reg_out[9]),
        .result(mul_out[10])
    );
    add A10(
        .data1(add_out[8]),
        .data2(mul_out[10]),
        .result(add_out[9])
    );
    // 11st order
    register_9bits R11(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[10]), // input data from input port or previous registers  
        .output_data(reg_out[11]) // output data for the mul module or next registers
    );
    mul M11(
        .data1(coe[7]),
        .data2(reg_out[10]),
        .result(mul_out[11])
    );
    add A11(
        .data1(add_out[9]),
        .data2(mul_out[11]),
        .result(add_out[10])
    );
    // 12nd order
    register_9bits R12(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[11]), // input data from input port or previous registers  
        .output_data(reg_out[12]) // output data for the mul module or next registers
    );
    mul M12(
        .data1(coe[6]),
        .data2(reg_out[11]),
        .result(mul_out[12])
    );
    add A12(
        .data1(add_out[10]),
        .data2(mul_out[12]),
        .result(add_out[11])
    );
    // 13rd order
    register_9bits R13(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[12]), // input data from input port or previous registers  
        .output_data(reg_out[13]) // output data for the mul module or next registers
    );
    mul M13(
        .data1(coe[5]),
        .data2(reg_out[12]),
        .result(mul_out[13])
    );
    add A13(
        .data1(add_out[11]),
        .data2(mul_out[13]),
        .result(add_out[12])
    );
    // 14th order
    register_9bits R14(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[13]), // input data from input port or previous registers  
        .output_data(reg_out[14]) // output data for the mul module or next registers
    );
    mul M14(
        .data1(coe[4]),
        .data2(reg_out[13]),
        .result(mul_out[14])
    );
    add A14(
        .data1(add_out[12]),
        .data2(mul_out[14]),
        .result(add_out[13])
    );
    // 15th order
    register_9bits R15(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[14]), // input data from input port or previous registers  
        .output_data(reg_out[15]) // output data for the mul module or next registers
    );
    mul M15(
        .data1(coe[3]),
        .data2(reg_out[14]),
        .result(mul_out[15])
    );
    add A15(
        .data1(add_out[13]),
        .data2(mul_out[15]),
        .result(add_out[14])
    );
    // 16th order
    register_9bits R16(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[15]), // input data from input port or previous registers  
        .output_data(reg_out[16]) // output data for the mul module or next registers
    );
    mul M16(
        .data1(coe[2]),
        .data2(reg_out[15]),
        .result(mul_out[16])
    );
    add A16(
        .data1(add_out[14]),
        .data2(mul_out[16]),
        .result(add_out[15])
    );
    // 17th order
    register_9bits R17(
        .clk(clk), // clock signal
        .rst(rst), // reset signal
        .input_data(reg_out[16]), // input data from input port or previous registers  
        .output_data(reg_out[17]) // output data for the mul module or next registers
    );
    mul M17(
        .data1(coe[1]),
        .data2(reg_out[16]),
        .result(mul_out[17])
    );
    add A17(
        .data1(add_out[15]),
        .data2(mul_out[17]),
        .result(add_out[16])
    );
    // 18th order
    mul M18(
        .data1(coe[0]),
        .data2(reg_out[17]),
        .result(mul_out[18])
    );
    add A18(
        .data1(add_out[16]),
        .data2(mul_out[18]),
        .result(add_out[17])
    );

endmodule