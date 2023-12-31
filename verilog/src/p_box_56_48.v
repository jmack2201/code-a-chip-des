module p_box_56_48 (
    input [1:56] p_box_56_48_i,
    output [1:48] p_box_56_48_o 
);
    //compresses the key before sending it to the round
    assign p_box_56_48_o[1] = p_box_56_48_i[14];
    assign p_box_56_48_o[2] = p_box_56_48_i[17];
    assign p_box_56_48_o[3] = p_box_56_48_i[11];
    assign p_box_56_48_o[4] = p_box_56_48_i[24];
    assign p_box_56_48_o[5] = p_box_56_48_i[1];
    assign p_box_56_48_o[6] = p_box_56_48_i[5];
    assign p_box_56_48_o[7] = p_box_56_48_i[3];
    assign p_box_56_48_o[8] = p_box_56_48_i[28];
    assign p_box_56_48_o[9] = p_box_56_48_i[15];
    assign p_box_56_48_o[10] = p_box_56_48_i[6];
    assign p_box_56_48_o[11] = p_box_56_48_i[21];
    assign p_box_56_48_o[12] = p_box_56_48_i[10];
    assign p_box_56_48_o[13] = p_box_56_48_i[23];
    assign p_box_56_48_o[14] = p_box_56_48_i[19];
    assign p_box_56_48_o[15] = p_box_56_48_i[12];
    assign p_box_56_48_o[16] = p_box_56_48_i[4];
    assign p_box_56_48_o[17] = p_box_56_48_i[26];
    assign p_box_56_48_o[18] = p_box_56_48_i[8];
    assign p_box_56_48_o[19] = p_box_56_48_i[16];
    assign p_box_56_48_o[20] = p_box_56_48_i[7];
    assign p_box_56_48_o[21] = p_box_56_48_i[27];
    assign p_box_56_48_o[22] = p_box_56_48_i[20];
    assign p_box_56_48_o[23] = p_box_56_48_i[13];
    assign p_box_56_48_o[24] = p_box_56_48_i[2];
    assign p_box_56_48_o[25] = p_box_56_48_i[41];
    assign p_box_56_48_o[26] = p_box_56_48_i[52];
    assign p_box_56_48_o[27] = p_box_56_48_i[31];
    assign p_box_56_48_o[28] = p_box_56_48_i[37];
    assign p_box_56_48_o[29] = p_box_56_48_i[47];
    assign p_box_56_48_o[30] = p_box_56_48_i[55];
    assign p_box_56_48_o[31] = p_box_56_48_i[30];
    assign p_box_56_48_o[32] = p_box_56_48_i[40];
    assign p_box_56_48_o[33] = p_box_56_48_i[51];
    assign p_box_56_48_o[34] = p_box_56_48_i[45];
    assign p_box_56_48_o[35] = p_box_56_48_i[33];
    assign p_box_56_48_o[36] = p_box_56_48_i[48];
    assign p_box_56_48_o[37] = p_box_56_48_i[44];
    assign p_box_56_48_o[38] = p_box_56_48_i[49];
    assign p_box_56_48_o[39] = p_box_56_48_i[39];
    assign p_box_56_48_o[40] = p_box_56_48_i[56];
    assign p_box_56_48_o[41] = p_box_56_48_i[34];
    assign p_box_56_48_o[42] = p_box_56_48_i[53];
    assign p_box_56_48_o[43] = p_box_56_48_i[46];
    assign p_box_56_48_o[44] = p_box_56_48_i[42];
    assign p_box_56_48_o[45] = p_box_56_48_i[50];
    assign p_box_56_48_o[46] = p_box_56_48_i[36];
    assign p_box_56_48_o[47] = p_box_56_48_i[29];
    assign p_box_56_48_o[48] = p_box_56_48_i[32];
endmodule
