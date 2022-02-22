
module testbench;

reg rst0 = 1;
reg clk0= 0;
reg w = 0;
wire[3:0] Y;
wire[1:0] m0;
wire[1:0] m1;
wire[1:0] m2;
wire[15:0] A = 0011;
wire[15:0] B = 0010;
wire[15:0] C = 0000;
wire[15:0] Xis = 0001;
wire[15:0] resultado;
wire lx;
wire ls;
wire lh;
wire h;
wire done;

BC BC0(rst0, clk0, w, Y, m0, m1, m2, lx, ls, lh, h, done);
BO BO0(rst0, clk0, A, B, C, Xis, m0, m1, m2, lx, ls, lh, h, resultado);

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