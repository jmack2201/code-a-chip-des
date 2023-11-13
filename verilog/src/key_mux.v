`timescale 1ns/1ps
module key_mux (
    input encrypt_decrypt,
    input [0:15][47:0] round_keys_i,
    output [0:15][47:0] round_keys_o
);
    integer i;
    for (i = 0; i < 16; i = i +1) begin
        assign round_keys_o[i] = !encrypt_decrypt ? round_keys_i[i] : round_keys_i[15-i];
    end

endmodule