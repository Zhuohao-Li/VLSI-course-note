// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jun 11 13:20:26 2018
// Host        : DESKTOP-FBVJ4AU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/GodWa/Desktop/DirectIIR_liuqi/DirectIIR_liuqi.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a50tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_12,Vivado 2017.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [22:0]P;

  wire [11:0]A;
  wire [11:0]B;
  wire [22:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "12" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "22" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_12 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(1'b1),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "12" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "12" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "22" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_12
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [11:0]A;
  input [11:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [22:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [11:0]A;
  wire [11:0]B;
  wire [22:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "12" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "22" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_12_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(1'b0),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
lEAWhwyix5jBGG66vdOS8nJpVNdFrJkI8qYgE8UK5+7avncLp8v54uPGoRWR36jLWh6ehDkiSjec
BS6Kf+NkuQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pIREr1/dqaPvd4j2lTxOBSnAy2Ra6DuJsnP63kEHv0IS6up5E7T2izznuVUSTCTOb47ap4dcNzFs
VunReb3wPh7pLPeb7xw5iV9uBkd/TpxZM73yc3k1Rpf+4J2IVlTVOAQ5OEjaorVixNlt8NiWGqzH
R/d96oqeazauoI3oOnQ=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DELvK5o++4pE4MCoxr5fui0H5JI8L1lrkSphbogK2GjTRYuCaX9esyobvkVAA3D3d9tJqaP3hGDO
abwxN4b4ezNtusv1gy6cglGx/GN3jUuKSbgskyfUxDvL7LrGyqNFVNMUu2E9m+BfM4Ntpn0n9FIV
ziDzomLe9jJOEfua5U0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V5WVwaxzoZCaNjBtQkebL2emEOYwtLrt2YC/Nhjv+maBGQv/B4iXQaCQdVt72XysdOqpG+W7acY4
LQoDKOXjpn3NnQIeXe5yNHpeBxy0UeQS9x3LKwyD7PTy2e6Psu8FyrhI0YZfF7izMLFdHz6hGOSF
AIMgUa/N0UmNtXEjM3DkfZLqoYQAht0o6JFtiqajvc59tPsvMZCCtiKwhXu7PlN11ghLauG7TulD
K2KfLDkX0cfwDA2TPyp16kT6EIfZoCRnafITvpKhHXZv+NQc+XN9PbcRpp9BOAC79WhsNkBBXYhL
PABV65LzYa8+x5tqKdf3v0X46IAMWJ1e3wS5UA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U33OFhvyDr6TZQknmG9CiJblHCnuyjNFktguLuIFzd/VYuPGNPUXzm3pNVHAmifAJrPB2CT7TAF6
SpBdgM2KIeON3LRhsrRAbVtPF8PLeYtYTgU5BOY8SIKKoSu1FY2Gr1zMrTO/nd+RiZegYkT/1u27
xI0aTCkoWlFt3amFg2MasqdnOSk77Lt/DgM2JPd9muhj3QoSr10ZjlsDKpO31B9RZyxGfIMIft8A
zXeFtxJQH+1UZmzli9TNedfnlc4Etx1ofsn10PXyAOJjpszIhUCVPKZIY14gmxL8f+2bLkbtbsCM
BVqE9L8J6oKTduRVz5WGnDuPWMDwM24T9TA/dA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j6YL/khcx2/CEaOFv1YeHhnfPBfzoLLf3YocgJW2UWv3fiNKR3/XVXrjS7WsQlB+PoA6wradLkll
gsCEiQrgYuwxUEkrZPREX1CG/XJwUl9PKDBg75CevIh9+3qKHJGSxr9GydBxI8A2Bl+6FCqWp+ji
fmjdmpZhDdGqO9F7NIOUIknT0jWHS4jX/6J6w3BhZ/5VtUKxAeh4CNotWM+2fGo67UsEmFovMSdb
AWdoeaA+uo+Nh0kX6bc0yzej6R0ECeV3uzW4Gr9HgZtmqiZ4XMox/30Qmatsy8mCmeKd4pCcCVaP
xJ2QjwO5By08VArjkqF+F5MjSBTB2AgEgKQm4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
nNgw7Mrj6pd1VVVj0XdWxXN2vf5kmmjSLalRh5EV5VUhYPB2vrvUy5dc8Ge+KXHYokOTYTut3PKg
t8H2Kwouxk8hJpV/qkfLGrvC992z8IwgICM2EOWQAAOkgt7bA28Uv7WTnreG7Kqxu0YiwYsIyFcd
l6zc/0mEaOvrNrPNnM6lCB/C6q2H6IHXUSnj5XevDQ4u4rd8fcWrlqvhO4skqK9ZZUnpFCPF7oIL
27LrVozZaf5BiomuTmToxjeSZM/E3qkG4zfRHpMoTipl35YvpLH8FTOanGHoFRoUhNsukVf3GeNK
JvRWKOOGRU/7ejapIoqmSo+N9NkUYkvdW1v1xw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
5QF/GKorLruLYzkz0yx935Vt/rMcVuXOjw+JmcEuA5ek2bxAF7ObKYlj/dhBpLnRWnuUf2exZLDS
mJ7BgioCdh25WEUkxo7rCcW3CV8cwn5dg647se4SUyqXPDmub5SOeSiNihJQPprQqsGxHzpPtEOk
7PyfhD3VKwr/x7a/gVPKh6VDduRfiv87cn5N5voLvYpgeT7e4zhHRXmU9BKbAGmAiIBFHq6XgYeR
z28MJAIbSGdT/wa2ZTawoxdCBxQak9RkqRsqdrt19mnYceeXREldEkDCumIcw56zOKF0yErwcptI
4pMIMnizQzqad2oYKkrEkxvH1GO1yn+bW+FRmw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6624)
`pragma protect data_block
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
yjLr8CcrlbMf7Ol5
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
