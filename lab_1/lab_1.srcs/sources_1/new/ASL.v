`timescale 1ns / 1ps
module ASL(
  input [15:0] A, 
  input [15:0] B,
  output reg [15:0] A_shifted,
  output reg [1:0] overflow);
  integer i;
  integer j;
 
  always @(A,B)
    begin
 
      A_shifted = A;
      
      for(j=0; j<B; j=j+1)begin
        for(i=15; i>=1; i=i-1)
             A_shifted[i] = A_shifted[i-1];
  		  A_shifted[0] = 0;
      end
   
      if(A_shifted[15] != A[15]) 
        overflow = 1'b1;
	  else 
 	  	overflow = 1'b0;
      
	end
  
endmodule 
