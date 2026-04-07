module Lab4_Popovych_logic (
  input wire x3, 
  input wire x2, 
  input wire x1,
  output wire y1,  // DDNF
  output wire y2   // DKNF
);

  wire nx1 = ~x1;   //NOT x1
  wire d1 = ~(x3 | nx1);  // x3 XOR NOT-x1
  wire d2 = ~(x2 | nx1);  // x2 XOR NOT-x1
  assign y1 = d1 | d2;   

  wire nx2 = ~x2;    // NOT x2
  wire nx3 = ~x3;    // NOT x3
  wire k1 = ~(nx3 | nx2);  // NOT-x3 XOR NOT-x2
  assign y2 = ~(~x1 | k1);   // NOT-x1 XOR (NOT-x3 XOR NOT-x2)

endmodule