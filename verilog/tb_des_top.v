`timescale 1ns/1ps
module tb_des_top ();
    reg clk;
    reg [63:0] key;
    reg [63:0] text_input;
    reg [63:0] scrambled_output;

    des_top des_top (.plain_text(text_input),.cipher_key(key),.cipher_text(scrambled_output));

    initial begin
        key = 64'h0000000000000000;
        text_input = 64'h0123456789abcdef;
        $dumpfile("des_top.vcd");
        $dumpvars;
        #10
        $finish;
    end

endmodule