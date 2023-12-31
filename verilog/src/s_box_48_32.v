module s_box_48_32 (
    input [47:0] s_box_48_32_i,
    output [31:0] s_box_48_32_o 
);
    //splits input into 6-bit splices for S-Box Operation
    genvar j;
    generate
        for (j = 0; j < 8; j=j+1) begin : gen_s_box_6_4//slice the input and output into 8 pieces to be given to a single s-box
            s_box_6_4 #(.s_number(j)) s_box_6_4 (.s_box_6_4_i(s_box_48_32_i[47-j*6:42-j*6]),.s_box_6_4_o(s_box_48_32_o[31-j*4:28-j*4]));
        end
    endgenerate
endmodule
