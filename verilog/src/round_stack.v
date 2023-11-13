`timescale 1ns/1ps
module round_stack(
    input [63:0] init_perm_plain_text, //text coming out of the inital permutation
    input [0:15][47:0] round_keys, //keys for each round
    output [63:0] plain_text_final_perm  //scrambed text going to final permuation
);

//modules to be created:
//16 round modules all tied together
wire [63:0] round_intermediate [0:15];

genvar i;
generate
    for (i = 0; i < 16; i=i+1) begin : gen_round_stage
        if (i == 0) begin
            round round_stage (.round_64_i(init_perm_plain_text), .round_64_o(round_intermediate[i]), .round_key(round_keys[i]));
        end else begin
            round round_stage (.round_64_i(round_intermediate[i-1]), .round_64_o(round_intermediate[i]), .round_key(round_keys[i]));
        end
    end
endgenerate

assign plain_text_final_perm = {round_intermediate[15][31:0], round_intermediate[15][63:32]}; 

endmodule