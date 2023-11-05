`timescale 1ns/1ps
module tb_des_top ();
    logic clk;
    logic [63:0] key;
    logic [63:0] text_input;
    logic [63:0] scrambled_output;

    des_top des_top (.plain_text(text_input),.cipher_key(key),.cipher_text(scrambled_output));

    initial begin
        key = 64'h0000000000000000;
        text_input = 64'h0123456789abcdef;
        $dumpfile("des.vcd");
        $dumpvars;
        #10
        $finish;
    end

endmodule