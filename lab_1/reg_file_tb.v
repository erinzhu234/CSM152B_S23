module tb();
  
  reg clk = 0;
  always #5 begin
    clk = ~clk;
  end
  
  reg [4:0] ra, rb, rw;
  reg wren, rst;
  reg [15:0] busW, busA, busB;
  
  RegisterFile my_regfile(.ra(ra), .rb(rb), .rw(rw), .wren(wren), .clk(clk), .rst(rst), .busW(busW), .busA(busA), .busB(busB));
  
  initial begin
    rst = 1;
    #10
    rst = 0;
    #10
    ra = 5'b01101;
    #10
    $display("reg file is now %h", busA);
    #10
    rb = 5'b11010;
    rw = 5'b11010;
    busW = 16'h3e6f;
    wren = 1;
    #10
    ra = 5'b00110;
    rw = 5'b00110;
    busW = 16'h9ac4;
    wren = 1;
    #20
    $display("00110 is now %h", busA);
    $display("11010 is now %h", busB);
    #10
    wren = 0;
    ra = 5'b01000;
    rw = 5'b01000;
    busW = 16'h000f;
    #20
    $display("01000 is now %h", busA);
    #10
    rst = 1;
    #10
    rst = 0;
    #10
    ra = 5'b00110;
    rb = 5'b11010;
    #30
    $display("00110 is now %h", busA);
    $display("11010 is now %h", busB);
  end

endmodule