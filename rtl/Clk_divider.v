module clk_divider (
    input clk,
    input reset,

    output reg clk_1hz,
    output reg clk_2hz,
    output reg clk_10hz,
    output reg clk_1khz
    );
parameter CLK_FREQ=100_000_000;
localparam DIV_1HZ = CLK_FREQ/(2*1);
localparam DIV_2HZ = CLK_FREQ/(2*2);
localparam DIV_10HZ = CLK_FREQ/(2*10);
localparam DIV_1KHZ = CLK_FREQ/(2*1000);

reg[31:0] count_1hz;
reg[31:0] count_2hz;
reg[31:0] count_10hz;
reg[31:0] count_1khz;

// Generate 1 Hz clock
always@(posedge clk)begin
    if (reset)begin 
        count_1hz<=0;
        clk_1hz<=0;
    end
    else if (count_1hz==DIV_1HZ-1)begin
         count_1hz <=0;
         clk_1hz<=~clk_1hz; 
    end
    else 
    count_1hz<=count_1hz+1;
end
// Generate 2 Hz clock
always@(posedge clk)begin
    if (reset) begin 
        count_2hz<=0;
        clk_2hz<=0;
    end
    else if (count_2hz==DIV_2HZ-1)begin
         count_2hz <=0;
         clk_2hz<=~clk_2hz; 
    end
    else 
    count_2hz<=count_2hz+1;
end
// Generate 10 Hz clock
always@(posedge clk)begin
    if (reset) begin 
        count_10hz<=0;
        clk_10hz<=0;
    end
    else if (count_10hz==DIV_10HZ-1)begin
         count_10hz <=0;
         clk_10hz<=~clk_10hz; 
    end
    else 
    count_10hz<=count_10hz+1;
end
// Generate 1 KHz clock
always@(posedge clk)begin
    if (reset) begin 
        count_1khz<=0;
        clk_1khz<=0;
    end
    else if (count_1khz==DIV_1KHZ-1)begin
         count_1khz <=0;
         clk_1khz<=~clk_1khz; 
    end
    else 
    count_1khz<=count_1khz+1;
end

endmodule