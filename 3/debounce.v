module debounce( input clk, rst, bouncey_in,//raw input
        output reg clean_out //debounced output
    );
    reg [19:0] count; // Is 20-bit width enough?
    reg old;
    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            clean_out <= 0;
            old <= 0;
        end 
        else begin
            if (bouncey_in != old)
                count <= 0;
            else
                count <= count + 1; // Reset the counter if no change
            if (count == 20'hFFFFF) begin // Count to 1 million
                    clean_out <= bouncey_in;
                    count <= 0;
                end
            old <= bouncey_in; // Update the old state
        end
    end
endmodule