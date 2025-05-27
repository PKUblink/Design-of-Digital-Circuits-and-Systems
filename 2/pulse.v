module pulse( 
    input clk,
    input rst,
    output pulse
    );
    parameter PERIOD = 32'd10_000_000;
    reg[31:0] periodic_counter; //32 bits is sufficient
    always @(posedge clk or posedge rst)
        if (rst)
            periodic_counter <= 32'd0;
        else if (periodic_counter == PERIOD - 1)
            periodic_counter <= 32'd0;
        else
            periodic_counter <= periodic_counter + 1;

    assign pulse = (periodic_counter == PERIOD - 1);
endmodule