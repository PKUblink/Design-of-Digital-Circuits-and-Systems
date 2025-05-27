`timescale 1ns / 1ps
`define CLOCK_PERIOD 10 //10ns, 100MHz
`define BOUNCE_PERIOD 1_000_000
module debounce_tb;
//make reg for inputs and wire for outputs!
    reg clk, rst;
    reg dirty;
    wire clean;
    //make an instance of the counter...call it uut
    debounce uut(.clk(clk), .rst(rst), .bouncey_in(dirty),
    .clean_out(clean));
//An always block in simulation **always** runs
//Standard way of making a clock: make clk be !clk
//still need to initialize clk in an initial block
always begin
    #(`CLOCK_PERIOD/2);
    //every 5 ns switch...so clock period is 10 ns
    clk = !clk;
end
//initial block...this is our test simulation
initial begin 
    $display("Starting Sim");
    clk = 0; //initialize clk (super important)
    rst = 0; //initialize rst (super important)
    dirty = 0; //initialize evt (super important)
    #20 //wait a little bit of time
    rst = 1; //reset system
    #20; //hold high for a few clock cycles
    rst=0; //pull low
    #20; //wait a little bit
    dirty = 1; //push the button
    #(`CLOCK_PERIOD*5); //wait a bit...
    dirty = 0; //release buttons
    #(`BOUNCE_PERIOD*`CLOCK_PERIOD*5); //wait a bit...
    dirty = 1; //push the button
    #(`CLOCK_PERIOD*`CLOCK_PERIOD*5); //wait a bit...
    dirty = 0; //release buttons
    #(`BOUNCE_PERIOD*`CLOCK_PERIOD*5); //wait a bit...
    dirty = 1; //push the button
    #(`BOUNCE_PERIOD*`CLOCK_PERIOD*5); //wait a bit...
    end
endmodule