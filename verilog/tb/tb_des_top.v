`timescale 1ns/1ps
module tb_des_top ();
    reg clk;
    reg [63:0] cipher_key;
    reg [63:0] plain_text;
    reg encrypt_decrypt;
    wire [63:0] cipher_text;
    reg rstn;
    reg valid_in;
    wire valid_out;

    reg [63:0] user_cipher_key;
    reg [63:0] user_plain_text;

    real clk_period;
    parameter duty_cycle = 0.5;

    reg [8*1000:0] testname;
    reg [8*10:0] test_str;

    integer check;

    des_top des_top (.*);

    initial begin
        forever begin
            clk <= 1'b0;
            #(clk_period - (clk_period * duty_cycle)) clk = 1'b1;
            #(clk_period * duty_cycle);
        end
    end

    initial begin
        $dumpfile("des_top.vcd");
        $dumpvars;
        check = $value$plusargs("test_name=%s",testname);
        check = $value$plusargs("clk_period=%f",clk_period);
        check = $value$plusargs("user_plain_text=%h",user_plain_text);
        check = $value$plusargs("user_cipher_key=%h",user_cipher_key);
        check = $value$plusargs("encrypt_decrypt=%s",test_str);
        if (test_str  == "Encryption") begin
            encrypt_decrypt = 0;
        end else begin
            encrypt_decrypt = 1;
        end

        case (testname)
            "single_input" : single_input(user_plain_text,user_cipher_key,encrypt_decrypt);
            "pipeline" : pipeline(user_plain_text,user_cipher_key,encrypt_decrypt);
            "reset" : reset();
            default: reset();
        endcase
        $monitor("===================================================================\nTime: %d\nCLK: %d\tRSTn: %d\tCipher Text: %h\tValid: %d",$time,clk,rstn,cipher_text,valid_out);
        #250 $finish;
    end
    `include "des_top_tasks.v"
endmodule