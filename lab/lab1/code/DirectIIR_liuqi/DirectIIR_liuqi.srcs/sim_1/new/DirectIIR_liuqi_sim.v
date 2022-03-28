
`timescale 1 ns/ 1 ns
module IIRDirect_vlg_tst();

reg clk;
reg [11:0] din;
reg rst;
// wires                                               
wire [11:0]  dout;

// assign statements (if any)                          
DirectIIR_liuqi i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.Din(din),
	.Dout(dout),
	.rst(rst)
);

parameter clk_period=626; //����ʱ���ź����ڣ�Ƶ�ʣ�:1.6MHz
parameter clk_half_period=clk_period/2;
parameter data_num=2000;  //�������ݳ���
parameter time_sim=data_num*clk_period/2; //����ʱ��

initial
begin
	//����ʱ���źų�ֵ
	clk=1;
	//���ø�λ�ź�
	rst=1;
	#10000 rst=0;
	//���÷���ʱ��
	#time_sim $finish;
	//���������źų�ֵ
	din=12'd10;
end

//����ʱ���ź�
always                                                 
	#clk_half_period clk=~clk;

//���ⲿTX�ļ�����������Ϊ���Լ���
integer Pattern;
reg [11:0] stimulus[1:data_num];
initial
begin
	$readmemb("C:/Users/GodWa/Desktop/DirectIIR_liuqi/SinIn.txt",stimulus);
	Pattern=0;
	repeat(data_num)
		begin
			Pattern=Pattern+1;
			din=stimulus[Pattern];
			#clk_period;//��������Ϊʱ�����ڵ�8��
		end
end
	
endmodule
