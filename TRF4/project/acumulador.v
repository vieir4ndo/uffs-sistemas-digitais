module acumulador (
    input[7:0] D, 
    input load,
    input rst,
    output[7:0] Q
);
    reg[7:0] Y;

    assign Q = Y;

    always @(posedge load or rst) begin
        if (rst==1) Y <= 8'b00000000;
        else Y = D;
    end
endmodule