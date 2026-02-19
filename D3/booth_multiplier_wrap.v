module booth_multiplier_wrap (
    // global signals
    input wire clk,                             // input CLK at 300 MHz
    input wire reset_L,                         // input reset on LOW

    // control signals
    input wire init,                            // strobe to start the computation
    output wire idle,                           // indicates the module idle state
    output wire valid,                          // asserts a valid product after computation is complete

    // operand signals
    input wire [63:0] multiplicand,             // the multiplicand
    input wire [63:0] multiplier,               // the multiplier
    output wire [127:0] product                 // the product
);

booth_multiplier #(.N(64)) dut (
    .clk(clk),
    .reset_L(reset_L),
    .init(init),
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .idle(idle),
    .valid(valid),
    .product(product)
);

endmodule


