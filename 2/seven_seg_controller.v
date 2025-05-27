module seven_seg_controller( 
    input clk,
    input rst,
    input option,
    input [15:0] val_in,
    output [6:0] cat_out,
    output [3:0] an_out
    );
    
    reg [3:0] segment_state;
    reg [31:0] segment_counter;
    reg [3:0] routed_vals;
    wire [15:0] count_out;
    wire [7:0] led_out;

    binary_to_seven_seg my_converter
        ( .val_in(routed_vals), .led_out(led_out));
    simple_counter my_counter
        ( .clk(clk), .rst(rst), .evt_in(option), .count_out(count_out));
        
    assign cat_out = led_out;
    assign an_out = ~segment_state;

    always @* begin: combinational
        if(rst)
            routed_vals = 4'b0000;
        else if(option) begin
            case(segment_state)
                4'b0001: routed_vals = count_out[3:0];
                4'b0010: routed_vals = count_out[7:4];
                4'b0100: routed_vals = count_out[11:8];
                4'b1000: routed_vals = count_out[15:12];
                default: routed_vals = count_out[3:0];
            endcase
        end
        else begin
            case(segment_state)
                4'b0001: routed_vals = val_in[3:0];
                4'b0010: routed_vals = val_in[7:4];
                4'b0100: routed_vals = val_in[11:8];
                4'b1000: routed_vals = val_in[15:12];
                default: routed_vals = val_in[3:0];
            endcase
        end
    end

    parameter CYCLES_PER_SECOND = 100_000;
    always @( posedge clk or posedge rst )
        if( rst ) begin
            segment_counter <= 0;
            segment_state <= 4'b0001;
        end
        else if( segment_counter == CYCLES_PER_SECOND ) begin
            segment_counter <= 0;
            case( segment_state )
                4'b0001: segment_state <= 4'b0010;
                4'b0010: segment_state <= 4'b0100;
                4'b0100: segment_state <= 4'b1000;
                4'b1000: segment_state <= 4'b0001;
                default: segment_state <= 4'b0001;
            endcase
            end
        else
            segment_counter <= segment_counter + 1;
    
    
    // Your verilog code here
endmodule