module digital_timer #(
    parameter S100_PERIOD = 1_000_000, // 100Hz Pulse
    parameter S1_PERIOD = 100 // 1Hz Pulse
    )(
    input clk, // Clock
    input rst,
    input btnu, btnd, btnc, btnl, btnr, // Buttons
    input [14:0] data, // 秒表置数初值
    output [14:0] count_out, // Timer regs
    output leda, ledb // Led lights indication
    );

    wire mode, timer_clr, clr, ld, dir, state, clks100;
    wire [3:0] minh, minl, sech, secl, s1h, s1l, s100h, s100l;

    timer_controller my_controller(
        .clk(clk),
        .rst(rst),
        .btnu(btnu),
        .btnd(btnd),
        .btnc(btnc),
        .btnl(btnl),
        .btnr(btnr),
        .clks100(clks100),
        .mode(mode),
        .timer_clr(timer_clr),
        .clr(clr),
        .ld(ld),
        .dir(dir),
        .state(state)
    );
    timer_datapath my_datapath(
        .clk(clk),
        .rst(rst),
        .data(data),
        .clks100(clks100),
        .mode(mode),
        .timer_clr(timer_clr),
        .clr(clr),
        .ld(ld),
        .dir(dir),
        .state(state),
        .minh(minh),
        .minl(minl),
        .sech(sech),
        .secl(secl),
        .s1h(s1h),
        .s1l(s1l),
        .s100h(s100h),
        .s100l(s100l),
        .leda(leda),
        .ledb(ledb)
    );

    reg [14:0] result;
    assign count_out = result;
    always @(*) begin
        if (mode == 0)
            result = {minh, minl, sech, secl};
        else
            result = {s1h, s1l, s100h, s100l};
    end

endmodule