module bitsum (A, B, S, Cin, Cout);       //1 full adder
  input A, B, Cin;
  output S, Cout;

  wire A, B, S, Res;
  wire c1, c2, Cin, Cout;

  xor(Res, A, B);
  and(c1, A, B);
  xor(S, Cin, Res);
  and(c2, Cin, Res);
  or(Cout, c1, c2);

endmodule

module sum7 (Ain, Bin, Ci, Sout, Co);
  input [6:0] Ain, Bin; 
  input Ci;
  output [6:0] Sout;
  output Co;
  wire [6:0] C;
  
  bitsum sum1(Ain[0], Bin[0], Sout[0], Ci, C[0]);
  bitsum sum2(Ain[1], Bin[1], Sout[1], C[0], C[1]);
  bitsum sum3(Ain[2], Bin[2], Sout[2], C[1], C[2]);
  bitsum sum4(Ain[3], Bin[3], Sout[3], C[2], C[3]);
  bitsum sum5(Ain[4], Bin[4], Sout[4], C[3], C[4]);
  bitsum sum6(Ain[5], Bin[5], Sout[5], C[4], C[5]);
  bitsum sum7(Ain[6], Bin[6], Sout[6], C[5], C[6]);
  
  assign Co = C[6];
endmodule
