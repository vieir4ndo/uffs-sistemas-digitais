module FSM (
    input rst,
    input clk,
    input w,
    output[3:0] Y,
    output[1:0] m0,
    output[1:0] m1,
    output[1:0] m2,
    output lx,
    output ls,
    output lh,
    output h,
    output done
);
    wire[3:0] J;
    wire[3:0] K;
    reg[3:0] y;
    
    assign J[0] = y[0] & y[1] & y[2];
    assign J[1] = y[0] & y[1];
    assign J[2] = y[0] & (~y[2] | y[1]);
    assign J[3] = y[0] & y[2] | ~y[1] & ~y[2] & ~y[3] & w;

    assign K[0] = y[1];
    assign K[1] = y[0] & y[1];
    assign K[2] = y[3] & y[0];
    assign K[3] = 1;

    assign Y[0] = y[0];
    assign Y[1] = y[1];
    assign Y[2] = y[2];
    assign Y[3] = y[3];

    assign m0[0] = Y[0] & Y[3] | Y[1] & Y[3] | Y[0] & ~Y[1] & Y[2] | ~Y[0] & Y[1] & Y[2];
    assign m0[1] = Y[1] & ~Y[2] | Y[0] & Y[3];
    assign m1[0] = Y[0] & Y[1] & Y[2] | ~Y[0] & ~Y[1] & Y[2];
    assign m1[1] = Y[2] | Y[3] | Y[0] & Y[1];
    assign m2[0] = Y[3] | Y[0] & Y[1] | ~Y[0] & ~Y[1] & Y[2];
    assign m2[1] = Y[0] & Y[3] | Y[1] & Y[3] | Y[0] & Y[1] & ~Y[2] | ~Y[0] & ~Y[1] & Y[2];
    assign lx = ~(~Y[0] & ~Y[1] & ~Y[2] & ~Y[3]);
    assign ls = Y[1] & Y[3] | ~Y[0] & Y[1] & Y[2];
    assign lh = ~Y[0] & ~Y[1] & Y[2] | ~Y[0] & ~Y[1] & Y[3] | ~Y[0] & Y[1] & ~Y[2] & ~Y[3];
    assign h = ~Y[1] & Y[2] | Y[0] & ~Y[2] & ~Y[3] | ~Y[0] & Y[1] & ~Y[3];
    assign done = Y[1] & Y[3];

    always @(posedge clk or rst) begin
        if (rst==1) y <= 0000;
        else y = J & ~y | ~K & y;
    end
endmodule


module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
wire[3:0] Y;
wire[1:0] m0;
wire[1:0] m1;
wire[1:0] m2;
wire lx;
wire ls;
wire lh;
wire h;
wire done;

FSM FSM0(rst0, clk0, w, Y, m0, m1, m2, lx, ls, lh, h, done);

always #1 begin
    clk0<=~clk0;
end

initial begin
    $dumpvars;
    #1;
    rst0 <=0;
    w = 1;
    #1;
    w = 0;
    #30;
    $finish;
end
    
endmodule