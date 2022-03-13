`include "acumulador.v"
`include "contador.v"

module BO(
    input clk,
    input rst,
    input rac, 
    input cac, 
    input set, 
    input dec,
    input[7:0] valor,
    output[7:0] somatorio,
    output zero
);

    wire[7:0] saidaAcumulador;
    wire[7:0] saidaULA;
    wire[3:0] saidaContador;

    assign saidaULA = saidaAcumulador + valor;
    assign zero = saidaContador[0] & ~saidaContador[1] & ~saidaContador[2];
    assign somatorio = saidaULA;

    acumulador a0(saidaULA, cac, rac, saidaAcumulador);
    contador c0(clk, rst, set, dec, saidaContador);

endmodule

