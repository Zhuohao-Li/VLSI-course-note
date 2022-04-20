// +FHDR------------------------------------------------------------------------
// Copyright (c) 2019, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : add.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Lv Dongxu
// AUTHORS EMAIL : lvdongxu@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2019/3/24           Lv Dongxu     Signed Fixed-point Add
// 0.2               2019/3/28           Lv Dongxu     Bandwidth change
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
module add( 
    input signed [23:0] data1, 
    input signed [23:0] data2, 
    output signed [23:0] result
    );
    
    assign result = data1 + data2;
endmodule