module timer(
    input clk,
    input reset,
    input enable,
    input [6:0]time_value, // 128 seconds at max

    output reg done
);

reg [6:0]count;
always @(posedge clk)begin
    if (reset)begin
        count<=0;
        done<=0;
    end
    else begin
        done<=0;
        if (enable)begin
        if (count+1==time_value) begin
        done<=1;
        count<=0;
        end
        else count<=count+1;
    end
    end
end
    

endmodule