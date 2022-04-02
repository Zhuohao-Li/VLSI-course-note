`timescale 1ns/1ps
//-------------------------------------------------------
//   IIR滤波器极点系数模块，结构与FIR滤波器相同
//-------------------------------------------------------
module pole
(
    input rst,                 //高电平有效复位信号
    input clk,                 //系统时钟2kHz
    input signed [11:0] Yin,   //采样数据输入2kHz
    output signed [25:0] Yout  //极点系数模块输出
);

//-------------------------------------------------------
//   数据存入移位寄存器中
//-------------------------------------------------------
reg signed [11:0] Yin_reg [6:0];
reg [3:0] i,j;

always @ (posedge clk or posedge rst)
    if (rst) begin
        for (i=0; i<7; i=i+1'b1)
            Yin_reg[i] <= 'd0;
    end
    else begin
        for (j=0; j<6; j=j+1'b1)
            Yin_reg[j+1] <= Yin_reg[j];
        Yin_reg[0] <= Yin;
    end

//-------------------------------------------------------
//   滤波器系数定义，12bit量化
//-------------------------------------------------------
wire signed [11:0] coe [7:0]; 
//assign coe[0] = 'd512;  //y(n)系数，此处无需使用
assign coe[1] = -12'd922;
assign coe[2] =  12'd1163;
assign coe[3] = -12'd811;
assign coe[4] =  12'd412;
assign coe[5] = -12'd122;
assign coe[6] =  12'd24;
assign coe[7] = -12'd2;

//-------------------------------------------------------
//   与对应系数做乘法；使用乘法器IP核
//-------------------------------------------------------
wire signed [22:0] Mult_reg [6:0];  //不可能出现最大负值，23bit即可

mult_gen_0 m0
(
    .A  (coe[1]),
    .B  (Yin_reg[0]),
    .P  (Mult_reg[0])
);
mult_gen_0 m1
(
    .A  (coe[2]),
    .B  (Yin_reg[1]),
    .P  (Mult_reg[1])
);
mult_gen_0 m2
(
    .A  (coe[3]),
    .B  (Yin_reg[2]),
    .P  (Mult_reg[2])
);
mult_gen_0 m3
(
    .A  (coe[4]),
    .B  (Yin_reg[3]),
    .P  (Mult_reg[3])
);
mult_gen_0 m4
(
    .A  (coe[5]),
    .B  (Yin_reg[4]),
    .P  (Mult_reg[4])
);
mult_gen_0 m5
(
    .A  (coe[6]),
    .B  (Yin_reg[5]),
    .P  (Mult_reg[5])
);
mult_gen_0 m6
(
    .A  (coe[7]),
    .B  (Yin_reg[6]),
    .P  (Mult_reg[6])
);
	
//-------------------------------------------------------
//   乘法结果累加输出，高位补符号位
//-------------------------------------------------------	
assign Yout = {{3{Mult_reg[0][22]}},Mult_reg[0]} 
            + {{3{Mult_reg[1][22]}},Mult_reg[1]}
            + {{3{Mult_reg[2][22]}},Mult_reg[2]}
            + {{3{Mult_reg[3][22]}},Mult_reg[3]}
            + {{3{Mult_reg[4][22]}},Mult_reg[4]}
            + {{3{Mult_reg[5][22]}},Mult_reg[5]}
            + {{3{Mult_reg[6][22]}},Mult_reg[6]};          
endmodule






