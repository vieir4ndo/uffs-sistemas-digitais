module FSM (
    input rst,
    input clk,
    input w,
    output[1:0] y
);
    wire[1:0] J;
    wire[1:0] K;
    reg[1:0] O;
    
    //equações de excitação
    assign J[0] = (~O[0] & O[1]);
    assign J[1] = w;

    assign K[0] =(O[0] & ~O[1]);
    assign K[1] = (O[0] & O[1]);

    assign y[0] = O[0];
    assign y[1] = O[1];

    always @(posedge clk or rst) begin
       //valor
        if (rst==1) O <= 00;
        else O = J & ~O | ~K & O;
        //logica
    end
endmodule
module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
wire[1:0] y0;

FSM FSM0(rst0, clk0, w, y0);

always #1 begin
    clk0<=~clk0;
end

initial begin
    $dumpvars;
    #1;
    rst0<=1;
    #1;
    rst0 <=0;
    #1;
    w = 1;
    #1;
    w = 0;
    #16;
    $finish;
end
    
endmodule