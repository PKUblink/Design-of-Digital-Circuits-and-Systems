module timer_controller #(
    parameter S100_PERIOD = 1_000_000, // 100Hz Pulse
    parameter S1_PERIOD = 100 // 1Hz Pulse
    )(
    input clk, // Clock
    input rst,
    input btnu, btnd, btnc, btnl, btnr, // Buttons
    output reg clks100, // 百分之一秒时钟使能
    output reg mode, timer_clr, // 工作模式控制，定时器清零
    output reg clr, ld, dir, state // 秒表清零,置数,方向和状态
    );
    wire [4:0] rising_edge;

    initial begin
        mode = 0;
        timer_clr = 0;
        clr = 0;
        ld = 0;
        dir = 0;
        state = 0;
    end

    edge_detector edge1(
        .clk(clk),
        .rst(rst),
        .sample(btnu),
        .rising_edge(rising_edge[0])
    );
    edge_detector edge2(
        .clk(clk),
        .rst(rst),
        .sample(btnd),
        .rising_edge(rising_edge[1])
    );
    edge_detector edge3(
        .clk(clk),
        .rst(rst),
        .sample(btnc),
        .rising_edge(rising_edge[2])
    );
    edge_detector edge4(
        .clk(clk),
        .rst(rst),
        .sample(btnl),
        .rising_edge(rising_edge[3])
    );
    edge_detector edge5(
        .clk(clk),
        .rst(rst),
        .sample(btnr),
        .rising_edge(rising_edge[4])
    );

    reg [19:0] counter = 0; // 20-bit counter to divide 100MHz clock to 100Hz
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clks100 <= 0;
            mode <= 0;
            timer_clr <= 0;
            clr <= 0;
            ld <= 0;
            dir <= 0;
            state <= 0;
        end
        else begin
            if (rising_edge[2] == 1) mode <= ~mode;
            else mode <= mode;
            if (mode==0 & rising_edge[1]==1)
                timer_clr <= 1;
            else 
                timer_clr <= 0;
            if (mode==1 & rising_edge[1]==1) 
                clr <= 1;
            else 
                clr <= 0;
            if (mode==1 & rising_edge[4]==1)
                ld <= 1;
            else 
                ld <= 0;
            if (mode==1 & rising_edge[3]==1)
                dir <= ~dir;
            else 
                dir <= dir;
            if (mode==1 & rising_edge[0]==1)
                state <= ~state;
            else 
                state <= state;
            end
    end
endmodule