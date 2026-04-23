module refsum7 (Ain, Bin, Ci, Sout, Co);
  input [6:0] Ain, Bin;
    input Ci;
    output [6:0] Sout;
    output Co;
    
    reg [7:0] S; 

    always @(Ain or Bin or Ci) begin
        S = Ain + Bin + Ci;
    end

    assign Sout = S[6:0];
    assign Co = S[7];
endmodule
