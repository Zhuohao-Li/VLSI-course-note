/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-18 17:45:10
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:02:47
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A1_new/direct_2_retiming.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */


`timescale 1ns / 1ps

module direct_2_retiming #(parameter i_len = 17,
                           parameter i_frac_len = 15,
                           parameter o_len = 17,
                           parameter o_frac_len = 13,
                           parameter pa_len = 10,
                           parameter num_frac_len = 12,
                           parameter den_frac_len = 7,
                           parameter mul_len = 27,
                           parameter mul_num_frac = 27,
                           parameter mul_den_frac = 22,
                           parameter add_len = 31,
                           parameter add_num_frac = 27,
                           parameter add_den_frac = 22)
                          (input wire clk,
                           input wire rst,
                           input wire[i_len-1:0] i_data,
                           output reg[o_len-1:0] o_data);
    wire [i_len-1:0] mid_data [0:16] ;
    wire [i_len-1:0] mid_data_0_delay;
    
    wire [mul_len-1:0] den_mul_p [1:14];
    reg [9:0] den_param [0:14];
    wire [mul_len-1:0] den_mul_p_delay[1:14];
    
    
    wire [mul_len-1:0] num_mul_p [0:8];
    reg [9:0] num_param [0:16];
    wire [mul_len-1:0] num_mul_p_delay[0:8];
    
    wire [add_len-1:0] den_add [0:14];
    wire [add_len-1:0] den_add_out [0:13];
    wire [add_len-1:0] den_add_out_delay[2:13];
    
    wire [add_len-1:0] num_add [0:8];
    wire [add_len-1:0] num_add_out [0:7];
    wire [add_len-1:0] num_add_out_delay_1;
    wire [add_len-1:0] num_add_out_delay [1:7];
    
    assign mid_data[0] = {den_add_out[0][add_len-1],den_add_out[0][add_den_frac],den_add_out[0][add_den_frac-1:add_den_frac-15]};
    
    always @(posedge clk)
        o_data <= {num_add_out[0][add_len-1:add_len-4],num_add_out[0][add_num_frac-1 : add_num_frac-o_frac_len]};
    
    genvar i;
    
    generate
    for (i = 0; i < 16; i = i+1) begin :delay_mid //*
    if (i == 14 | i == 15)
        dff u_dff(
        .clk(clk),
        .rst(rst),
        .d(mid_data[i]),
        .q(mid_data[i+1])
        );
    else
        assign mid_data[i+1] = mid_data[i];
    end
    endgenerate
    
    generate
    for (i = 0; i < 14; i = i+1) begin :den_mul //*
    mult_gen_0 u_mult_gen_0(
    .A(den_param[i+1]),
    .B(mid_data[i+1]),
    .P(den_mul_p[i+1])
    );
    end
    endgenerate
    
    generate
    for (i = 0; i < 14; i = i+1) begin :den_mul_delay //*
    dff_26 u_dff_26(
    .clk(clk),
    .rst(rst),
    .d(den_mul_p[i+1]),
    .q(den_mul_p_delay[i+1])
    );
    end
    endgenerate
    
    generate
    for (i = 0; i < 9; i = i+1) begin :num_mul  //*
    if (i == 0) begin
        dff u_dff(
        .clk(clk),
        .rst(rst),
        .d(mid_data[i]),
        .q(mid_data_0_delay)
        );
        mult_gen_0 u_mult_gen_0(
        .A(num_param[2*i]),
        .B(mid_data_0_delay),
        .P(num_mul_p[i])
        );
    end
    else
        mult_gen_0 u_mult_gen_0(
        .A(num_param[2*i]),
        .B(mid_data[2*i]),
        .P(num_mul_p[i])
        );
    end
    endgenerate
    
    generate
    for (i = 0; i < 9; i = i+1) begin :num_mul_delay //*
    dff_26 u_dff_26(
    .clk(clk),
    .rst(rst),
    .d(num_mul_p[i]),
    .q(num_mul_p_delay[i])
    );
    end
    endgenerate
    
    generate
    for(i = 0; i<15; i = i+1) begin : extension_den  //*
    if (i == 0)
        assign den_add[i] = {{7{i_data[i_len-1]}}, i_data,{add_den_frac-i_frac_len{1'b0}}}; //扩展小数�????
    else
        assign den_add[i] = {{4{den_mul_p_delay[i][mul_len-1]}} , den_mul_p_delay[i]};
    end
    endgenerate
    
    
    generate
    for (i = 0; i < 14; i = i+1) begin :den_add_fun  //*
    if (i == 13)
        c_addsub_0 u_c_addsub_0(
        .A(den_add[i]),
        .B(den_add[i+1]),
        .S(den_add_out[i])
        );
    else if (i == 0)
        c_addsub_0 u_c_addsub_0(
        .A(den_add[i]),
        .B(den_add_out[i+1]),
        .S(den_add_out[i])
        );
    else begin
        dff_31 u_dff_31(
        .clk(clk),
        .rst(rst),
        .d(den_add_out[i+1]),
        .q(den_add_out_delay[i+1])
        );
        c_addsub_0 u_c_addsub_0(
        .A(den_add[i]),
        .B(den_add_out_delay[i+1]),
        .S(den_add_out[i])
        );
    end
    end
    endgenerate
    
    generate
    for(i = 0; i<9; i = i+1) begin : extension_num   //*
    assign num_add[i] = {{4{num_mul_p_delay[i][mul_len-1]}} , num_mul_p_delay[i]};
    end
    endgenerate
    
    dff_31 u_dff_31(
    .clk(clk),
    .rst(rst),
    .d(num_add_out[1]),
    .q(num_add_out_delay_1)
    );
    
    generate
    for(i = 0; i<8; i = i+1) begin : num_add_fun //
    if (i == 7)
        c_addsub_0 u_c_addsub_0(
        .A(num_add[i]),
        .B(num_add[i+1]),
        .S(num_add_out[i])
        );
    else if (i == 0) begin
        dff_double_31 u_dff_double_31(
        .clk(clk),
        .rst(rst),
        .d(num_add_out_delay_1),
        .q(num_add_out_delay[i+1])
        );
        c_addsub_0 u_c_addsub_0(
        .A(num_add[i]),
        .B(num_add_out_delay[i+1]),
        .S(num_add_out[i])
        );
    end
    else begin
        dff_double_31 u_dff_double_31(
        .clk(clk),
        .rst(rst),
        .d(num_add_out[i+1]),
        .q(num_add_out_delay[i+1])
        );
        c_addsub_0 u_c_addsub_0(
        .A(num_add[i]),
        .B(num_add_out_delay[i+1]),
        .S(num_add_out[i])
        );
    end
    end
    endgenerate
    
    
endmodule
