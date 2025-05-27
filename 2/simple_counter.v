module simple_counter(
    input clk,
    input rst,
    input evt_in,
    output reg[15:0] count_out
    );
    wire res;
    vio_ctrl_option inst_opt
        (.clk(clk), .probe_out0(ctrl_vio));
    pulse p
        ( .clk(clk), .rst(rst), .pulse(res));
    always @(posedge clk)
        if(rst) begin
            if(ctrl_vio)
                count_out <= 16'b0; //reset signal
            else
                count_out <= 16'b1;
        end
        else if(ctrl_vio & evt_in) begin
            if(res)
                    count_out <= count_out + 1; 
            else 
                    count_out <= count_out;
        end
        else if(evt_in) begin
            if(res)
                    count_out <= count_out - 1; 
            else 
                    count_out <= count_out;
        end
        else begin
            count_out <= count_out;
        end
endmodule