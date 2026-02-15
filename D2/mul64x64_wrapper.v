module mul64x64_wrapper(
    input wire clk,
    input wire rst_n,
    input wire [63:0] a,
    input wire [63:0] b,
    output wire [127:0] result
    );
    
 mul64x64 dut (
    .clk  (clk),
    .rst_n(rst_n),
    .a    (a),
    .b    (b),
    .out  (result)
  );

endmodule