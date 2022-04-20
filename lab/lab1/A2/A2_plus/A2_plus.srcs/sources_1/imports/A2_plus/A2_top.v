/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-14 21:10:43
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-15 23:49:33
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A2/A2_plus/A2_plus.srcs/sources_1/imports/A2_plus/A2_top.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */
module A2_top (input wire clk,
               input wire rst_n,
               input wire signed [15:0] x_in,
               output wire signed[15:0] y_out);
    
    
    parameter  g0 = 8304, a10 = 13920,  a20 = 13520,
    g1 = 8304, a11 = -18712, a21 = 13818,
    g2 = 7336, a12 = -15093, a22 = 9636,
    g3 = 7335, a13 = 10575,  a23 = 9028,
    g4 = 6787, a14 = -10925, a24 = 6305,
    g5 = 6787, a15 = 6541,   a25 = 5696,
    g6 = 6538, a16 = -5482,  a26 = 3879,
    g7 = 6538, a17 = 1156,   a27 = 3597,
    b0 = 1, b1 = 0, b2 = -1�?
    
    wire signed [15:0] seg_out [7:0];
    wire signed [15:0] seg_in [7:0];
    reg signed [15:0] reg_between_seg_out[6:0];
    assign seg_in[0] = (g0 * x_in)>>14;//>>>??
    
    seg_filter seg_filter0(
    .clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[0]),
    .seg_out(seg_out[0]),
    .a1(a10),
    .a2(a20),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    ////////insert buffer
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[0] <= 0;
        else
            reg_between_seg_out[0] <= seg_out[0];
    end
    ////////
    assign seg_in[1] = (g1 * reg_between_seg_out[0])>>14;
    seg_filter seg_filter1(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[1]),
    .seg_out(seg_out[1]),
    .a1(a11),
    .a2(a21),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    ////////
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[1] <= 0;
        else
            reg_between_seg_out[1] <= seg_out[1];
    end
    ////////
    assign seg_in[2] = (g2 * reg_between_seg_out[1])>>14;
    seg_filter seg_filter2(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[2]),
    .seg_out(seg_out[2]),
    .a1(a12),
    .a2(a22),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    /////////
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[2] <= 0;
        else
            reg_between_seg_out[2] <= seg_out[2];
    end
    //////////
    assign seg_in[3] = (g3 * reg_between_seg_out[2])>>14;
    seg_filter seg_filter3(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[3]),
    .seg_out(seg_out[3]),
    .a1(a13),
    .a2(a23),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    //////////
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[3] <= 0;
        else
            reg_between_seg_out[3] <= seg_out[3];
    end
    /////////
    assign seg_in[4] = (g4 * reg_between_seg_out[3])>>14;
    seg_filter seg_filter4(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[4]),
    .seg_out(seg_out[4]),
    .a1(a14),
    .a2(a24),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    /////////
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[4] <= 0;
        else
            reg_between_seg_out[4] <= seg_out[4];
    end
    /////////
    assign seg_in[5] = (g5 * reg_between_seg_out[4])>>14;
    seg_filter seg_filter5(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[5]),
    .seg_out(seg_out[5]),
    .a1(a15),
    .a2(a25),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[5] <= 0;
        else
            reg_between_seg_out[5] <= seg_out[5];
    end
    //////////
    assign seg_in[6] = (g6 * reg_between_seg_out[5])>>14;
    seg_filter seg_filter6(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[6]),
    .seg_out(seg_out[6]),
    .a1(a16),
    .a2(a26),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    //////////
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_between_seg_out[6] <= 0;
        else
            reg_between_seg_out[6] <= seg_out[6];
    end
    /////////
    assign seg_in[7] = (g7 * reg_between_seg_out[6])>>14;
    seg_filter seg_filter7(.clk(clk),
    .rst_n(rst_n),
    .seg_in(seg_in[7]),
    .seg_out(seg_out[7]),
    .a1(a17),
    .a2(a27),
    .b0(b0),
    .b1(b1),
    .b2(b2));
    assign y_out = seg_out[7];
    
    
endmodule
