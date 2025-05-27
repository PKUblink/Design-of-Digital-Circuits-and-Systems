`timescale 1ns / 1ps
module counter_bps #( parameter CYCLES_PER_SECOND = 100_000_000)
    (
        input clk,
        input rst,
        output clk_bps
    );
    reg [31:0] cnt_value;
    always @( posedge clk or posedge rst )
        if( rst )
            cnt_value <= 14'd0;
        else if( cnt_value == CYCLES_PER_SECOND-1 ) //14'd10000
            cnt_value <= 14'd0;
        else
            cnt_value <= cnt_value + 1'b1;
    assign clk_bps = (cnt_value == CYCLES_PER_SECOND-1) ? 1'b1 : 1'b0;
endmodule