module BC (
    input rst,
    input clk,
    input w,
    output[3:0] Y,
    output[0:1] m0,
    output[0:1] m1,
    output[0:1] m2,
    output lx,
    output ls,
    output lh,
    output h,
    output done
);
    wire[0:3] J;
    wire[0:3] K;
    reg[3:0] y;


    assign J[0] = y[0] & y[1] & y[2];
    assign K[0] = y[1];

    assign J[1] = y[0] & y[1];
    assign K[1] = y[0] & y[1];

    assign J[2] = y[0];
    assign K[2] = y[3] | y[0];

    assign J[3] = ~y[3] & y[1] | y[2] | ~y[1] & y[3] | ~y[3] & w;
    assign K[3] = 1;


    assign Y[0] = y[0];
    assign Y[1] = y[1];
    assign Y[2] = y[2];
    assign Y[3] = y[3];

    assign m0[0] = (Y[2] & ~Y[1] & Y[0]) | (Y[2] & Y[1] & ~Y[0]) | (Y[3] & Y[0]) | (Y[3] & Y[1]);
    assign m0[1] = (~Y[2] & Y[1] & Y[0]) | (Y[2] & ~Y[1] & ~Y[0]) | (Y[3] & Y[0]) | (Y[3] & Y[1]);
    assign m1[0] = (Y[2] & Y[1] & Y[0]) | (Y[3] & ~Y[1] & ~Y[0]);
    assign m1[1] = (Y[1] & Y[0]) | (Y[2]) | (Y[3]);
    assign m2[0] = (Y[1] & Y[0]) | (Y[2] & ~Y[1] & ~Y[0]) | (Y[3]);
    assign m2[1] = (~Y[2] & Y[1] & Y[0]) | (Y[2] & ~Y[1] & ~Y[0]) | (Y[3] & Y[0]) | (Y[3] & Y[1]);

    assign lx = ~(~Y[0] & ~Y[1] & ~Y[2] & ~Y[3]);
    assign ls = Y[1] & Y[3] | ~Y[0] & Y[1] & Y[2];
    assign lh = ~Y[0] & ~Y[1] & Y[2] | ~Y[0] & ~Y[1] & Y[3] | ~Y[0] & Y[1] & ~Y[2] & ~Y[3];
    assign h = ~Y[1] & Y[2] | Y[0] & ~Y[2] & ~Y[3] | ~Y[0] & Y[1] & ~Y[3];
    assign done = Y[1] & Y[3];

    always @(posedge clk or rst) begin
        if (rst==1) y <= 4'b0000;
        else y = J & ~y | ~K & y;
    end
endmodule