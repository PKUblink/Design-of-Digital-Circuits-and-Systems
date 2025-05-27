`timescale 1ns/100ps
`define CLOCK_PERIOD 10 //单位ns
`define CLOCK_FREQ 100 //100_000_000
module flash_led_top_tb();
    reg rst;
    reg dir;
    wire [15:0] led;
    wire [3:0] an; //4 个数码管使能信号
    wire [6:0] seven_segment;

    //加控制台信息，打印输出
    initial begin
        $display("----------------------------------");
        $display("The Simulation Process Starts Now!");
        $display("The Initial Value of sw0 is 0");
        $display("----------------------------------");
    end

    // Generate 100 MHz clock
    reg clk = 0;
    always #(`CLOCK_PERIOD/2) clk = ~clk;
    flash_led_top #( .CYCLES_PER_SECOND(`CLOCK_FREQ) )
        inst_flash_led_top(
            .clk( clk ),
            .rst( rst ),
            .dir( dir ),
            .led( led ),
            .an(an ),
            .seven_segment( seven_segment )
        );

    initial begin
        $monitor("Simulation Time=%t(ps), dir=%1b, led[15:0]=%16b\n",$time, dir,led);
    end
    initial begin
        rst = 1'b0;
        dir = 1'b0;
        #10;
        rst = 1'b1;
        #10;
        rst = 1'b0;
        repeat(20 * `CLOCK_FREQ) #`CLOCK_PERIOD; //20 次后改变位移方向
        dir = 1'b1;
    end
endmodule