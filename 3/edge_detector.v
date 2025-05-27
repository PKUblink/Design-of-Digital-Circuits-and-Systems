`timescale 1ns / 1ps
module edge_detector (
    input clk, rst,
    input sample, //sampling input
    output rising_edge //pulse last one clock cycle
    );
    reg old_sample;
    //signal that indicates a "rising edge":
    assign rising_edge = sample & !old_sample;
    always @(posedge clk)begin
        if (rst)
            old_sample <= 1'b0;
        else
            old_sample <= sample;
    end
endmodule