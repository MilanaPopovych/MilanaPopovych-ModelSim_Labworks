module decoder_1to5_4 (
  input wire [3:0] D,
  input wire [2:0] A,
  output wire [3:0] Q0, Q1, Q2, Q3, Q4   //5 4-bit outputs
  );
  
  assign Q0 = (A == 3'b000) ? D : 4'b0000;
  assign Q1 = (A == 3'b001) ? D : 4'b0000;
  assign Q2 = (A == 3'b010) ? D : 4'b0000;
  assign Q3 = (A == 3'b011) ? D : 4'b0000;
  assign Q4 = (A == 3'b100) ? D : 4'b0000;

endmodule
