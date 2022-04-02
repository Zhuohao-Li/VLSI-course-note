`timescale 1ns/1ps
//-------------------------------------------------------
//   IIR�˲�������ģ��
//-------------------------------------------------------
module DirectIIR_liuqi (input rst,                 //�ߵ�ƽ��Ч��λ�ź�
                        input clk,                 //ϵͳʱ��2kHz
                        input signed [7:0] Din,    //������������2kHz
                        output signed [7:0] Dout); //IIR�˲����
    
    //-------------------------------------------------------
    //   ʵ�������ϵ��ģ�顢����ϵ��ģ��
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
    //   �����ṹ������ʵ�ֳ���
    //-------------------------------------------------------
    wire signed [25:0] Ysum = {{5{Xout[20]}},Xout} - Yout; //������ X
    wire signed [25:0] Ydiv = {{9{Ysum[25]}},Ysum[25:9]};  //������ Y right shift 9,
    assign Yin              = rst ? 'd0 : Ydiv[11:0];   //����
    assign Dout             = Yin;  //���
    
endmodule
    
    
    
    
    
    
    
