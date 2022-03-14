module contador(
    input clk,
    input rst,
    input load,
    input decrement,
    output[3:0] O
    );

    reg[3:0] OUT;

    assign O = OUT;

    always @(clk or rst) begin
        if (rst == 1) OUT <= 3'b000;
        else if (load == 1) OUT <= 3'b100;
        else if (decrement == 1 & OUT != 0 ) OUT <= OUT - 1;
    end
endmodule

// module testbench;

//     reg rst = 1;
//     reg clk= 0;
//     wire[3:0] outp;
//     reg decrement = 0;
//     reg load = 0;

//    contador c1(clk, rst, load, decrement, outp);

//     always #1 begin
//         clk<=~clk;
//     end

//    initial begin
//     $dumpvars;
//     #1;
//     rst <=0;
//     load <=1;
//     #2;
//     decrement <=1;
//     load <=0;
//     #16;
//     $finish;
//     end
// endmodule

