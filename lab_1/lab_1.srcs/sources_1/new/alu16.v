`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 01:06:41 PM
// Design Name: 
// Module Name: alu16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu16(
    input [15:0] a, [15:0] b, [3:0] alu, 
    output of,zero,[15:0] s
    );
    
    wire [15:0] sub, add, bor, band, dec, inc, inv, asl, asr, lsl, lsr, sleq;
    wire cout;
    wire sub_of, add_of, dec_of, inc_of, inv_of, asl_of, asr_of, sleq_of;
    
    // 0000 Subtraction 
    // 0001 Addition
    // 0010 Bitwise OR
    // 0011 Bitwise AND
    // 0100 Decrement 
    // 0101 Increment
    // 0110 Invert 
    // 0111 Arithmetic Shift Left
    // 1000 ASR
    // 1001 Logical Shift Left
    // 1010 LSR
    // 1011 Set on Less than or Equal
    
    subtraction my_subtraction(.r1(a), .r2(b), .cin(0), .result(sub), .cout(cout), .of(sub_of));
    addition my_addition(.r1(a), .r2(b), .cin(0), .result(add), .cout(cout), .of(add_of));
    bitwiseOR my_bOR(.A(a), .B(b), .result(bor));
    bitwiseAND my_bAND(.A(a), .B(b), .result(band));
    decrement my_decrement(.in(a), .out(dec), .cout(cout), .of(dec_of));
    increment my_increment(.in(a), .out(inc), .cout(cout), .of(inc_of));
    invert my_invert(.in(a), .result(inv), .cout(cout), .of(inv_of));
    // TODO: add the shifts
    ASL my_asl(.A(a), .B(b), .A_shifted(asl), .overflow(asl_of));
    ASR my_asr(.A(a), .B(b), .A_shifted(asr), .overflow(asr_of));
    LSL my_lsl(.A(a), .B(b), .A_shifted(lsl));
    LSR my_lsr(.A(a), .B(b), .A_shifted(lsr));
    leq my_leq(.r1(a), .r2(b), .result(sleq), .of(sleq_of));
    
    // mux every bit
    m161 s_mux0(.D0(sub[0]), .D1(add[0]), .D2(bor[0]), .D3(band[0]), .D4(dec[0]), .D5(inc[0]), .D6(inv[0]), .D7(asl[0]), .D8(asr[0]), 
               .D9(lsl[0]), .D10(lsr[0]), .D11(sleq[0]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[0]));
    
    m161 s_mux1(.D0(sub[1]), .D1(add[1]), .D2(bor[1]), .D3(band[1]), .D4(dec[1]), .D5(inc[1]), .D6(inv[1]), .D7(asl[1]), .D8(asr[1]), 
               .D9(lsl[1]), .D10(lsr[1]), .D11(sleq[1]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[1]));
    
    m161 s_mux2(.D0(sub[2]), .D1(add[2]), .D2(bor[2]), .D3(band[2]), .D4(dec[2]), .D5(inc[2]), .D6(inv[2]), .D7(asl[2]), .D8(asr[2]), 
               .D9(lsl[2]), .D10(lsr[2]), .D11(sleq[2]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[2]));
                              
    m161 s_mux3(.D0(sub[3]), .D1(add[3]), .D2(bor[3]), .D3(band[3]), .D4(dec[3]), .D5(inc[3]), .D6(inv[3]), .D7(asl[3]), .D8(asr[3]), 
               .D9(lsl[3]), .D10(lsr[3]), .D11(sleq[3]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[3]));
                                           
    m161 s_mux4(.D0(sub[4]), .D1(add[4]), .D2(bor[4]), .D3(band[4]), .D4(dec[4]), .D5(inc[4]), .D6(inv[4]), .D7(asl[4]), .D8(asr[4]), 
               .D9(lsl[4]), .D10(lsr[4]), .D11(sleq[4]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[4]));
    
    m161 s_mux5(.D0(sub[5]), .D1(add[5]), .D2(bor[5]), .D3(band[5]), .D4(dec[5]), .D5(inc[5]), .D6(inv[5]), .D7(asl[5]), .D8(asr[5]), 
               .D9(lsl[5]), .D10(lsr[5]), .D11(sleq[5]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[5]));
               
    m161 s_mux6(.D0(sub[6]), .D1(add[6]), .D2(bor[6]), .D3(band[6]), .D4(dec[6]), .D5(inc[6]), .D6(inv[6]), .D7(asl[6]), .D8(asr[6]), 
               .D9(lsl[6]), .D10(lsr[6]), .D11(sleq[6]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[6]));
                              
    m161 s_mux7(.D0(sub[7]), .D1(add[7]), .D2(bor[7]), .D3(band[7]), .D4(dec[7]), .D5(inc[7]), .D6(inv[7]), .D7(asl[7]), .D8(asr[7]), 
               .D9(lsl[7]), .D10(lsr[7]), .D11(sleq[7]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[7]));
                                       
    m161 s_mux8(.D0(sub[8]), .D1(add[8]), .D2(bor[8]), .D3(band[8]), .D4(dec[8]), .D5(inc[8]), .D6(inv[8]), .D7(asl[8]), .D8(asr[8]), 
               .D9(lsl[8]), .D10(lsr[8]), .D11(sleq[8]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[8]));
                                                            
    m161 s_mux9(.D0(sub[9]), .D1(add[9]), .D2(bor[9]), .D3(band[9]), .D4(dec[9]), .D5(inc[9]), .D6(inv[9]), .D7(asl[9]), .D8(asr[9]), 
               .D9(lsl[9]), .D10(lsr[9]), .D11(sleq[9]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[9]));
                                                                           
    m161 s_mux10(.D0(sub[10]), .D1(add[10]), .D2(bor[10]), .D3(band[10]), .D4(dec[10]), .D5(inc[10]), .D6(inv[10]), .D7(asl[10]), .D8(asr[10]), 
               .D9(lsl[10]), .D10(lsr[10]), .D11(sleq[10]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[10]));
               
    m161 s_mux11(.D0(sub[11]), .D1(add[11]), .D2(bor[11]), .D3(band[11]), .D4(dec[11]), .D5(inc[11]), .D6(inv[11]), .D7(asl[11]), .D8(asr[11]), 
               .D9(lsl[11]), .D10(lsr[11]), .D11(sleq[11]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[11]));
                              
    m161 s_mux12(.D0(sub[12]), .D1(add[12]), .D2(bor[12]), .D3(band[12]), .D4(dec[12]), .D5(inc[12]), .D6(inv[12]), .D7(asl[12]), .D8(asr[12]), 
               .D9(lsl[12]), .D10(lsr[12]), .D11(sleq[12]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[12]));
                                             
    m161 s_mux13(.D0(sub[13]), .D1(add[13]), .D2(bor[13]), .D3(band[13]), .D4(dec[13]), .D5(inc[13]), .D6(inv[13]), .D7(asl[13]), .D8(asr[13]), 
               .D9(lsl[13]), .D10(lsr[13]), .D11(sleq[13]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[13]));
                                                            
    m161 s_mux14(.D0(sub[14]), .D1(add[14]), .D2(bor[14]), .D3(band[14]), .D4(dec[14]), .D5(inc[14]), .D6(inv[14]), .D7(asl[14]), .D8(asr[14]), 
               .D9(lsl[14]), .D10(lsr[14]), .D11(sleq[14]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[14]));
                                                                           
    m161 s_mux15(.D0(sub[15]), .D1(add[15]), .D2(bor[15]), .D3(band[15]), .D4(dec[15]), .D5(inc[15]), .D6(inv[15]), .D7(asl[15]), .D8(asr[15]), 
               .D9(lsl[15]), .D10(lsr[15]), .D11(sleq[15]), .D12(0), .D13(0), .D14(0), .D15(0), 
               .S(alu), .Y(s[15]));
   
    
    m161 of_mux(.D0(sub_of), .D1(add_of), .D2(0), .D3(0), .D4(dec_of), .D5(inc_of), .D6(inv_of), .D7(asl_of), 
                .D8(asr_of), .D9(0), .D10(0), .D11(0), .D12(0), .D13(0), .D14(0), .D15(0), 
                .S(alu), .Y(of));
    zero my_zero(.a(s), .z(zero));
    
    
endmodule
