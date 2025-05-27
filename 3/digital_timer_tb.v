`timescale 1ns / 1ps
`define CLOCK_PERIOD 10
 module digital_timer_tb();
    reg clk, rst;
    reg [4:0] button;
    reg [15:0] switch;
    wire [15:0] count_out;
    wire led_A, led_B;
    parameter S100_PERIOD = 1_000_000; // 100Hz Pulse
    parameter S1_PERIOD = 100; // 1Hz Pulse
    //make an instance of the top module...call it uut
    digital_timer # ( .S100_PERIOD(S100_PERIOD),
    .S1_PERIOD(S1_PERIOD) ) uut ( .clk(clk), .rst(rst),
    .btnu(button[4]), .btnd(button[3]), .btnc(button[2]),
    .btnl(button[1]), .btnr(button[0]), .data(switch),
    .count_out(count_out), .leda(led_A), .ledb(led_B) );
    //Standard way of making a clock: make clk be !clk per 5ns
    //still need to initialize clk in an initial block
    always begin
        #(`CLOCK_PERIOD/2); // clock period is 10 ns
        clk = !clk;
    end
    //initial block...this is our test simulation
    initial begin
        $display("Starting Sim");
        clk = 0; //initialize clk (super important)
        rst = 0; //initialize rst (super important)
        button = 4'b00000;//initialize evt (super important)
        switch = 16'h0803;//initialize evt (super important)
        #(`CLOCK_PERIOD*2); //wait a little bit of time
        rst = 1; //reset system
        #(`CLOCK_PERIOD*2); //hold high for a few clock cycles
        rst=0; //pull low
        #(`CLOCK_PERIOD*2); //wait a little bit
        button = 5'b00000; //release buttons, counting up
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00100; //press center, starting stopwatch
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons, counting up
        #((`CLOCK_PERIOD*S100_PERIOD*5)); //wait a bit...
        button = 5'b10000; //press button up, pause
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons, pause
        #((`CLOCK_PERIOD*S100_PERIOD)*10); //wait a bit...
        button = 5'b10000; //push button up, resume counting
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons, counting again
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00010; //press left, reverse counting dir
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons
        #((`CLOCK_PERIOD*S100_PERIOD)*10); //wait a bit...
        button = 5'b01000; //press down, clear
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00001; //press right, load SW[15:0]
        #((`CLOCK_PERIOD));
        button = 5'b00000; //release buttons, counting
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
    end
endmodule