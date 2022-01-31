module FSM (
    input rst,
    input clk,
    input w,
    output[2:0] y
);
    reg[2:0] J;
    reg[2:0] K;
    reg[2:0] O;

    //equações de excitação
    assign J[0] = (~O[0] & O[1] & O[2] & w);
    assign J[1] = (~O[1] & O[2] & w);
    assign J[2] =(~O[2] & w);

    assign K[0] =(O[0] & O[1] & O[2] & w);
    assign K[1] = (O[1] & O[2] & w);
    assign K[2] = (~O[2] & w);

    assign O[0] = J[0] & ~O[0] | ~K[0] & O[0];
    assign O[1] = J[1] & ~O[1] | ~K[1] & O[1];
    assign O[2] = J[2] & ~O[2] | ~K[2] & O[2];

    assign y[0] = O[0];
    assign y[1] = O[1];
    assign y[2] = O[2];

    always @(posedge clk or rst) begin
       //valor
        if (rst==0) Q <= 000;
        else Q = D;
        //logica
    end
endmodule
module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
reg[2:0] y0;

FSM FSM0(rst0, clk0, w, y0);

always #1 begin
    clk0<=~clk0;
end

initial begin
    $dumpvars;
    #1;
    rst0<=0;
    #1;
    rst0 <=1;
    #1;
    w = 1;
    #16;
    $finish;
end
    
endmodule