// +FHDR------------------------------------------------------------------------
// Copyright (c) 2022, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : register_40bits.v
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
module register_30bits(input clk,                         // clock signal
                       input rst,                         // reset signal
                       input signed [29:0] input_data,    // input data from input port or previous registers
                       output signed [29:0] output_data); // output data for the mul module or next registers
    
    reg signed [29:0] reg_file; // the storage space
    
    assign output_data = reg_file;
    
    
    always@(posedge clk or negedge rst) begin
        if (!rst) begin
            reg_file <= 0; // reset the register as long as the rst signal comes
        end
        else begin
            reg_file <= input_data; // the register exports the data on the rising edge of the clock
        end
    end
endmodule
