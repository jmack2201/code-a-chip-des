module round_ff (
    input clk, rstn,
    input valid_i,
    input [63:0] round_in,
    output reg valid_o,
    output reg [63:0] round_out
);
    //implements a FF for pipelining
    always @(posedge clk ) begin
        if (!rstn) begin
            round_out <= 0;
            valid_o <= 0;
        end else begin
            round_out <= round_in;
            valid_o <= valid_i;
        end
    end
endmodule
