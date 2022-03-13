`include "project.v"

module testbench;

    reg rst0 = 1;
    reg clk0 = 0;
    reg start = 0;
    reg[7:0] valor = 8'b00000011;
    wire[7:0] resultado;
    wire done;

   project project0(rst0, clk0, start, valor, resultado, done);

    always #1 begin
        clk0<=~clk0;
    end

   initial begin
    $dumpvars;
    #1;
    start <= 1;
    rst0 <= 0;
    #1;
    start <= 1;
    #16;
    $finish;
    end
endmodule

