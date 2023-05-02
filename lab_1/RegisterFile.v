module RegisterFile(
  input [4:0] ra, rb, rw,
  input wren, clk, rst, 
  input [15:0] busW,
  output reg [15:0] busA, busB
);
  
  reg [15:0] reg_file [31:0];
  integer i;
  
  always @(posedge clk) begin
    
    if (rst == 1) begin
      
      for (i=0; i<32; i=i+1) begin
        reg_file[i] <= 16'b0;
      end
      
    end
    
    else begin
      
      if (wren == 1) begin
        reg_file[rw]= busW;
      end
      
    end
    busA = reg_file[ra];
    busB = reg_file[rb];
  end
  
endmodule