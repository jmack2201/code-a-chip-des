module des_top (
    input [63:0] plain_text, //input plain text
    input [63:0] cipher_key, //assumes parity bits are not dropped
    output [63:0] cipher_text //final scrambled text
);

    reg [63:0] text_i;
    reg [63:0] init_perm_out;
    reg [63:0] final_perm_in;

    init_perm init_perm (.init_p_box_i(plain_text), .init_p_box_o(init_perm_out));

    reg [47:0] round_keys_output [15:0];

    key_gen key_gen(.init_key(cipher_key), .round_keys(round_keys_output));

    round_stack round_stack (.init_perm_plain_text(init_perm_out), .round_keys(round_keys_output), .plain_text_final_perm(final_perm_in));

    final_perm final_perm (.final_p_box_i(final_perm_in), .final_p_box_o(cipher_text));
    
endmodule