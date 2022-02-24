module mux (
    input[15:0] E0,
    input[15:0] E1,
    input[15:0] E2,
    input[15:0] E3,
    input[1:0] chave,
    output[15:0] saida
);

reg[15:0] out;
assign saida = out;

    always @ (E0, E1, E2, E3) begin
        case (chave)
            2'b00 : out <= E0;
            2'b01 : out <= E1;
            2'b10 : out <= E2;
            default : out <= E3;
        endcase
    end
endmodule