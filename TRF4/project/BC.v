module BC (
    input rst,
    input clk,
    input start,
    input zero,
    output set,
    output rac,
    output dec,
    output cac,
    output pronto
);
    reg[1:0] Q;
    wire[1:0] D;

    wire A, B, C, D;
    assign A = Q[1];
    assign B = Q[0];
    assign C = start;
    assign D = zero;


    //equações de excitação
    assign D[0] = (A & ~B | ~A & B & D | ~B & C | C & D);
    assign D[1] = (~A & B);

    assign set = (~Q[0] & ~Q[1]);
    assign rac = (~Q[0] & ~Q[1]);

    assign set = (Q[1] & ~Q[0]);
    assign cac = (Q[1] & ~Q[0]);

    assign pronto = (Q[1] & Q[0] | ~Q[1] & ~Q[0]);

    always @(posedge clk or rst) begin
        if (rst==1) Q <= 00;
        else Q <= D;
    end
endmodule