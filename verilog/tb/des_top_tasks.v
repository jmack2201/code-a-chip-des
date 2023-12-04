
task reset; begin
    @(posedge clk);
    plain_text = 64'h00000000;
    cipher_key = 64'h00000000;
    rstn = 1'b0;
    valid_in = 1'b0;
    repeat(5) @(posedge clk);
    rstn = 1'b1;
end
endtask

task single_input;
    input [63:0] plain_text_input;
    input [63:0] cipher_key_input;
    input encrypt_decrypt_input;
    begin
        reset();
        send_inputs(plain_text_input,cipher_key_input,encrypt_decrypt_input);
    end
endtask

task display_inputs;
    input [63:0] plain_text;
    input [63:0] cipher_key;
    begin
        $display("====================================================");
        $display("Inputs to DES:");
        $display("\tPlain Text: 64x%h",plain_text);
        $display("\tCipher Key: 64x%h",cipher_key);
        $display("\tOperation: %s",test_str);
    end
endtask

task send_inputs;
    input [63:0] plain_text_input;
    input [63:0] cipher_key_input;
    input encrypt_decrypt_input;
    begin
        @(posedge clk);
        valid_in = 1'b1;
        plain_text = plain_text_input;
        cipher_key = cipher_key_input;
        encrypt_decrypt = encrypt_decrypt_input;
        display_inputs(plain_text,cipher_key);
        @(posedge clk);
        valid_in = 1'b0;
    end
endtask

task multiple_inputs;
    input [63:0] plain_text_input;
    input [63:0] cipher_key_input;
    input encrypt_decrypt_input;
    begin
        reset();
        send_inputs(plain_text_input,cipher_key_input,encrypt_decrypt_input);
        @(posedge valid_out);
        send_inputs(64'h85E813540F0AB405,cipher_key_input,1);
    end
endtask