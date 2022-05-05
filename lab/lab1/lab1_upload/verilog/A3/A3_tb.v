/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-05 16:13:38
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-23 14:00:32
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/A3/IIR_fold_tb.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */


`timescale 1 ns/ 1 ns
module filter_original_test();
    
    parameter Width           = 10;
    parameter clk_period      = 200; //����ʱ���ź����ڣ�Ƶ�ʣ�:1.6MHz
    parameter clk_half_period = clk_period/2;
    parameter data_num        = 2000;  //�������ݳ���
    
    reg clk;
    reg rst;
    reg [Width-1:0] data_in;
    wire [Width-1:0] data_out;
    reg[Width-1:0] in[data_num:0];
    integer i, fp_w;
    reg[Width-1:0] out[data_num:0];
    
    filter_original u(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out));
    
    initial
    begin
        $readmemb("./input.txt", in);
        fp_w       = $fopen("./data_out.txt","w");
        i          = 0;
        clk        = 0;
        rst        = 1;
        #10000 rst = 0;
    end
    
    always
    #clk_half_period clk = ~clk;
    
    always @(posedge clk)
    begin
        data_in <= in[i];
        out[i]  <= data_out;
        $fwrite(fp_w, "%b\n", data_out);//write
        i     = i+1;
        if (i == data_num+1) $fclose(fp_w);
    end
endmodule
