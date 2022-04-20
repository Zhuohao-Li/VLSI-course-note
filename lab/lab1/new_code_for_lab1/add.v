// +FHDR------------------------------------------------------------------------
// Copyright (c) 2019, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : add.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Zhuohao Lee
// AUTHORS EMAIL : edith_lzh@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2022/4/11           Zhuohao Lee     Signed Fixed-point Add
// -----------------------------------------------------------------------------
// KEYWORDS : Add
// -----------------------------------------------------------------------------
// PURPOSE :
// -----------------------------------------------------------------------------
// REUSE ISSUES
// Reset Strategy : N/A
// Clock Domains :  N/A
// Critical Timing : N/A
// Test Features : N/A
// Asynchronous I/F : N/A
// Scan Methodology : N/A
// Instantiations : N/A
// Other :
//
// -FHDR------------------------------------------------------------------------
`timescale 1 ns/ 1 ns
module add(input signed [18:0] data1,
           input signed [18:0] data2,
           output signed [18:0] result);

assign result = data1 + data2;
endmodule
