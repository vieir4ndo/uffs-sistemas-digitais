`include "BC.v"
`include "BO.v"

module project(
    input rst0,
    input clk0,
    input start,
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] Xis,
    output[15:0] resultado, 
    output done
);

wire[3:0] Y;
wire[1:0] m0;
wire[1:0] m1;
wire[1:0] m2;
wire lx;
wire ls;
wire lh;
wire h;

BC BC0(rst0, clk0, start, Y, m0, m1, m2, lx, ls, lh, h, done);
BO BO0(rst0, clk0, A, B, C, Xis, m0, m1, m2, lx, ls, lh, h, resultado);
    
endmodule