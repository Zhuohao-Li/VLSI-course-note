// +FHDR------------------------------------------------------------------------
// Copyright (c) 2019, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : register_9bits.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Zhuohao Lee
// AUTHORS EMAIL : edith_lzh@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2022/4/11           Zhuohao Lee     8bits register
//
// -----------------------------------------------------------------------------
// KEYWORDS : 9bits register
// -----------------------------------------------------------------------------
// PURPOSE :
// -----------------------------------------------------------------------------
// REUSE ISSUES

// Reset Strategy : rst
// Clock Domains :  clk
// Critical Timing : N/A
// Test Features : N/A
// Asynchronous I/F : N/A
// Scan Methodology : N/A
// Instantiations : N/A
// Other :
//
// -FHDR------------------------------------------------------------------------
`timescale 1 ns/ 1 ns
module register_8bits(input clk,                     // clock signal
                      input rst,                     // reset signal
                      input wire[7:0] input_data,    // input data from input port or previous registers
                      output wire[7:0] output_data); // output data for the mul module or next registers
    
    reg [7:0] reg_file; // the storage space
    
    assign output_data = reg_file;
    // always@(*) begin    // to store the input data
    // reg_file = input_data;
    // end
    
    always@(posedge clk or negedge rst) begin
        if (!rst) begin
            reg_file <= 0; // reset the register as long as the rst signal comes
        end
        else begin
            reg_file <= input_data; // the register exports the data on the rising edge of the clock
        end
    end
endmodule
