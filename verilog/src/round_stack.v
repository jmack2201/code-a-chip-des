module round_stack #(
    parameter NUM_STAGES_FF=0
) (
    input [63:0] init_perm_plain_text, //text coming out of the inital permutation
    input [767:0] round_keys, //keys for each round
    input clk,rstn,valid_in,
    output valid_out,
    output [63:0] plain_text_final_perm  //scrambed text going to final permuation
);

//modules to be created:
//16 round modules all tied together
wire [63:0] round_intermediate [0:15];
//wire [63:0] round_intermediate_ff [0:15];
wire valid_intermediate [0:15];

genvar i;
generate
    for (i = 0; i < 16; i=i+1) begin : gen_round_stage
        if (i == 0) begin
            round #(.ROUND_NUM(i+1),.NUM_STAGES_FF(NUM_STAGES_FF)) round_stage (.round_64_i(init_perm_plain_text), .round_64_o(round_intermediate[i]), .round_key(round_keys[767-48*i:720-48*i]),.clk(clk),.rstn(rstn),.valid_i(valid_in),.valid_o(valid_intermediate[i]));
        end else begin
            round #(.ROUND_NUM(i+1),.NUM_STAGES_FF(NUM_STAGES_FF)) round_stage (.round_64_i(round_intermediate[i-1]), .round_64_o(round_intermediate[i]), .round_key(round_keys[767-48*i:720-48*i]),.clk(clk),.rstn(rstn),.valid_i(valid_intermediate[i-1]),.valid_o(valid_intermediate[i]));
        end
    end
endgenerate

assign valid_out = valid_intermediate[15];
assign plain_text_final_perm = {round_intermediate[15][31:0], round_intermediate[15][63:32]}; 

endmodule
