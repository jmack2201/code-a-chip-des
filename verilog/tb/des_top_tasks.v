
task reset; begin
    plain_text = 64'h00000000;
    cipher_key = 64'h00000000;
    display_inputs(plain_text,cipher_key);
end
endtask

task increase; begin
    plain_text = 64'h12345678;
    cipher_key = 64'h12345678;
    display_inputs(plain_text,cipher_key);
end
endtask

task user_input;
    input [63:0] plain_text_input;
    input [63:0] cipher_key_input;
    begin
        plain_text = plain_text_input;
        cipher_key = cipher_key_input;
        display_inputs(plain_text,cipher_key);
end
endtask

task display_inputs;
    input [63:0] plain_text;
    input [63:0] cipher_key;
    begin
        $display("========================================");
        $display("Inputs to DES:");
        $display("\tPlain Text: 64x%h",plain_text);
        $display("\tCipher Key: 64x%h",cipher_key);
        $display("========================================");
    end
endtask