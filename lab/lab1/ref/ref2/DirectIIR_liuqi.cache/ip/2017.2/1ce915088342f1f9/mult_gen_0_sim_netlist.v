// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jun 11 13:20:26 2018
// Host        : DESKTOP-FBVJ4AU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a50tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_12,Vivado 2017.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_12 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_12
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_12_viv i_mult
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
U8x6mHppvznMGuS6YNTvwoo3qyCUn5QqEKkRS1qPoEVPln3M76NkhhukBvUv+AjpkzGTnawe7h6H
NpJnzXYxzg/gJ9gVkEiZTvlxCGNw11px9uDNy4RgLRTWnWv8Ucwh+GsvNL7K1ExncZ8DmWaD4KBw
RBIwxHONDq64bFNWNjWoE6KVA9Ykv0iX4L6M0+FrtZgfoVBoiGWgKLiROqn95/pDPG7fLSkZDXnn
AW6CReeuVRUMZ6AEwPAMndxr856HuPdOw5mMHaHbF8Bnr38QLvvYbCUMtxiAxNCxcAvhvuiCOZXr
qGoO0lY1HhI/HqwEYlNogC5n/BnWgVu5Efbx2g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
pvETjTI96qzNDR2AevFLTUXLmp9RBNChV9/nl0trhW0p9DuJxaPDVH/p6kJKlvctP6Flbuscx//R
3J0oKqSg089o3jBJ53ATyWw+e3F/SR/x/ZFuSjvi5xMExKYxdQhwNBXX95MXFvUiWEADs1pDJWaE
hKfKKr2BUkcoUNz4V9NOn51bQpvbzr8IFEfz5h2827Rf+E/D2cD9Kl+kIrvKYLbj372kwhwW/Ljc
VhxWn/O5ddtpB6MZBphqTjiZjwMhbgxcT1yeTLJCqG/tEoEZRYNOeTuMnp1CrWpF+K+hTdCeFF2h
f4FXzfO0GiOZYUpqUqcZXuUW3+jvAnInpMdUWw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6640)
`pragma protect data_block
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
CLz1Jl2aPjEn8BUJIhmTRT/D42hY1xM/m2ba8Q==
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
