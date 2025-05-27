module binary_to_seven_seg ( input [3:0] val_in, output reg [7:0] led_out); //输入4bit 状�?�，对应0-9，A-F
    parameter zero = 8'b1100_0000;
    parameter one = 8'b1111_1001;
    parameter two = 8'b1010_0100;
    parameter three = 8'b1011_0000;
    parameter four = 8'b1001_1001;
    parameter five = 8'b1001_0010;
    parameter six = 8'b1000_0010;
    parameter seven = 8'b1111_1000;
    parameter eight = 8'b1000_0000;
    parameter nine = 8'b1001_0000;
    parameter A = 8'b1000_1000;
    parameter b = 8'b1000_0011;
    parameter c = 8'b1100_0110;
    parameter d = 8'b1010_0001;
    parameter E = 8'b1000_0110;
    parameter F = 8'b1000_1110;
    //7段数码管显示
    always@(val_in)
        case(val_in)
            0 : led_out = zero ;
            1 : led_out = one ;
            2 : led_out = two ;
            3 : led_out = three ;
            4 : led_out = four ;
            5 : led_out = five ;
            6 : led_out = six ;
            7 : led_out = seven ;
            8 : led_out = eight ;
            9 : led_out = nine ;
            10: led_out = A ;
            11: led_out = b ;
            12: led_out = c ;
            13: led_out = d ;
            14: led_out = E ;
            15: led_out = F ;
            default:led_out = zero;
    endcase
endmodule