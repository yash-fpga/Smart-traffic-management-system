module clk_dividertb;
    reg clk;reg reset;
    wire clk_1hz;wire clk_2hz;wire clk_10hz;wire clk_1khz;

    always #5 clk=~clk;
    clk_divider DUT(clk,reset,clk_1hz, clk_2hz, clk_10hz, clk_1khz);

    initial begin
    $dumpfile("clk_divider.vcd");
    $dumpvars(0, clk_dividertb);
end

    initial begin
        clk=0;
        reset=1;
        #5 reset=0;


#5000;
        $finish;
    end



endmodule