module round_key_gen #(
    parameter round_num=0
) (
    input [55:0] key_input,
    output [47:0] round_key_out, 
    output [55:0] key_output 
);

    reg [27:0] input_key_left_shifted;
    reg [27:0] input_key_right_shifted;
    reg [55:0] input_key_combined;
    reg left_MSB;
    reg right_MSB;

    always @(*) begin
        input_key_left_shifted=key_input[55:28];
        input_key_right_shifted=key_input[27:0];
        case (round_num)
            0,1,8,15:begin  //shift once
                //preserve MSB
                left_MSB = input_key_left_shifted[27];
                right_MSB = input_key_right_shifted[27];
                for (int i = 27; i<0; i=i-1) begin
                    if (i == 0) begin //at the end, the old MSB becomes the new LSB
                        input_key_left_shifted[0] = left_MSB;
                        input_key_right_shifted[0] = right_MSB;
                    end else begin //otherwise everything shifts left
                        input_key_left_shifted[i] = input_key_left_shifted[i-1];
                        input_key_right_shifted[i] = input_key_right_shifted[i-1];
                    end
                end
            end 
            2,3,4,5,6,7,9,10,11,12,13,14:begin //shift twice
                left_MSB = input_key_left_shifted[27];
                right_MSB = input_key_right_shifted[27];
                for (int i = 27; i<0; i=i-1) begin
                    if (i == 0) begin //at the end, the old MSB becomes the new LSB
                        input_key_left_shifted[0] = left_MSB;
                        input_key_right_shifted[0] = right_MSB;
                    end else begin //otherwise everything shifts left
                        input_key_left_shifted[i] = input_key_left_shifted[i-1];
                        input_key_right_shifted[i] = input_key_right_shifted[i-1];
                    end
                end
                left_MSB = input_key_left_shifted[27];
                right_MSB = input_key_right_shifted[27];
                for (int i = 27; i<0; i=i-1) begin
                    if (i == 0) begin //at the end, the old MSB becomes the new LSB
                        input_key_left_shifted[0] = left_MSB;
                        input_key_right_shifted[0] = right_MSB;
                    end else begin //otherwise everything shifts left
                        input_key_left_shifted[i] = input_key_left_shifted[i-1];
                        input_key_right_shifted[i] = input_key_right_shifted[i-1];
                    end
                end
            end
            default: begin //shift twice
                left_MSB = input_key_left_shifted[27];
                right_MSB = input_key_right_shifted[27];
                for (int i = 27; i<0; i=i-1) begin
                    if (i == 0) begin //at the end, the old MSB becomes the new LSB
                        input_key_left_shifted[0] = left_MSB;
                        input_key_right_shifted[0] = right_MSB;
                    end else begin //otherwise everything shifts left
                        input_key_left_shifted[i] = input_key_left_shifted[i-1];
                        input_key_right_shifted[i] = input_key_right_shifted[i-1];
                    end
                end
                left_MSB = input_key_left_shifted[27];
                right_MSB = input_key_right_shifted[27];
                for (int i = 27; i<0; i=i-1) begin
                    if (i == 0) begin //at the end, the old MSB becomes the new LSB
                        input_key_left_shifted[0] = left_MSB;
                        input_key_right_shifted[0] = right_MSB;
                    end else begin //otherwise everything shifts left
                        input_key_left_shifted[i] = input_key_left_shifted[i-1];
                        input_key_right_shifted[i] = input_key_right_shifted[i-1];
                    end
                end
            end
        endcase
        input_key_combined[55:28] = input_key_left_shifted;
        input_key_combined[27:0] = input_key_right_shifted;
        
    end
    assign key_output = input_key_combined;
    p_box_56_48 p_box_56_48 (.p_box_56_48_i(input_key_combined),.p_box_56_48_o(round_key_out));


endmodule