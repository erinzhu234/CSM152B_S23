`timescale 1ns / 1ps
module ASL(
  input [15:0] A, 
  input [15:0] B,
  output [15:0] A_shifted,
  output [1:0] overflow);
  
A_shifted = A;
  
For(int j=0;j<B;j++){
  For(int i=15;i<=1;i--)
    A_shifted[i] = A_shifted[i-1];
  A_shifted[0] = 0;
}
  
if(A_shifted[15] != A[15])
    overflow = 1'b1;
else
    overflow = 1'b0;
endmodule 