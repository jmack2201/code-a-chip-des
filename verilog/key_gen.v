`timescale 1ns/1ps
module key_gen (
    input [63:0] init_key ,
    output [0:15][47:0] round_keys 
);

    //drop the parity bits on input
    wire [55:0] permutated_key;

    assign permutated_key[55] = init_key[56];
    assign permutated_key[54] = init_key[48];
    assign permutated_key[53] = init_key[40];
    assign permutated_key[52] = init_key[32];
    assign permutated_key[51] = init_key[24];
    assign permutated_key[50] = init_key[16];
    assign permutated_key[49] = init_key[8];
    assign permutated_key[48] = init_key[0];
    assign permutated_key[47] = init_key[57];
    assign permutated_key[46] = init_key[49];
    assign permutated_key[45] = init_key[41];
    assign permutated_key[44] = init_key[33];
    assign permutated_key[43] = init_key[25];
    assign permutated_key[42] = init_key[17];
    assign permutated_key[41] = init_key[9];
    assign permutated_key[40] = init_key[1];
    assign permutated_key[39] = init_key[58];
    assign permutated_key[38] = init_key[50];
    assign permutated_key[37] = init_key[42];
    assign permutated_key[36] = init_key[34];
    assign permutated_key[35] = init_key[26];
    assign permutated_key[34] = init_key[18];
    assign permutated_key[33] = init_key[10];
    assign permutated_key[32] = init_key[2];
    assign permutated_key[31] = init_key[59];
    assign permutated_key[30] = init_key[51];
    assign permutated_key[29] = init_key[43];
    assign permutated_key[28] = init_key[35];
    assign permutated_key[27] = init_key[62];
    assign permutated_key[26] = init_key[54];
    assign permutated_key[25] = init_key[46];
    assign permutated_key[24] = init_key[38];
    assign permutated_key[23] = init_key[30];
    assign permutated_key[22] = init_key[22];
    assign permutated_key[21] = init_key[14];
    assign permutated_key[20] = init_key[6];
    assign permutated_key[19] = init_key[61];
    assign permutated_key[18] = init_key[53];
    assign permutated_key[17] = init_key[45];
    assign permutated_key[16] = init_key[37];
    assign permutated_key[15] = init_key[29];
    assign permutated_key[14] = init_key[21];
    assign permutated_key[13] = init_key[13];
    assign permutated_key[12] = init_key[5];
    assign permutated_key[11] = init_key[60];
    assign permutated_key[10] = init_key[52];
    assign permutated_key[9] = init_key[44];
    assign permutated_key[8] = init_key[36];
    assign permutated_key[7] = init_key[28];
    assign permutated_key[6] = init_key[20];
    assign permutated_key[5] = init_key[12];
    assign permutated_key[4] = init_key[4];
    assign permutated_key[3] = init_key[27];
    assign permutated_key[2] = init_key[19];
    assign permutated_key[1] = init_key[11];
    assign permutated_key[0] = init_key[3];

    wire [55:0] key_gen_intermediate [0:16];

    genvar i;
    generate
        for (i = 0; i < 16 ;i=i+1 ) begin : gen_round_key
            if (i == 0) begin
                round_key_gen #(.round_num(i)) round_key_gen_stage (.key_input(permutated_key), .key_output(key_gen_intermediate[i]), .round_key_out(round_keys[i]));
            end else if (i==15) begin
                round_key_gen #(.round_num(i)) round_key_gen_stage (.key_input(key_gen_intermediate[i]), .key_output(key_gen_intermediate[i+1]), .round_key_out(round_keys[i]));
            end else begin
                round_key_gen #(.round_num(i)) round_key_gen_stage (.key_input(key_gen_intermediate[i-1]), .key_output(key_gen_intermediate[i]), .round_key_out(round_keys[i]));    
            end
        end
    endgenerate
endmodule