/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-18 17:45:57
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:03:03
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A1_new/dff.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */

`timescale 1ns / 1ps
module dff(input clk,
           input rst,
           input [16:0] d,
           output reg [16:0] q);
    
    
    always @(posedge clk or posedge rst)
        if (rst)
            q <= 0;
        else
            q <= d;
    
endmodule
