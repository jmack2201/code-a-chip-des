module key_mux (
    input encrypt_decrypt,
    input [767:0] round_keys_i,
    output reg [767:0] round_keys_o
);
    //muxes the key order to go out to the rounds
    integer i;
    always @(*) begin    
        for (i = 0; i < 16; i = i +1) begin
            case (i)
                0: round_keys_o[767:720] = !encrypt_decrypt ? round_keys_i[767:720] : round_keys_i[47:0];
                1: round_keys_o[719:672] = !encrypt_decrypt ? round_keys_i[719:672] : round_keys_i[95:48];
                2: round_keys_o[671:624] = !encrypt_decrypt ? round_keys_i[671:624] : round_keys_i[143:96];
                3: round_keys_o[623:576] = !encrypt_decrypt ? round_keys_i[623:576] : round_keys_i[191:144];
                4: round_keys_o[575:528] = !encrypt_decrypt ? round_keys_i[575:528] : round_keys_i[239:192];
                5: round_keys_o[527:480] = !encrypt_decrypt ? round_keys_i[527:480] : round_keys_i[287:240];
                6: round_keys_o[479:432] = !encrypt_decrypt ? round_keys_i[479:432] : round_keys_i[335:288];
                7: round_keys_o[431:384] = !encrypt_decrypt ? round_keys_i[431:384] : round_keys_i[383:336];
                8: round_keys_o[383:336] = !encrypt_decrypt ? round_keys_i[383:336] : round_keys_i[431:384];
                9: round_keys_o[335:288] = !encrypt_decrypt ? round_keys_i[335:288] : round_keys_i[479:432];
                10: round_keys_o[287:240] = !encrypt_decrypt ? round_keys_i[287:240] : round_keys_i[527:480];
                11: round_keys_o[239:192] = !encrypt_decrypt ? round_keys_i[239:192] : round_keys_i[575:528];
                12: round_keys_o[191:144] = !encrypt_decrypt ? round_keys_i[191:144] : round_keys_i[623:576];
                13: round_keys_o[143:96] = !encrypt_decrypt ? round_keys_i[143:96] : round_keys_i[671:624];
                14: round_keys_o[95:48] = !encrypt_decrypt ? round_keys_i[95:48] : round_keys_i[719:672];
                15: round_keys_o[47:0] = !encrypt_decrypt ? round_keys_i[47:0] : round_keys_i[767:720];
                default: round_keys_o[767:720] = !encrypt_decrypt ? round_keys_i[767:720] : round_keys_i[47:0];
            endcase
        end
    end
    
endmodule
