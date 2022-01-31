module FSM (
    input rst,
    input clk,
    input w,
    output[2:0] y
);
    wire[2:0] J;
    wire[2:0] K;
    reg[2:0] O;

    //equações de excitação
    assign J[2] = (~O[2] & O[1] & O[0] & w);
    assign J[1] = (~O[1] & O[0] & w);
    assign J[0] =(~O[0] & w);

    assign K[2] =(O[2] & O[1] & O[0] & w);
    assign K[1] = (O[1] & O[0] & w);
    assign K[0] = (O[0] & w);

    assign y[0] = O[0];
    assign y[1] = O[1];
    assign y[2] = O[2];

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
wire[2:0] y0;

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