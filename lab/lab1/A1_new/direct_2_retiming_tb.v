/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-13 15:36:43
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:05:55
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A1_new/direct_2_retiming_tb.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */

`timescale 1 ns/ 1 ns
module filter_original_test();
    parameter clk_period      = 20; //???????????????????:1.6MHz
    parameter clk_half_period = clk_period/2;
    parameter data_num        = 2000;  //???????????
    
    reg clk;
    reg rst;
    reg signed [16:0] data_in;
    wire signed [16:0] data_out;
    reg signed [16:0] in[data_num:0];
    integer i, fp_w;
    reg signed [16:0] out[data_num:0];
    
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
