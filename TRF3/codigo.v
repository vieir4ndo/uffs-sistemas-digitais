module FSM (
    input rst,
    input clk,
    input w,
    input[2:0] registrador,
    output[2:0] c,
    output[2:0] h,
    output done
);
    wire[1:0] J;
    wire[1:0] K;
    reg[1:0] O;
    
    //equações de excitação
    assign J[0] = (~O[0] & O[1]);
    assign J[1] = w;

    assign K[0] =(O[0] & ~O[1]);
    assign K[1] = (O[0] & O[1]);

    assign c[0] = (O[0] & ~O[1]);
    assign h[2] = (O[0] & ~O[1]);
    assign done = (O[0] & ~O[1]);

    assign h[0] = (O[0] & O[1]);
    assign c[1] = (O[0] & O[1]);

    assign h[1] = (~O[0] & O[1]);
    assign c[2] =  (~O[0] & O[1]);

    always @(posedge clk or rst) begin
       //valor
        if (rst==0) O <= 000;
        else O = J & ~O | ~K & O;
        //logica
    end
endmodule
module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
wire done;
wire[2:0] c;
wire[2:0] h;
reg[2:0] registrador;

FSM FSM0(rst0, clk0, w, registrador, c, h, done);

always #1 begin
    clk0<=~clk0;
    if (h[1] & c[2]) registrador[2] <= registrador[1];
    if (h[0] & c[1]) registrador[1] <= registrador[0];
    if (c[0] & h[2]) registrador[0] <= registrador[2];
end

initial begin
    $dumpvars;
    #1;
    rst0<=1;
    registrador[0] <= 1;
    registrador[1] <= 0;
    registrador[3] <= 0;
    #1;
    rst0 <=0;
    #1;
    w = 1;
    #1;
    w = 0;
    #4;
    $finish;
end
    
endmodule