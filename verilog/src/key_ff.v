module key_ff (
    input clk, rstn,
    input valid_i,
    input [55:0] key_in_ff,
    output reg valid_o,
    output reg [55:0] key_out_ff
);
    //implements a FF for pipelining
    always @(posedge clk ) begin
        if (!rstn) begin
            valid_o <= 0;
            key_out_ff <=0;
        end else begin
            valid_o <= valid_i;
            key_out_ff <= key_in_ff;
        end
    end
endmodule
