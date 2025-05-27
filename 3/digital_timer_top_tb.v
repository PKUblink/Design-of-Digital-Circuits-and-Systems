`timescale 1ns / 1ps
`define CLOCK_PERIOD 10
 module digital_timer_top_tb();
    reg Clk, Rst;
    reg [4:0] button;
    reg [15:0] switch;
    wire [6:0] catout;
    wire [3:0] an;
    wire led_A, led_B;
    parameter BOUNCE_PERIOD = 32'd1_000_000;
    parameter REFRESH_PERIOD = 32'd100_000;
    parameter S100_PERIOD = 1_000_000; // 100Hz Pulse
    parameter S1_PERIOD = 100; // 1Hz Pulse
    //make an instance of the top module...call it uut
    digital_timer_top # (.BOUNCE_PERIOD(BOUNCE_PERIOD), .REFRESH_PERIOD(REFRESH_PERIOD), .S100_PERIOD(S100_PERIOD),
    .S1_PERIOD(S1_PERIOD) ) uut ( .Clk(Clk), .Rst(Rst),
    .Btnu(button[4]), .Btnd(button[3]), .Btnc(button[2]),
    .Btnl(button[1]), .Btnr(button[0]), .Switch(switch),
    .Cat_Out(catout), .Led_A(led_A), .Led_B(led_B), .An(an) );
    
    always begin
        #(`CLOCK_PERIOD/2); // clock period is 10 ns
        Clk = !Clk;
    end
    //initial block...this is our test simulation
    initial begin
        $display("Starting Sim");
        Clk = 0; //initialize clk (super important)
        Rst = 0; //initialize rst (super important)
        button = 4'b00000;//initialize evt (super important)
        switch = 16'h0803;//initialize evt (super important)
        #(`CLOCK_PERIOD); //wait a little bit of time
        Rst = 1; //reset system
        #(`CLOCK_PERIOD*S100_PERIOD*2); //hold high for a few clock cycles
        Rst=0; //pull low
        #(`CLOCK_PERIOD*S100_PERIOD*2); //wait a little bit
        button = 5'b00000; //release buttons, counting up
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00100; //press center, starting stopwatch
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons, counting up
        #((`CLOCK_PERIOD*S100_PERIOD*5)); //wait a bit...
        button = 5'b10000; //press button up, pause
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons, pause
        #((`CLOCK_PERIOD*S100_PERIOD)*10); //wait a bit...
        button = 5'b10000; //push button up, resume counting
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons, counting again
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00010; //press left, reverse counting dir
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons
        #((`CLOCK_PERIOD*S100_PERIOD)*10); //wait a bit...
        button = 5'b01000; //press down, clear
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
        button = 5'b00001; //press right, load SW[15:0]
        #((`CLOCK_PERIOD*S100_PERIOD*2));
        button = 5'b00000; //release buttons, counting
        #((`CLOCK_PERIOD*S100_PERIOD*10)); //wait a bit...
    end
endmodule