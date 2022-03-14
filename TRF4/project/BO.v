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
    output[7:0] soma,
    output zero0
);

    wire[7:0] saidaAcumulador;
    wire[7:0] saidaULA;
    wire[3:0] saidaContador;
    reg zero;

    assign saidaULA = saidaAcumulador + valor;
    assign soma = saidaAcumulador;
    assign zero0 = zero;

    acumulador a0(saidaULA, cac, rac, saidaAcumulador);
    contador c0(clk, rst, set, dec, saidaContador);

    always @(posedge clk or rst) begin
        if (saidaContador == 3'b000) zero <= 1;
        else zero <= 0;
    end
endmodule

