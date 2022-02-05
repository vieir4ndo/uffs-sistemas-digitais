module FSM (
    input rst,
    input clk,
    input w,
    output[1:0] y,
    output[2:0] registradorSaida,
    output done
);
    wire[1:0] J;
    wire[1:0] K;
    reg[1:0] O;
    wire h1, h2, h3, c1, c2, c3;
    reg r1, r2, r3;
    
    assign J[0] = (~O[0] & O[1]);
    assign J[1] = w;

    assign K[0] =(O[0] & ~O[1]);
    assign K[1] = (O[0] & O[1]);

    assign y[0] = O[0];
    assign y[1] = O[1];

    assign c1 = (O[0] & ~O[1]);
    assign h3 = (O[0] & ~O[1]);
        
    assign done = (O[0] & ~O[1]);

    assign h1 = (O[0] & O[1]);
    assign c2 = (O[0] & O[1]);

    assign h2 = (~O[0] & O[1]);
    assign c3 =  (~O[0] & O[1]);

    assign registradorSaida[2] = r3;
    assign registradorSaida[1] = r2;
    assign registradorSaida[0] = r1;

    always @(posedge clk or rst) begin
       //valor
        if (rst==1)
        begin
            O <= 00;
            r1 <= 1; r2 <= 0; r3<=0;
        end
        else O = J & ~O | ~K & O;
        //logica
        //r3 = r2
        if (h2==1 & c3==1) r3 <= r2;
        //r2 = r1
        if (h1==1 & c2==1) r2 <= r1;
        //r1 = r3
        if (c1==1 & h3==1) r1 <= r3;
    end
endmodule
module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
wire[2:0] registrador0;
wire done;
wire[1:0] y;

FSM FSM0(rst0, clk0, w, y, registrador0, done);

always #1 begin
    clk0<=~clk0;
end

initial begin
    $dumpvars;
    #1;
    rst0 <=0;
    w = 1;
    #1;
    //w = 0;
    #16;
    $finish;
end
    
endmodule