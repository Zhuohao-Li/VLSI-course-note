// +FHDR------------------------------------------------------------------------
// Copyright (c) 2022, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : filter_original_test.v
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
module filter_original_test();
    parameter clk_period      = 20; //???????????????????:1.6MHz
    parameter clk_half_period = clk_period/2;
    parameter data_num        = 2000;  //???????????
    
    reg clk;
    reg rst;
    reg signed [7:0] data_in;
    wire signed [29:0] data_out;
    reg signed [7:0] in[data_num:0];
    integer i, fp_w;
    reg signed [29:0] out[data_num:0];
    
    filter_original u(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out));
    
    initial
    begin
        $readmemb("./input.txt", in);
        fp_w    = $fopen("./output.txt","w");
        i       = 0;
        clk     = 0;
        rst     = 0;
        #30 rst = 1;
    end
    
    always
    #clk_half_period clk = ~clk;
    
    always @(posedge clk)
    begin
        data_in <= in[i];
        out[i]  <= data_out;
        $fwrite(fp_w, "%d\n", data_out);//write
        i     = i+1;
        if (i == data_num+1) $fclose(fp_w);
    end
endmodule
