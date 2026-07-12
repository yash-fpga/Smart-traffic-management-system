module traffic_control_tb;

reg clk;
reg reset;

wire [2:0] ns_light;
wire [2:0] ew_light;

traffic_control DUT (
    .clk(clk),
    .reset(reset),
    .ns_light(ns_light),
    .ew_light(ew_light)
);

// Generate clock
always #5 clk = ~clk;

// Dump waveform
initial begin
    $dumpfile("traffic_control.vcd");
    $dumpvars(0, traffic_control_tb);
end

// Monitor important signals
initial begin
    $monitor("Time=%0t | State=%b | NS=%b | EW=%b | Timer=%0d | Done=%b",
             $time,
             DUT.tfsm_inst.state,
             ns_light,
             ew_light,
             DUT.time_value,
             DUT.done);
end

// Stimulus
initial begin
    clk = 0;
    reset = 1;

    #20;
    reset = 0;

    // Run long enough to observe multiple state transitions
    #400;

    $finish;
end

endmodule