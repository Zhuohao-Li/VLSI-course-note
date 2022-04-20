// +FHDR------------------------------------------------------------------------
// Copyright (c) 2019, HiSilicon.
// -----------------------------------------------------------------------------
// FILE NAME : mul.v
// TYPE : module
// DEPARTMENT : SJTU MicroE
// AUTHOR : Lv Dongxu
// AUTHORS EMAIL : lvdongxu@sjtu.edu.cn
// -----------------------------------------------------------------------------
// Release history
// VERSION              Date              AUTHOR        DESCRIPTION
// 0.1               2019/3/24           Lv Dongxu     Signed Fixed-point Multiplication
//
// -----------------------------------------------------------------------------
// KEYWORDS : Filter, Mulplication, Fixed-point
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
module mul( 
    input signed [8:0] data1, 
    input signed [9:0] data2, 
    output signed [23:0] result
    );
	
    wire signed[18:0] result1; 
    assign result1 = data1 * data2; // signed fixed-point multiplication

	assign result=(result1[18]==1'b0) ? {5'b00000,result1} : {5'b11111,result1};
	
	// always@(*)
	// begin
		// if(result1[18]==1'b0) 
			// result={5'b00000,result1};
		// else 
			// result={5'b11111,result1};
	// end
	
endmodule
