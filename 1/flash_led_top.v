`timescale 1ns / 1ns
module flash_led_top #( parameter CYCLES_PER_SECOND = 100_000_000)(
    input clk,
    input rst,
    input dir,
    output [15:0] led,
    output [3:0] an, //4个数码管使能信号
    output [6:0] seven_segment //数码管7段码输出
    );

    wire clk_bps;
    wire vio_dir;
    wire [3:0] cnt_value;

    vio_ctrl_dir inst_dir(
        .clk( clk ),
        .probe_out0 ( ctrl_vio )
    );
    
    wire I;
    assign I = ctrl_vio | dir;

    counter_bps#( .CYCLES_PER_SECOND(CYCLES_PER_SECOND) )
        counter(
        .clk( clk ),
        .rst( rst ),
        .clk_bps( clk_bps )
    );

    flash_led_ctl flash_led_ctl(
        .clk( clk ),
        .rst( rst ),
        .dir( I ),
        .clk_bps( clk_bps ),
        .led( led ),
        .cnt_value( cnt_value )
    );

    hex_seven_segment_decoder decoder(
        .digit( cnt_value ),
        .seven_seg( seven_segment )
    );
    assign an = 4'b1110; //点亮最右侧数码管
endmodule