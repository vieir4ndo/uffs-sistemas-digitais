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
    wire[1:0] D0;

    wire A, B, C, D;
    assign A = Q[1];
    assign B = Q[0];
    assign C = start;
    assign D = zero;

    //equações de excitação
    assign D0[0] = (~B & A | C & ~B | D & B & ~A);
    assign D0[1] = (~A & B);

    assign set = (~Q[0] & ~Q[1]);
    assign rac = (~Q[0] & ~Q[1]);

    assign set = (Q[1] & ~Q[0]);
    assign cac = (Q[1] & ~Q[0]);

    assign pronto = (Q[1] & Q[0] | ~Q[1] & ~Q[0]);

    always @(posedge clk or rst) begin
        if (rst==1) Q <= 00;
        else Q <= D0;
    end
endmodule

// module testbench;

// reg rst0 = 1;
// reg clk0= 0;
// reg zero = 0;
// reg start = 0;
// wire set;
// wire rac;
// wire dec;
// wire cac;
// wire pronto;

// BC BC0(rst0, clk0, start, zero, set, rac, dec, cac, pronto);

// always #1 begin
//     clk0<=~clk0;
// end

// initial begin
//     $dumpvars;
//     #1;
//     rst0<=0;
//     #1;
//     start <=1;
//     #10;
//     zero <=1;
//     #10;
//     $finish;
// end
    
// endmodule