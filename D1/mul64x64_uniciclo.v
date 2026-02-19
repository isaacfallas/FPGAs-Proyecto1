module mul64x64_uniciclo (
    input  wire     clk,    // clock
    input  wire     [31:0] a_hi,   // input a msb
    input  wire     [31:0] a_low,   // input a lsb
    input  wire     [31:0] b_hi,   // input b msb
    input  wire     [31:0] b_low,   // input b lsb
    output reg    [31:0] product_w0,  // output product word 0
    output reg    [31:0] product_w1,  // output product word 1
    output reg    [31:0] product_w2,  // output product word 2
    output reg    [31:0] product_w3  // output product word 3
); 


    wire [127:0] result_mult;
    
    assign result_mult = {a_hi, a_low}*{b_hi, b_low};
    
    always @(posedge clk) begin
        product_w0 <= result_mult[31:0];
        product_w1 <= result_mult[63:32];
        product_w2 <= result_mult[95:64];
        product_w3 <= result_mult[127:96];
    end

endmodule




