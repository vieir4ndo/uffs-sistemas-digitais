module ula (
    input[15:0] E0,
    input[15:0] E1,
    input chave,
    output[15:0] saida
);

reg[15:0] out;

assign saida = out;

always @(E0, E1, chave) begin
     case(chave)
        1'b1 : out = E0 * E1;
        default : out = E0 + E1;
    endcase
end
endmodule