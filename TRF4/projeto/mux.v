module mux (
    input[15:0] E0,
    input[15:0] E1,
    input[15:0] E2,
    input[15:0] E3,
    input[1:0] chave,
    output[15:0] saida
);
    case (chave)
        2'b00 : assign saida = E0;
        2'b01 : assign saida = E1;
        2'b10 : assign saida = E2;
        2'b11: assign saida = E3;
    endcase
endmodule