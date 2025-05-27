`timescale 1ns/1ps
module simple_counter_tb;
reg clk, rst, evt;
wire[15:0] count; //size appropriately!
//make an instance of counter...call it my_counter or sth else
simple_counter my_counter(
    .clk(clk),
    .rst(rst),
    .evt_in(evt),
    .count_out(count));
//An always block in simulation **always** runs in the background
//Standard way of making a clock: every 5 ns, make clk be !clk
//Still need to initialize clk in an initial block
always begin
    #5; //every 5 ns switch...so period of clock is 10 ns
    clk = !clk;
end
//initial block...this is our test simulation
initial begin
    $display("Starting Sim");
    clk = 0; //initialize clk (important)
    rst = 0; //initialize rst (important)
    evt = 0; //initialize evt (important)
    #20 //wait a little bit of time at beginning
    rst = 1; //reset system
    #20; //hold high for a few clock cycles
    rst=0; //pull low
    #20; //wait a little bit
    evt = 1; //make an evt
    #10 //wait a clock cycle
    evt = 0; //pull low
    #50 //wait 50 ns
    evt = 1; //pull high
    #200 //just let it run for a bit
    evt = 0; //pull low, and be done
    $finish;
end
endmodule //counter_tb