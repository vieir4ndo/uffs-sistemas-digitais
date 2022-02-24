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
    input[1:0] m0,
    input[1:0] m1,
    input[1:0] m2,
    input lx,
    input ls,
    input lh,
    input h,
    registrador resultado
);

wire[15:0] m00, mux0, m01,m02;

registrador R0(Xis, lx, rst, );
registrador R1(Saida, ls, rst, resultado);
registrador R2(Saida, lh, rst, );

mux multiplexador0(Xis, A, B, C, m0, mux0);
mux multiplexador0(0, A, B, C, m0, mux0);

assign resultado = R1;

always @(posedge clk or rst) begin
        if (rst==1) 
        begin
            R1 <= 0000;
            R2 <= 0000;
        end

    end
endmodule
