`include "acumulador.v";
`include "contador.v";

module BO(
    input rac, 
    input cac, 
    input set, 
    input dec,
    input[7:0] valor,
    output[7:0] somatorio,
    output zero
);

    acumulador a0();
    contador c0()


endmodule

