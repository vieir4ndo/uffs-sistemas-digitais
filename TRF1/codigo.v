module FSM (
    input rst,
    input clk,
    input w,
    output[2:0] y
);
    reg[2:0] Q;
    wire[2:0] D;

    //equações de excitação
    assign D[0] = (Q[0] & ~w | w & ~Q[0]);
    assign D[1] = (~w & Q[1] | ~Q[0] & Q[1] | w & Q[0] & ~Q[1]);
    assign D[2] = (~w & Q[2] | ~Q[0] & Q[2] | w & Q[0] & Q[1] & ~Q[2] | ~Q[1] & Q[2]);

    assign y[0] = Q[0];
    assign y[1] = Q[1];
    assign y[2] = Q[2];

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