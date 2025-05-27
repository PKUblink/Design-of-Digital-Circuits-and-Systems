`timescale 1ns / 1ps
module flash_led_ctl(
    input clk,
    input rst,
    input dir,
    input clk_bps,
    output reg [15:0] led,
    output reg [3:0] cnt_value //新增
);
always @( posedge clk or posedge rst )
    if( rst ) begin
            led <= 16'h8000;
            cnt_value <= 0;
        end
    else
        case( dir )
            1'b0:   if( clk_bps ) begin //从左向右
                        cnt_value <= cnt_value + 1; //加计数
                        if( led != 16'd1 )
                            led <= led >> 1'b1;
                        else
                            led <= 16'h8000;
                    end
            1'b1:   if( clk_bps ) begin //从右向左
                        cnt_value <= cnt_value - 1; //减计数
                        if( led != 16'h8000 )
                            led <= led << 1'b1;
                        else
                            led <= 16'd1;
                    end
        endcase
endmodule