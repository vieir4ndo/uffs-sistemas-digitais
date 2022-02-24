module mux (
    input[15:0] E0,
    input[15:0] E1,
    input chave,
    output[15:0] saida
);
    case (chave)
        1'b0 : assign saida = E0 + E1;
        1'b1 : assign saida = E0 * E1;
    endcase
endmodule