module BO (
    input rst,
    input clk,
    input[15:0] A,
    input[15:0] B,
    input[15:0] C,
    input[15:0] Xis,
    input[1:0] m0,
    input[1:0] m1,
    input[1:0] m2,
    input lx,
    input ls,
    input lh,
    input h,
    output[15:0] resultado
);

reg[15:0] R1, R2, R3, TEMP;

assign resultado = R1;

always @(posedge clk or rst) begin
        if (rst==1) 
        begin
            R1 <= 0000;
            R2 <= 0000;
            R3 <= 0000;
            TEMP <= 0000;
        end

        //ESTADO B
        if (m0[0] == 0 & m0[1] == 0 & m0[0] == 0 & m0[1] == 0 & m0[0] == 0 & m0[1] == 0 & lx == 1 & ls == 0 & lh==0 & h == 1)
        begin 
            TEMP <= Xis * Xis;
        end

        //ESTADO C
        if (m0[0] == 0 & m0[1] == 0 & m1[0] == 0 & m1[1] == 0 & m2[0] == 0 & m2[1] == 0 & lx == 1 & ls == 0 & lh==1 & h == 1)
        begin 
            R2 <= Xis * Xis;
        end

        //ESTADO D
        if (m0[0] == 0 & m0[1] == 1 & m1[0] == 0 & m1[1] == 1 & m2[0] == 1 & m2[1] == 1 & lx == 1 & ls == 0 & lh==0 & h == 1)
        begin 
            TEMP <= R2 * A;
        end

        //ESTADO E
        if (m0[0] == 0 & m0[1] == 1 & m1[0] == 0 & m1[1] == 1 & m2[0] == 1 & m2[1] == 1 & lx == 1 & ls == 0 & lh==1 & h == 1)
        begin 
            R2 <= TEMP;
        end

        //ESTADO F
        if (m0[0] == 1 & m0[1] == 0 & m1[0] == 0 & m1[1] == 1 & m2[0] == 0 & m2[1] == 0 & lx == 1 & ls == 0 & lh==0 & h == 1)
        begin 
            TEMP <= Xis * B;
        end

        //ESTADO G
        if (m0[0] == 1 & m0[1] == 0 & m1[0] == 0 & m1[1] == 1 & m2[0] == 0 & m2[1] == 0 & lx == 1 & ls == 1 & lh==0 & h == 1)
        begin 
            R1 <= TEMP;
        end

        //ESTADO H
        if (m0[0] == 0 & m0[1] == 0 & m1[0] == 1 & m1[1] == 1 & m2[0] == 1 & m2[1] == 0 & lx == 1 & ls == 0 & lh==0 & h == 0)
        begin 
            TEMP <= R1 + R2;
        end

        //ESTADO I
        if (m0[0] == 0 & m0[1] == 0 & m1[0] == 1 & m1[1] == 1 & m2[0] == 1 & m2[1] == 0 & lx == 1 & ls == 0 & lh==1 & h == 0)
        begin 
            R2 <= TEMP;
        end

        //ESTADO J
        if (m0[0] == 1 & m0[1] == 1 & m1[0] == 0 & m1[1] == 1 & m2[0] == 1 & m2[1] == 1 & lx == 1 & ls == 0 & lh==0 & h == 0)
        begin 
            TEMP <= R2 + C;
        end

        //ESTADO K
        if (m0[0] == 1 & m0[1] == 1 & m1[0] == 0 & m1[1] == 1 & m2[0] == 1 & m2[1] == 1 & lx == 1 & ls == 1 & lh==0 & h == 0)
        begin 
            R1 <= TEMP;
        end
    end
endmodule
