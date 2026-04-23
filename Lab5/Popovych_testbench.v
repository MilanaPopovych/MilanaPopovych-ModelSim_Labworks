`timescale 1ns / 1ps

module tb_decoder();
  reg [3:0] D;
  reg [2:0] A;
  wire [3:0] Q0, Q1, Q2, Q3, Q4;
  
  decoder_1to5_4 uut(
    .D(D), .A(A), 
    .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4) 
    );
    
    initial begin
      $monitor ("# Time = %0d | D = %b | A = %b | Q0=%b Q1=%b Q2=%b Q3=%b Q4=%b", 
                 $time, D, A, Q0, Q1, Q2, Q3, Q4);
      D = 4'b1011;
      
      A = 3'b000; #10;
      A = 3'b001; #10;
      A = 3'b010; #10;
      A = 3'b011; #10;
      A = 3'b100; #10;
      
      $stop;
  end
endmodule
