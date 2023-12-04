module round_key_gen #(
    parameter round_num=0,
    parameter NUM_STAGES_FF=0
) (
    input [55:0] key_input,
    input clk,rstn,valid_i,
    output valid_o,
    output [47:0] round_key_out, 
    output [55:0] key_output 
);

    //performs circular left shift and instantiates key compression box
    reg [27:0] input_key_left_shifted;
    reg [27:0] input_key_right_shifted;
    reg [55:0] input_key_combined;
    reg [27:0] input_key_left, input_key_right;
    always @(*) begin
        input_key_left=key_input[55:28];
        input_key_right=key_input[27:0];
        case (round_num-1)
            0,1,8,15:begin  //shift once
                input_key_left_shifted = {input_key_left[26:0],input_key_left[27]};
                input_key_right_shifted = {input_key_right[26:0],input_key_right[27]};
            end 
            2,3,4,5,6,7,9,10,11,12,13,14:begin //shift twice
                input_key_left_shifted = {input_key_left[25:0],input_key_left[27:26]};
                input_key_right_shifted = {input_key_right[25:0],input_key_right[27:26]};
            end
            default: begin //shift twice
                input_key_left_shifted = {input_key_left[25:0],input_key_left[27:26]};
                input_key_right_shifted = {input_key_right[25:0],input_key_right[27:26]};
            end
        endcase
        input_key_combined = {input_key_left_shifted,input_key_right_shifted};
    end
    
    p_box_56_48 p_box_56_48 (.p_box_56_48_i(input_key_combined),.p_box_56_48_o(round_key_out));

    assign key_output = input_key_combined;
    assign valid_o = valid_i;

endmodule
