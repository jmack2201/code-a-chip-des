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
        check = $value$plusargs("encrypt_decrypt=%b",encrypt_decrypt);

        case (testname)
            "user_input" : user_input(user_plain_text,user_cipher_key);
            "reset" : reset();
            default: reset();
        endcase
        $monitor("====================================================\nTime: %d\nCLK: %d\tCipher Text: 64x%h Valid: %d",$time,clk,cipher_text,valid_out);
        #50 $finish;
    end
    `include "des_top_tasks.v"
endmodule