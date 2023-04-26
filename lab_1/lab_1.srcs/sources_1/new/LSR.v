`timescale 1ns / 1ps
module LSR(
  input [15:0] A, 
  input [15:0] B,
  output reg [15:0] A_shifted);
  integer i;
  integer j;
  
  always @(A,B)
  begin 
      
	  A_shifted = A;
  
      for(j=0; j<B; j=j+1)begin
        for(i=1; i<=15; i=i+1)
          A_shifted[i-1] = A_shifted[i];  
        A_shifted[15] = 0;
      
      end
    end 

endmodule 
