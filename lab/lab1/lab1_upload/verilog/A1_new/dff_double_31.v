/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-18 17:45:52
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:03:08
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A1_new/dff_double_31.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */

`timescale 1ns / 1ps
module dff_double_31(input clk,
                     input rst,
                     input [30:0] d,
                     output wire [30:0] q);
    
    wire [30:0] q_mid;
    
    dff_31 u_dff_31_1(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q_mid)
    );
    dff_31 u_dff_31_2(
    .clk(clk),
    .rst(rst),
    .d(q_mid),
    .q(q)
    );
endmodule
