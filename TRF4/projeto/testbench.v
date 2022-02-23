`include "project.v"

module testbench;

reg rst0 = 1;
reg clk0= 0;
reg start = 0;
wire[15:0] A = 3;
wire[15:0] B = 10;
wire[15:0] C = 5;
wire[15:0] Xis = 3;
wire[15:0] resultado;
wire done;

project project0(rst0, clk0, start, A, B, C, Xis, resultado, done);

always #1 begin
    clk0<=~clk0;
end

initial begin
    $dumpvars;
    #1;
    rst0 <=0;
    start = 1;
    #1;
    start = 0;
    #30;
    $finish;
end
    
endmodule