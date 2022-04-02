
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

parameter clk_period=626; //设置时钟信号周期（频率）:1.6MHz
parameter clk_half_period=clk_period/2;
parameter data_num=2000;  //仿真数据长度
parameter time_sim=data_num*clk_period/2; //仿真时间

initial
begin
	//设置时钟信号初值
	clk=1;
	//设置复位信号
	rst=1;
	#10000 rst=0;
	//设置仿真时间
	#time_sim $finish;
	//设置输入信号初值
	din=12'd10;
end

//产生时钟信号
always                                                 
	#clk_half_period clk=~clk;

//从外部TX文件读入数据作为测试激励
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
			#clk_period;//数据周期为时钟周期的8倍
		end
end
	
endmodule
