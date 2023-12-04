module p_box_32_32 (
    input [1:32] p_box_32_32_i,
    output [1:32] p_box_32_32_o 
);
    //performs permutation after S-Box substitution
    assign p_box_32_32_o[1] = p_box_32_32_i[16];
    assign p_box_32_32_o[2] = p_box_32_32_i[7];
    assign p_box_32_32_o[3] = p_box_32_32_i[20];
    assign p_box_32_32_o[4] = p_box_32_32_i[21];
    assign p_box_32_32_o[5] = p_box_32_32_i[29];
    assign p_box_32_32_o[6] = p_box_32_32_i[12];
    assign p_box_32_32_o[7] = p_box_32_32_i[28];
    assign p_box_32_32_o[8] = p_box_32_32_i[17];
    assign p_box_32_32_o[9] = p_box_32_32_i[1];
    assign p_box_32_32_o[10] = p_box_32_32_i[15];
    assign p_box_32_32_o[11] = p_box_32_32_i[23];
    assign p_box_32_32_o[12] = p_box_32_32_i[26];
    assign p_box_32_32_o[13] = p_box_32_32_i[5];
    assign p_box_32_32_o[14] = p_box_32_32_i[18];
    assign p_box_32_32_o[15] = p_box_32_32_i[31];
    assign p_box_32_32_o[16] = p_box_32_32_i[10];
    assign p_box_32_32_o[17] = p_box_32_32_i[2];
    assign p_box_32_32_o[18] = p_box_32_32_i[8];
    assign p_box_32_32_o[19] = p_box_32_32_i[24];
    assign p_box_32_32_o[20] = p_box_32_32_i[14];
    assign p_box_32_32_o[21] = p_box_32_32_i[32];
    assign p_box_32_32_o[22] = p_box_32_32_i[27];
    assign p_box_32_32_o[23] = p_box_32_32_i[3];
    assign p_box_32_32_o[24] = p_box_32_32_i[9];
    assign p_box_32_32_o[25] = p_box_32_32_i[19];
    assign p_box_32_32_o[26] = p_box_32_32_i[13];
    assign p_box_32_32_o[27] = p_box_32_32_i[30];
    assign p_box_32_32_o[28] = p_box_32_32_i[6];
    assign p_box_32_32_o[29] = p_box_32_32_i[22];
    assign p_box_32_32_o[30] = p_box_32_32_i[11];
    assign p_box_32_32_o[31] = p_box_32_32_i[4];
    assign p_box_32_32_o[32] = p_box_32_32_i[25];
endmodule
