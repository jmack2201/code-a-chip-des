module p_box_32_48 (
    input [1:32] p_box_i,
    output [1:48] p_box_o 
);
    //expands input to fiestel function to be XORed with sub-key
    assign p_box_o[1] = p_box_i[32];
    assign p_box_o[2] = p_box_i[1];
    assign p_box_o[3] = p_box_i[2];
    assign p_box_o[4] = p_box_i[3];
    assign p_box_o[5] = p_box_i[4];
    assign p_box_o[6] = p_box_i[5];
    assign p_box_o[7] = p_box_i[4];
    assign p_box_o[8] = p_box_i[5];
    assign p_box_o[9] = p_box_i[6];
    assign p_box_o[10] = p_box_i[7];
    assign p_box_o[11] = p_box_i[8];
    assign p_box_o[12] = p_box_i[9];
    assign p_box_o[13] = p_box_i[8];
    assign p_box_o[14] = p_box_i[9];
    assign p_box_o[15] = p_box_i[10];
    assign p_box_o[16] = p_box_i[11];
    assign p_box_o[17] = p_box_i[12];
    assign p_box_o[18] = p_box_i[13];
    assign p_box_o[19] = p_box_i[12];
    assign p_box_o[20] = p_box_i[13];
    assign p_box_o[21] = p_box_i[14];
    assign p_box_o[22] = p_box_i[15];
    assign p_box_o[23] = p_box_i[16];
    assign p_box_o[24] = p_box_i[17];
    assign p_box_o[25] = p_box_i[16];
    assign p_box_o[26] = p_box_i[17];
    assign p_box_o[27] = p_box_i[18];
    assign p_box_o[28] = p_box_i[19];
    assign p_box_o[29] = p_box_i[20];
    assign p_box_o[30] = p_box_i[21];
    assign p_box_o[31] = p_box_i[20];
    assign p_box_o[32] = p_box_i[21];
    assign p_box_o[33] = p_box_i[22];
    assign p_box_o[34] = p_box_i[23];
    assign p_box_o[35] = p_box_i[24];
    assign p_box_o[36] = p_box_i[25];
    assign p_box_o[37] = p_box_i[24];
    assign p_box_o[38] = p_box_i[25];
    assign p_box_o[39] = p_box_i[26];
    assign p_box_o[40] = p_box_i[27];
    assign p_box_o[41] = p_box_i[28];
    assign p_box_o[42] = p_box_i[29];
    assign p_box_o[43] = p_box_i[28];
    assign p_box_o[44] = p_box_i[29];
    assign p_box_o[45] = p_box_i[30];
    assign p_box_o[46] = p_box_i[31];
    assign p_box_o[47] = p_box_i[32];
    assign p_box_o[48] = p_box_i[1];
endmodule
