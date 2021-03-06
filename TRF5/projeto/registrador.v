module registrador (
    input[15:0] D, 
    input load,
    input rst,
    output[15:0] Q
);
    reg[15:0] Y;

    assign Q = Y;

    always @(posedge load or rst) begin
        if (rst==1) Y <= 16'b0000000000000000;
        else Y = D;
    end
endmodule