`timescale 1ns/1ps

module booth_multiplier #(
    parameter N = 64                            // parameter for input operand sizes
)(
    // global signals
    input logic clk,                            // input CLK at 300 MHz
    input logic reset_L,                        // input reset on LOW

    // control signals
    input logic init,                           // strobe to start the computation
    output logic idle,                          // indicates the module idle state
    output logic valid,                         // asserts a valid product after computation is complete

    // operand signals
    input logic signed [N-1:0] multiplicand,    // the multiplicand
    input logic signed [N-1:0] multiplier,      // the multiplier
    output logic signed [2*N-1:0] product       // the product
);


// Internal signals
logic signed [N:0]      a;          // accumulator register
logic signed [N:0]      nextA;      // next A register
logic signed [N-1:0]    q;          // multiplier register
logic                   qm1;        // Q-1 bit register
logic signed [N:0]      m;          // multiplicand register
logic [$clog2(N+1)-1:0] count;      // counter
logic signed [2*N+1:0]  shift_reg;  // shift register

// combination logic to compute nextA
// based on booth encoding
// and to shift the registers
always @(*) begin
    // get the next a from A register
    nextA = a;
    // compute based on booth encoding
    unique case ({q[0], qm1})
        2'b01: nextA = a + m;
        2'b10: nextA = a - m;
        default: ;
    endcase
    // shift the combined registers
    shift_reg = $signed({nextA, q, qm1}) >>> 1;
end

// sequential logic part
// of the booth multiplier
always_ff @(posedge clk) begin

    // reset state
    if(!reset_L) begin
        idle <= 1'b1;   // idle on reset
        valid <= 1'b0;  // not valid on reset
        product <= '0;  // product reset value
        a <= '0;        // accumulator reset value
        q <= '0;        // multiplier_reg reset value
        qm1 <= '0;      // q-1 reset value
        m <= '0;        // multiplicand_reg reset value
        count <= '0;    // counter reset value is 0
    end
    // logic when out of reset
    else begin

        // init with valid at 0
        valid <= 1'b0;

        // init condition: 
        // init assertion and not idle
        if (init && idle) begin
            // do initialization
            idle <= 1'b0;                           // not idle anymore
            a <= '0;                                // accumulator inits as '0
            q <= multiplier;                        // q registers inits as the multiplier
            qm1 <= '0;                              // q-1 inits as 0
            m <= {multiplicand[N-1], multiplicand}; // m registers inits as sign-extended multiplicand
            count <= N[$clog2(N+1)-1:0];            // counters inits as N
        end
        // not idle (or busy) logic
        // it is actually a loop that runs
        // for N-cycles due to the radix-2 algorithm
        else if(!idle) begin

            // updates the states of the registers
            // based on the values from the shift register
            {a, q, qm1} <= shift_reg;

            // finish next cycle 
            // if it is the last step
            if(count == 1) begin
                idle <= 1'b1;   // return to idle
                valid <= 1'b1;  // output product as valid

                // calculate the final product
                // product <= {a[N-1:0], q};
                // but becomes the form from below
                // due to the shift register confoguration
                // shift_reg[2*N: N+1] = a[N-1:0]
                // shift_reg[N:1] = q
                // shift_reg[0] = q - 1 (not used for final output)
                product <= {shift_reg[2*N: N+1], shift_reg[N:1]};
            end

            // decrement the counter
            // repeat this loop N times
            count <= count - 1;
        end
    end
end

endmodule

