module Popovych_Control_Dev (
    input wire x,
    output reg [2:0] MI // MI[0]=Y1, MI[1]=Y2, MI[2]=Y3
);
    // внутрішні сигнали clk та reset
    reg clk;
    reg reset;
    // визначення станів
    parameter a1 = 2'b00, 
              a2 = 2'b01, 
              a3 = 2'b10;
    reg [1:0] current_state, next_state;

    // генерація clk та reset 
    initial begin
        clk = 0;
        reset = 1;
        #15 reset = 0; // скидання активне на початку
    end

    always #10 clk = ~clk; // період 20 одиниць часу
    // логіка переходів
    always @(*) begin
        case (current_state)
            a1: next_state = a2;
            a2: begin
                if (x == 1'b1) next_state = a2;
                else           next_state = a3;
            end
            a3: begin
                if (x == 1'b0) next_state = a1;
                else           next_state = a3;
            end
            default: next_state = a1;
        endcase
    end

    // регістр стану
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= a1;
        else
            current_state <= next_state;
    end

    // формування вихідної мікроінструкції MI [Y1 Y2 Y3]
    // логіка автомата Мура
    always @(*) begin
        case (current_state)
            a1:      MI = 3'b010; // Y2
            a2:      MI = 3'b100; // Y1
            a3:      MI = 3'b011; // Y2, Y3
            default: MI = 3'b000;
        endcase
    end

endmodule
