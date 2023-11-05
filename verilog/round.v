`timescale 1ns/1ps
module round (
    input [63:0] round_64_i,
    input [47:0] round_key,
    output [63:0] round_64_o     
);

//modules to be created:
//feistel function

//create left and right
wire [31:0] round_left_start;
wire [31:0] round_right_start;

wire [31:0] round_left_end;
wire [31:0] round_right_end;

assign round_left_start = round_64_i[63:32];
assign round_right_start = round_64_i[31:0];

reg [31:0] feistel_out;

feistel_function feistel_function (.feistel_input(round_right_start),.feistel_output(feistel_out),.round_key(round_key));

//figuring out ending left and right
assign round_left_end = round_right_start;
assign round_right_end = round_left_start ^ feistel_out;

//puting left and right together for the output
assign round_64_o[63:32] = round_left_end;
assign round_64_o[31:0] = round_right_end;

endmodule