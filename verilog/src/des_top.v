`include "des_config.v"
module des_top (
    input [63:0] plain_text, //input plain text
    input [63:0] cipher_key, //assumes parity bits are not dropped
    input clk,rstn,valid_in,encrypt_decrypt, //whether 0 for encryption and 1 for decryption
    output reg valid_out,
    output reg [63:0] cipher_text //final scrambled text
);
    reg [63:0] init_perm_in;
    reg [63:0] cipher_key_in;
    wire [63:0] init_perm_out;
    wire [63:0] final_perm_in;
    wire [63:0] final_perm_out;

    reg valid_i;
    wire valid_o_key;
    wire valid_out_round_stack;
    wire [767:0] round_keys_output;

    //Input and Output Flop for Valid, Plain and Cipher Text
    always @(posedge clk ) begin
        if (!rstn) begin
            cipher_text <= 0;
            init_perm_in <= 0;
            valid_i <= 0;
            valid_out <= 0;
            cipher_key_in <= 0;
        end else begin
            cipher_text <= final_perm_out;
            init_perm_in <= plain_text;
            valid_i <= valid_in;
            valid_out <= valid_out_round_stack;
            cipher_key_in <= cipher_key;
        end
    end

    //Instantiates main modules

    init_perm init_perm (.init_p_box_i(init_perm_in), .init_p_box_o(init_perm_out));

    key_gen #(.NUM_STAGES_FF(`NUM_KEY_STAGES_FF)) key_gen(.clk(clk),.rstn(rstn),.valid_i(valid_i),.valid_o(valid_o_key),.init_key(cipher_key_in), .round_keys(round_keys_output), .encrypt_decrypt(encrypt_decrypt));

    round_stack #(.NUM_STAGES_FF(`NUM_ROUND_STAGES_FF)) round_stack (.init_perm_plain_text(init_perm_out), .round_keys(round_keys_output), .clk(clk), .rstn(rstn),.valid_in(valid_o_key),.valid_out(valid_out_round_stack), .plain_text_final_perm(final_perm_in));

    final_perm final_perm (.final_p_box_i(final_perm_in), .final_p_box_o(final_perm_out));
    
endmodule
