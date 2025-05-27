module timer_datapath #(
    parameter S100_PERIOD = 1_000_000, // 100Hz Pulse
    parameter S1_PERIOD = 100 // 1Hz Pulse
    )(
    input clk, // Clock
    input rst,
    input [15:0] data, // 秒表初始置数入口
    input clks100, // 百分之一秒时钟使能
    input mode, timer_clr, // 工作模式控制，定时器清零
    input clr, ld, dir, state, // 秒表清零,置数,方向和状态
    output reg [3:0] minh, minl, sech, secl, // 定时数值高低位
    output reg [3:0] s1h, s1l, s100h, s100l, // 秒表数值高低位
    output reg leda, ledb // Led lights indication
    );

    reg [31:0] count; 
    reg old_mode; 
    always @(*) begin
        leda = mode;
        ledb = ~mode;
    end

    always @ (posedge clk or posedge rst) begin
        if (rst == 1)
            old_mode <= 0;
        else
            old_mode <= mode;
    end

    always @ (posedge clk or posedge rst) begin
        if (mode == 0) begin
            s1h <= 4'b0000;
            s1l <= 4'b0000;
            s100h <= 4'b0000;
            s100l <= 4'b0000;
            if (rst || (mode != old_mode)) begin
                if (data[15:12] > 4'b0101) 
                    minh <= 4'b0000;
                else 
                    minh <= data[15:12];
                if (data[11:8] > 4'b1001)
                    minl <= 4'b0000;
                else
                    minl <= data[11:8];
                if (data[7:4] > 4'b0101)
                    sech <= 4'b0000;
                else
                    sech <= data[7:4];
                if (data[3:0] > 4'b1001)
                    secl <= 4'b0000;
                else
                    secl <= data[3:0];
                count <= 0;
            end
            else if (timer_clr) begin
                minh <= 4'b0000;
                minl <= 4'b0000;
                sech <= 4'b0000;
                secl <= 4'b0000;
                count <= 0;
            end
            else if (count >= S100_PERIOD * S1_PERIOD - 1) begin
                count <= 0;
                if (secl < 4'b1001) 
                    secl <= secl + 1;
                else begin
                    secl <= 4'b0000;
                    if (sech < 4'b0101)  
                        sech <= sech + 1;
                    else begin
                        sech <= 4'b0000;
                        if (minl < 4'b1001)
                            minl <= minl + 1;
                        else begin
                            minl <= 4'b0000;
                            if (minh < 4'b0101)
                                minh <= minh + 1;
                            else
                                minh <= 4'b0000;
                            end
                        end
                    end
                end
            else
                count <= count + 1;
        end
        else begin
            minh <= 4'b0000;
            minl <= 4'b0000;
            sech <= 4'b0000;
            secl <= 4'b0000;
            if (state == 1) begin
                s1h <= s1h;
                s1l <= s1l;
                s100h <= s100h;
                s100l <= s100l;
                count <= count;
            end
            else begin
                if (rst || clr) begin
                    count <= 0;
                    s1h <= 4'b0000;
                    s1l <= 4'b0000;
                    s100h <= 4'b0000;
                    s100l <= 4'b0000;
                end
                else if (ld == 1) begin
                    count <= 0;
                    if (data[15:12] > 4'b1001) 
                        s1h <= 4'b0000;
                    else 
                        s1h <= data[15:12];
                    if (data[11:8] > 4'b1001)
                        s1l <= 4'b0000;
                    else
                        s1l <= data[11:8];
                    if (data[7:4] > 4'b1001)
                        s100h <= 4'b0000;
                    else
                        s100h <= data[7:4];
                    if (data[3:0] > 4'b1001)
                        s100l <= 4'b0000;
                    else
                        s100l <= data[3:0];
                end
                else if (count >= S100_PERIOD  - 1) begin
                    count <= 0;
                    if (dir == 0) begin
                        if (s100l < 4'b1001) 
                            s100l <= s100l + 1;
                        else begin
                            s100l <= 4'b0000;
                            if (s100h < 4'b1001)
                                s100h <= s100h + 1;
                            else begin
                                s100h <= 4'b0000;
                                if (s1l < 4'b1001)
                                    s1l <= s1l + 1;
                                else begin
                                    s1l <= 4'b0000;
                                    if (s1h < 4'b1001)
                                        s1h <= s1h + 1;
                                    else
                                        s1h <= 4'b0000;
                                end
                            end
                        end
                    end
                    else begin
                        if (s100l > 4'b0000) 
                            s100l <= s100l - 1;
                        else begin
                            s100l <= 4'b1001;
                            if (s100h > 4'b0000)
                                s100h <= s100h - 1;
                            else begin
                                s100h <= 4'b1001;
                                if (s1l > 4'b0000)
                                    s1l <= s1l - 1;
                                else begin
                                    s1l <= 4'b1001;
                                    if (s1h > 4'b0000)
                                        s1h <= s1h - 1;
                                    else
                                        s1h <= 4'b0111; // Reset to initial value for stopwatch mode.
                                end
                            end
                        end
                    end
                end
                else
                    count <= count + 1;
            end
        end
    end
endmodule