`include "des_config.v"
module key_gen (
    input [63:0] init_key,
    input encrypt_decrypt,
    input clk,rstn,valid_i,
    output reg valid_o,
    output reg [767:0] round_keys 
);
    //higher level module for sub-key generation
    wire [55:0] permutated_key;

    p_box_64_56 p_box_64_56(.p_box_64_56_i(init_key),.p_box_64_56_o(permutated_key)); 

    wire [55:0] key_gen_intermediate [0:15];

    //depending on if we are encrypting or decrypting, the keys get sent out in a different order
    wire [767:0] round_keys_intermediate_out;
    wire [767:0] round_keys_mux_out;
    key_mux key_mux(.encrypt_decrypt(encrypt_decrypt), .round_keys_i(round_keys_intermediate_out), .round_keys_o(round_keys_mux_out));

    case (`ROUND_KEY_OUT_FF)
        1: begin
            always @(posedge clk ) begin
                if (!rstn) begin
                    round_keys <= 0;
                    valid_o <= 0;
                end else begin
                    round_keys <= round_keys_mux_out;
                    valid_o <= valid_intermediate[15];
                end
            end
            
        end
        default: begin
            always @(valid_intermediate[15],round_keys_mux_out) begin
                round_keys = round_keys_mux_out;
                valid_o = valid_intermediate[15];
            end
        end
    endcase
    wire valid_intermediate [0:15];

    genvar i;
    generate
        for (i = 0; i < 16 ; i=i+1 ) begin : gen_round_key
            if (i == 0) begin
                round_key_gen #(.round_num(i+1)) round_key_gen_stage (.valid_i(valid_i),.valid_o(valid_intermediate[i]),.key_input(permutated_key), .key_output(key_gen_intermediate[i]), .round_key_out(round_keys_intermediate_out[767-48*i:720-48*i]));
            end else begin
                round_key_gen #(.round_num(i+1)) round_key_gen_stage (.valid_i(valid_intermediate[i-1]),.valid_o(valid_intermediate[i]),.key_input(key_gen_intermediate[i-1]), .key_output(key_gen_intermediate[i]), .round_key_out(round_keys_intermediate_out[767-48*i:720-48*i]));    
            end
        end
    endgenerate
endmodule
