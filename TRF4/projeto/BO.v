`include "registrador.v"
`include "mux.v"
`include "ula.v"

module BO (
    input rst,
    input clk,
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] Xis,
    input[0:1] m0,
    input[0:1] m1,
    input[0:1] m2,
    input lx,
    input ls,
    input lh,
    input h,
    output[15:0] resultado
);

wire[15:0] saidaMux0, saidaMux1, saidaMux2, saidaR0, saidaR1, saidaR2, saidaULA;

registrador R0(Xis, lx, rst, saidaR0);

mux multiplexador0(A, A, B, C, m0, saidaMux0);
mux multiplexador1(saidaR0, saidaMux0, saidaR1, saidaR2, m1, saidaMux1);
mux multiplexador2(saidaR0, saidaMux0, saidaR1, saidaR2, m2, saidaMux2);

ula ula0(saidaMux2, saidaMux1, h, saidaULA);
registrador R1(saidaULA, ls, rst, saidaR1);
registrador R2(saidaULA, lh, rst, saidaR2);

assign resultado = saidaR1;

endmodule
