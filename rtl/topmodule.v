module traffic_control(
    input clk,
    input reset,
    output [2:0] ns_light,
    output [2:0] ew_light
);
    wire clk_1hz;
    wire clk_2hz;
    wire clk_10hz;
    wire clk_1khz;

    wire timer_enable;
    wire [6:0] time_value;

    wire done;

clk_divider clkdiv_inst(clk,reset,clk_1hz,clk_2hz,clk_10hz,clk_1khz);
timer tim_inst(clk,reset,timer_enable,time_value,done);
traffic_fsm tfsm_inst(clk,reset,done,timer_enable,time_value,ns_light,ew_light);

endmodule;