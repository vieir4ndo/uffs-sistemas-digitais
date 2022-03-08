module contador (
    input[1:0] T, 
    input clk,
    input rst,
    output[1:0] O
);
    reg[1:0] J;
    reg[1:0] K;

    reg[1:0] Output;


    assign J[0] = T;
    assign J[1] = Output[0];

    assign K[0] = T;
    assign K[1] = Output[0];

    assign O = Output;

   always @(posedge clk or rst) begin
        if (rst==1) O <= 000;
        else Output = J & ~Output | ~K & Output;
    end
endmodule