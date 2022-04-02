`timescale 1ns/1ps
//-------------------------------------------------------
//   IIR滤波器顶层模块
//-------------------------------------------------------
module DirectIIR_liuqi (input rst,                 //高电平有效复位信号
                        input clk,                 //系统时钟2kHz
                        input signed [7:0] Din,    //采样数据输入2kHz
                        output signed [7:0] Dout); //IIR滤波输出
    
    //-------------------------------------------------------
    //   实例化零点系数模块、极点系数模块
    //-------------------------------------------------------
    wire signed [20:0] Xout;
    wire signed [11:0] Yin;
    wire signed [25:0] Yout;
    
    // H(z) = Y(Z)/X(Z)
    
    zero U0
    (
    .rst   (rst),
    .clk   (clk),
    .Xin   (Din),
    .Xout  (Xout)
    );
    
    pole U1
    (
    .rst   (rst),
    .clk   (clk),
    .Yin   (Yin),
    .Yout  (Yout)
    );
    
    //-------------------------------------------------------
    //   反馈结构，右移实现除法
    //-------------------------------------------------------
    wire signed [25:0] Ysum = {{5{Xout[20]}},Xout} - Yout; //减法器 X
    wire signed [25:0] Ydiv = {{9{Ysum[25]}},Ysum[25:9]};  //除法器 Y right shift 9,
    assign Yin              = rst ? 'd0 : Ydiv[11:0];   //反馈
    assign Dout             = Yin;  //输出
    
endmodule
    
    
    
    
    
    
    
