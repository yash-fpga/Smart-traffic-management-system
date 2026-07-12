module timertb;
reg clk;reg reset;reg [6:0]time_value;reg enable;
wire done;

timer DUT(clk,reset,enable,time_value,done);
always #5 clk=~clk;

initial begin
    $dumpfile("timertb.vcd");
    $dumpvars(0,timertb);
end

initial begin
    clk=0;
    reset=1;
    time_value=5;
    #10 reset=0;
    #2
    enable=1;
    
    #130 $finish;
end
initial begin
$monitor("time = %0t count = %d done =%b",$time,DUT.count,done);
end
endmodule