module contador(
    input             clk,
    input             clear,
    input             load,
    input             count,
    output reg[3:0]   OUT
    );

    always @(posedge clk)
    if (load == 1) OUT <= 3'b100;
    else if (count == 1 & OUT != 0 ) OUT <= OUT - 1;
endmodule

// module testbench;

//     reg clear = 1;
//     reg clk= 0;

//     wire[2:0] y0;
//     reg [3:0] IN;
//     wire[3:0] OUT;
//     reg count = 0;
//     reg load = 0;

//    contador c1(clk, clear, load, count, OUT);

//     always #1 begin
//         clk<=~clk;
//     end

//    initial begin
//     $dumpvars;
//     #1;
//     clear <=0;
//     count <=1;
//     load <=1;
//     #1;
//     load <=0;
//     #16;
//     $finish;
//     end
// endmodule

