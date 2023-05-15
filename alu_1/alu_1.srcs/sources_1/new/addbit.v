module addbit(
    input cin, a, b, 
    output s, cout
    );
    
    wire T0, T1, T2;
    xor(T0, a, b);
    and(T1, a, b);
    xor(s, T0, cin);
    and(T2, T0, cin);
    or(cout, T2, T1);
    
endmodule