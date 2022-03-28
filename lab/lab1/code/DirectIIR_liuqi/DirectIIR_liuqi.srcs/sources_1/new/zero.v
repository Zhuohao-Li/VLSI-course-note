`timescale 1ns/1ps
//-------------------------------------------------------
//   IIR�˲������ϵ��ģ�飬�ṹ��FIR�˲�����ͬ
//-------------------------------------------------------
module zero
(
    input rst,                 //�ߵ�ƽ��Ч��λ�ź�
    input clk,                 //ϵͳʱ��2kHz
    input signed [11:0] Xin,   //������������2kHz
    output signed [20:0] Xout  //���ϵ��ģ�����
);

//-------------------------------------------------------
//   ���ݴ�����λ�Ĵ�����
//-------------------------------------------------------
reg signed [11:0] Xin_reg [6:0];
reg [3:0] i,j;

always @ (posedge clk or posedge rst)
    if (rst) begin
        for (i=0; i<7; i=i+1'b1)
            Xin_reg[i] <= 'd0;
    end
    else begin
        for (j=0; j<6; j=j+1'b1)
            Xin_reg[j+1] <= Xin_reg[j];
        Xin_reg[0] <= Xin;
    end

//-------------------------------------------------------
//   �Գ�ϵ��������������ӣ����ǰ������λ
//-------------------------------------------------------
wire signed [12:0] Add_reg [3:0];
assign Add_reg[0] = {Xin[11],Xin} + {Xin_reg[6][11],Xin_reg[6]};
assign Add_reg[1] = {Xin_reg[0][11],Xin_reg[0]} + {Xin_reg[5][11],Xin_reg[5]};
assign Add_reg[2] = {Xin_reg[1][11],Xin_reg[1]} + {Xin_reg[4][11],Xin_reg[4]};
assign Add_reg[3] = {Xin_reg[2][11],Xin_reg[2]} + {Xin_reg[3][11],Xin_reg[3]};

//-------------------------------------------------------
//   ���Ӧϵ�����˷�����ϵ���˷���������λ+�ӷ�ʵ��
//-------------------------------------------------------
wire signed [20:0] Mult_reg [3:0];
//���ƣ���λ������λ����λ��0
assign Mult_reg[0] = {{6{Add_reg[0][12]}},Add_reg[0],2'd0}+  //4+2+1=7
    {{7{Add_reg[0][12]}},Add_reg[0],1'd0}+{{8{Add_reg[0][12]}},Add_reg[0]};
	
assign Mult_reg[1] = {{4{Add_reg[1][12]}},Add_reg[1],4'd0}+  //16+4+1=21
    {{6{Add_reg[1][12]}},Add_reg[1],2'd0}+{{8{Add_reg[1][12]}},Add_reg[1]};
	
assign Mult_reg[2] = {{3{Add_reg[2][12]}},Add_reg[2],5'd0}+  //32+8+2=42
    {{5{Add_reg[2][12]}},Add_reg[2],3'd0}+{{7{Add_reg[2][12]}},Add_reg[2],1'd0};
	
assign Mult_reg[3] = {{3{Add_reg[3][12]}},Add_reg[3],5'd0}+  //32+16+8=56
    {{4{Add_reg[3][12]}},Add_reg[3],4'd0}+{{5{Add_reg[3][12]}},Add_reg[3],3'd0};	
	
//-------------------------------------------------------
//   �˷�����ۼ����
//-------------------------------------------------------	
assign Xout = Mult_reg[0]+Mult_reg[1]+Mult_reg[2]+Mult_reg[3];

 
endmodule






