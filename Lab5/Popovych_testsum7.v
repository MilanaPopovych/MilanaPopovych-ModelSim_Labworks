module testsum7; 
    wire [6:0] Ain, Bin;
    wire Ci;
    wire [6:0] res_my, res_ref;
    wire cm, cr;

    reg [6:0] Ain_r, Bin_r;
    reg Ci_r;

    assign Ain = Ain_r;
    assign Bin = Bin_r;
    assign Ci  = Ci_r;

    my_sum_7bit  my_block  (Ain, Bin, Ci, res_my,  cm);
    ref_sum_7bit ref_block (Ain, Bin, Ci, res_ref, cr);

    initial begin
        $display("\t\t Time | Ain | Bin | Ci | res_my | cm | res_ref | cr");
        $monitor("%t | %3d | %3d |  %b |    %3d |  %b |     %3d |  %b", 
                 $time, Ain, Bin, Ci, res_my, cm, res_ref, cr);
        #400 $finish;
    end
    initial begin
        Ain_r = 7'd1;
        #50 Ain_r = 7'd15;
        #50 Ain_r = 7'd120;
        #50 Ain_r = 7'd55;
        #50 Ain_r = 7'd10;
        #50 Ain_r = 7'd127;
        #50 Ain_r = 7'd0;
    end

    initial begin
        Bin_r = 7'd2;
        #100 Bin_r = 7'd10;
        #100 Bin_r = 7'd50;
        #100 Bin_r = 7'd127;
    end

    initial begin
        Ci_r = 1'b0;
        #200 Ci_r = 1'b1;
    end

endmodule
