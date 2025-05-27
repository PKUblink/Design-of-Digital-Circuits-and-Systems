`timescale 1ns / 1ps
module hex_seven_segment_decoder(
    input [3:0] digit, //输入4bit 状态，对应0-9，A-F
    output reg [6:0] seven_seg);
    parameter zero = 7'b100_0000;
    parameter one = 7'b111_1001;
    parameter two = 7'b010_0100;
    parameter three = 7'b011_0000;
    parameter four = 7'b001_1001;
    parameter five = 7'b001_0010;
    parameter six = 7'b000_0010;
    parameter seven = 7'b111_1000;
    parameter eight = 7'b000_0000;
    parameter nine = 7'b001_0000;
    parameter A = 7'b000_1000;
    parameter b = 7'b000_0011;
    parameter C = 7'b100_0110;
    parameter d = 7'b010_0001;
    parameter E = 7'b000_0110;
    parameter F = 7'b000_1110;
    always@(digit)
        case(digit)
            0 : seven_seg = zero ;
            1 : seven_seg = one ;
            2 : seven_seg = two ;
            3 : seven_seg = three ;
            4 : seven_seg = four ;
            5 : seven_seg = five ;
            6 : seven_seg = six ;
            7 : seven_seg = seven ;
            8 : seven_seg = eight ;
            9 : seven_seg = nine ;
            10: seven_seg = A ;
            11: seven_seg = b ;
            12: seven_seg = C ;
            13: seven_seg = d ;
            14: seven_seg = E ;
            15: seven_seg = F ;
            default:seven_seg = zero;
        endcase
endmodule