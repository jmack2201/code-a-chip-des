module feistel_function (
    input [47:0] round_key,
    input [31:0] feistel_input,
    output [31:0] feistel_output 
);
    //modules to be created:
    //p box expansion 32-48, s-box 6-4, p box 32-32 
    logic [47:0] fiestel_input_expand;
    p_box_32_48 p_box_32_48 (.p_box_i(feistel_input),.p_box_o(fiestel_input_expand));

    logic [47:0] s_box_input;
    assign s_box_input = fiestel_input_expand ^ round_key;
    logic [31:0] s_box_output;
    s_box_48_32 s_box_48_32 (.s_box_48_32_i(s_box_input),.s_box_48_32_o(s_box_output));
    p_box_32_32 p_box_32_32 (.p_box_32_32_i(s_box_output),.p_box_32_32_o(feistel_output));
endmodule