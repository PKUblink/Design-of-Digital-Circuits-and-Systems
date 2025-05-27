`timescale 1ns / 1ps
module digital_timer_top # (
    parameter BOUNCE_PERIOD = 32'd1_000_000, //按键弹跳采样周期10ms
    parameter REFRESH_PERIOD = 32'd100_000, //显示窗口时长1ms
    parameter S100_PERIOD = 32'd1_000_000, //100Hz Pulse
    parameter S1_PERIOD = 32'd100 //1Hz Pulse
    )(
        input Clk, // Clock
        input Rst, // SW15
        input Btnu, Btnd, Btnc, Btnl, Btnr, // Five buttons
        input [14:0] Switch, // 拨码开关SW[15:0]
        output [6:0] Cat_Out, // Seven segment leds
        output Led_A, Led_B, // Led lights indication
        output [3:0] An // Display dynamic control
        );

    wire btnu, btnd, btnc, btnl, btnr;
    reg [3:0] segment_state;
    reg [31:0] segment_counter;
    reg [3:0] vals;
    wire leda, ledb;
    wire[15:0] count_out;

    assign An = ~segment_state;

    debounce debounce1(
        .clk(Clk),
        .rst(Rst),
        .bouncey_in(Btnu),
        .clean_out(btnu)
    );
    debounce debounce2(
        .clk(Clk),
        .rst(Rst),
        .bouncey_in(Btnd),
        .clean_out(btnd)
    );
    debounce debounce3(
        .clk(Clk),
        .rst(Rst),
        .bouncey_in(Btnc),
        .clean_out(btnc)
    );
    debounce debounce4(
        .clk(Clk),
        .rst(Rst),
        .bouncey_in(Btnl),
        .clean_out(btnl)
    );
    debounce debounce5(
        .clk(Clk),
        .rst(Rst),
        .bouncey_in(Btnr),
        .clean_out(btnr)
    );

    binary_to_seven_seg my_converter(
        .val_in(vals),
        .led_out(Cat_Out)
    );

    digital_timer my_timer(
        .clk(Clk),
        .rst(Rst),
        .btnu(btnu),
        .btnd(btnd),
        .btnc(btnc),
        .btnl(btnl),
        .btnr(btnr),
        .data(Switch),
        .count_out(count_out),
        .leda(Led_A),
        .ledb(Led_B)
    );

    always @(*) begin: combinational
        if(Rst)
            vals = 4'b0000;
        else begin
            case(segment_state)
                4'b0001: vals = count_out[3:0];
                4'b0010: vals = count_out[7:4];
                4'b0100: vals = count_out[11:8];
                4'b1000: vals = count_out[15:12];
                default: vals = count_out[3:0];
            endcase
        end
    end

    always @( posedge Clk or posedge Rst )
        if( Rst ) begin
            segment_counter <= 0;
            segment_state <= 4'b0001;
        end
        else if( segment_counter == REFRESH_PERIOD - 1) begin
            segment_counter <= 0;
            case( segment_state )
                4'b0001: segment_state <= 4'b0010;
                4'b0010: segment_state <= 4'b0100;
                4'b0100: segment_state <= 4'b1000;
                4'b1000: segment_state <= 4'b0001;
                default: segment_state <= 4'b0001;
            endcase
            end
        else
            segment_counter <= segment_counter + 1;

endmodule