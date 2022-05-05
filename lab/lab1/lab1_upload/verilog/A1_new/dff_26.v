/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-18 17:45:51
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:03:16
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A1_new/dff_26.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */

`timescale 1ns / 1ps
module dff_26(input clk,
              input rst,
              input [26:0] d,
              output reg [26:0] q);
    
    
    always @(posedge clk or posedge rst)
        if (rst)
            q <= 0;
        else
            q <= d;
    
endmodule
