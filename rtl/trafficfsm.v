module traffic_fsm(
    input clk,
    input reset,
    input done,

    output reg timer_enable,
    output reg [6:0] time_value,
    output reg [2:0] ns_light,
    output reg [2:0] ew_light
);
reg [1:0] state,next_state;
parameter GREEN = 3'b001;
parameter YELLOW = 3'b010;
parameter RED = 3'b100;

parameter NS_GREEN=2'b00;
parameter NS_YELLOW=2'b01;
parameter EW_GREEN=2'b10;
parameter EW_YELLOW=2'b11;

always@(posedge clk)begin   
    if (reset) 
        state<=NS_GREEN;
    else 
        state<=next_state;
end

// NEXT STATE LOGIC
always@(*)begin
    case(state)
    NS_GREEN: next_state=(done)?NS_YELLOW:NS_GREEN;
    NS_YELLOW: next_state=(done)?EW_GREEN:NS_YELLOW;
    EW_GREEN: next_state=(done)?EW_YELLOW:EW_GREEN;
    EW_YELLOW:next_state=(done)?NS_GREEN:EW_YELLOW;
    default: next_state=NS_GREEN;
    endcase
end

//OUTPUT LOGIC
always@(*)begin
        timer_enable=1;
        ns_light=RED;
        ew_light=RED;
        time_value=0;
    case(state)    
    NS_GREEN:begin 
        ns_light=GREEN;
        ew_light=RED;
        time_value=5;
    end
    NS_YELLOW:begin 
        ns_light=YELLOW;
        ew_light=RED;
        time_value=2;
    end 
    EW_GREEN:begin 
        ns_light=RED;
        ew_light=GREEN;
        time_value=5;
    end 
    EW_YELLOW:begin 
        ns_light=RED;
        ew_light=YELLOW;
        time_value=2;
    end
    endcase
end

endmodule