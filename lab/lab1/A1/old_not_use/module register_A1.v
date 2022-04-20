/*
 * @Author: [Zhuohao Lee]
 * @Date: 2022-04-05 20:14:11
 * @LastEditors: [Zhuohao Lee]
 * @LastEditTime: 2022-04-15 22:50:10
 * @FilePath: /undefined/Users/edith_lzh/Desktop/大三下/VLSI/github/lab/lab1/code/verilog/module register_A1.v
 * @Description: edith_lzh@sjtu.edu.cn
 * yes
 * Copyright (c) 2022 by Zhuohao Lee, All Rights Reserved.
 */




module IIR_Filter_8(Data_out,
                    Data_in,
                    clk,
                    rst);
    
    parameter order         = 16;
    parameter word_size_in  = 8;
    parameter word_size_out = 2*word_size_in + 2;
    parameter b0            = 10'b0000000110;    //前馈滤波器系�?
    parameter b1            = 10'b0;
    parameter b2            = 10'b1111010010;
    parameter b3            = 10'b0;
    parameter b4            = 10'b0000000000;
    parameter b5            = 10'b0;
    parameter b6            = 10'b1010111110;
    parameter b7            = 10'b0;
    parameter b8            = 10'b0110010011;
    parameter b9            = 0;
    parameter b10           = 10'b1010111110;
    parameter b11           = 0;
    parameter b12           = 10'b0010100001;
    parameter b13           = 0;
    parameter b14           = 10'b1111010010;
    parameter b15           = 0;
    parameter b16           = 10'b0000000110;
    parameter a1            = 10'b0010000000; //反馈滤波器系�?
    parameter a2            = 10'b1101110011;
    parameter a3            = 10'b0101001100;
    parameter a4            = 10'b1011010110;
    parameter a5            = 10'b0111100101;
    parameter a6            = 10'b1010010111;
    parameter a7            = 10'b0110101010;
    parameter a8            = 10'b1011111010;
    parameter a9            = 10'b0011111010;
    parameter a10           = 10'b1110000100;
    parameter a11           = 10'b0001100000;
    parameter a12           = 10'b1111011011;
    parameter a13           = 10'b0000011000;
    parameter a14           = 10'b1111111010;
    parameter a15           = 10'b0000000011 ;
    parameter a16           = 10'b0;
    parameter a17           = 10'b0;
    
    output [word_size_out-1 : 0] Data_out;
    input [word_size_in-1 : 0] Data_in;
    input clk,rst;
    
    reg [word_size_in-1 : 0] mid [order+1:0];
    reg [4:0] count;
    
    assign Data_out = b0*mid[0]+b1*mid[1]+b2*mid[2]+b3*mid[3]+b4*mid[4]+b5*mid[5]+b6*mid[6]+b7*mid[7]+b8*mid[8]+b9*mid[9]+b10*mid[10]+b11*mid[11]+b12*mid[12]+b13*mid[13]+b14*mid[14]+b15*mid[15]+b16*mid[16];
    //assign mid[0] = Data_in-a1*mid[1]-a2*mid[2]-a3*mid[3]-a4*mid[4]-a5*mid[5]-a6*mid[6]-a7*mid[7]-a8*mid[8]-a9*mid[9]-a10*mid[10]-a11*mid[11]-a12*mid[12]-a13*mid[13]-a14*mid[14]-a[15]*mid[15]-a16*mid[16]-a17*mid[17]
    always @ (posedge clk or negedge rst)begin//移位寄存
        if (rst == 1)begin
            for(count = 0; count < order+2; count = count+1)
            begin
                mid[count]   <= 0;
                //  Data_out <= 0;
            end
        end
        else
        begin
            mid[0] = Data_in-a1*mid[1]-a2*mid[2]-a3*mid[3]-a4*mid[4]-a5*mid[5]-a6*mid[6]-a7*mid[7]-a8*mid[8]-a9*mid[9]-a10*mid[10]-a11*mid[11]-a12*mid[12]-a13*mid[13]-a14*mid[14]-a15*mid[15]-a16*mid[16]-a17*mid[17];
            for(count = 1; count < order+1; count = count+1)
            begin
                mid[count] <= mid[count-1];
            end
        end
    end
endmodule
    
