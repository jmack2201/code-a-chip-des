module s_box_6_4 #(
    parameter s_number = 0
)(
    input [5:0] s_box_6_4_i,
    output [3:0] s_box_6_4_o 
);
    //get row and column
    wire [1:0] row;
    wire [3:0] column;

    assign row[1] = s_box_6_4_i[5];
    assign row[0] = s_box_6_4_i[0];
    assign column = s_box_6_4_i[4:1];

    reg [63:0] s_box_lut [0:3];
    wire [63:0] s_box_6_4_o_row;
    //based on what s number, we have a different LUT
    always @(s_box_6_4_i) begin : s_box
        case (s_number)
        0: begin
            s_box_lut[0] = 64'he4d12fb83a6c5907;
            s_box_lut[1] = 64'h0f74e2d1a6cb9538;
            s_box_lut[2] = 64'h41e8d62bfc973a50;
            s_box_lut[3] = 64'hfc8249175b3ea06d;
        end 
        1: begin
            s_box_lut[0] = 64'hf18e6b34972dc05a;
            s_box_lut[1] = 64'h3d47f28ec01a69b5;
            s_box_lut[2] = 64'h0e7ba4d158c6932f;
            s_box_lut[3] = 64'hd8a13f42b67c05e9;
        end
        2: begin
            s_box_lut[0] = 64'ha09e63f51dc7b428;
            s_box_lut[1] = 64'hd709346a285ecbf1;
            s_box_lut[2] = 64'hd6498f30b12c5ae7;
            s_box_lut[3] = 64'h1ad069874fe3b52c;
        end
        3: begin
            s_box_lut[0] = 64'h7de3069a1285bc4f;
            s_box_lut[1] = 64'hd8b56f03472c1ae9;
            s_box_lut[2] = 64'ha690cb7df13e5284;
            s_box_lut[3] = 64'h3f06a1d8945bc72e;
        end
        4: begin
            s_box_lut[0] = 64'h2c417ab6853fd0e9;
            s_box_lut[1] = 64'heb2c47d150fa3986;
            s_box_lut[2] = 64'h421bad78f9c5630e;
            s_box_lut[3] = 64'hb8c71e2d6f09a453;
        end
        5: begin
            s_box_lut[0] = 64'hc1af92680d34e75b;
            s_box_lut[1] = 64'haf427c9561de0b38;
            s_box_lut[2] = 64'h9ef528c3704a1db6;
            s_box_lut[3] = 64'h432c95fabe17608d;
        end
        6: begin
            s_box_lut[0] = 64'h4b2ef08d3c975a61;
            s_box_lut[1] = 64'hd0b7491ae35c2f86;
            s_box_lut[2] = 64'h14bdc37eaf680592;
            s_box_lut[3] = 64'h6bd814a7950fe23c;
        end
        7: begin
            s_box_lut[0] = 64'hd2846fb1a93e50c7;
            s_box_lut[1] = 64'h1fd8a374c56b0e92;
            s_box_lut[2] = 64'h7b419ce206adf358;
            s_box_lut[3] = 64'h21e74a8dfc90356b;
        end
        default: begin
            s_box_lut[0] = 64'h0000000000000000;
            s_box_lut[1] = 64'h0000000000000000;
            s_box_lut[2] = 64'h0000000000000000;
            s_box_lut[3] = 64'h0000000000000000;
        end
    endcase
    end
    //we just access the LUT to get the value
    assign s_box_6_4_o_row = s_box_lut[row];
    reg [3:0] out;
    always @(s_box_6_4_o_row) begin
        case (column)
            15: out = s_box_6_4_o_row[3:0];
            14: out = s_box_6_4_o_row[7:4];
            13: out = s_box_6_4_o_row[11:8];
            12: out = s_box_6_4_o_row[15:12];
            11: out = s_box_6_4_o_row[19:16];
            10: out = s_box_6_4_o_row[23:20];
            9: out = s_box_6_4_o_row[27:24];
            8: out = s_box_6_4_o_row[31:28];
            7: out = s_box_6_4_o_row[35:32];
            6: out = s_box_6_4_o_row[39:36];
            5: out = s_box_6_4_o_row[43:40];
            4: out = s_box_6_4_o_row[47:44];
            3: out = s_box_6_4_o_row[51:48];
            2: out = s_box_6_4_o_row[55:52];
            1: out = s_box_6_4_o_row[59:56];
            0: out = s_box_6_4_o_row[63:60];
            default: out = s_box_6_4_o_row[63:60];
        endcase
    end
    assign s_box_6_4_o = out;
endmodule
