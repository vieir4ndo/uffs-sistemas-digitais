`include "BC.v"
`include "BO.v"

module project(
    input rst0,
    input clk0,
    input start,
    input[7:0] valor,
    output[7:0] resultado, 
    output done
);
wire zero;
wire set;
wire rac;
wire cac;
wire dec;

BC BC0(rst0, clk0, start, zero, set, rac, dec, cac, done);
BO BO0(clk0, rst0, rac, cac, set, dec, valor, resultado, zero);
    
endmodule

