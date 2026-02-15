module mul64x64(input logic clk,
                input logic rst_n,
                input logic [63:0] a, 
                input logic [63:0] b,
                output logic [127:0] out);
  

  logic [15:0] p2 [0:7][0:7];
  logic [15:0] p2_reg [0:7][0:7];
  
  logic [127:0] p_shift2 [0:7][0:7];
  logic [127:0] sum64 [0:63];
  
  genvar i, j;
  generate
    for (i= 0; i < 8; i++) begin : gen_i
      for (j= 0; j < 8; j++) begin : gen_j
        mul8x8 u_mul8x8(.a(a[i*8 +: 8]),
                        .b(b[j*8 +: 8]),
                        .out(p2[i][j]));
        
        shifter #(.SHIFT(i+j)) u_shifter(.product(p2_reg[i][j]),
                                         .out(p_shift2[i][j]));
        
        assign sum64[i*8 + j]= p_shift2[i][j];
        
      end
    end
  endgenerate
  
  sum_tree u_sum_tree (.clk(clk),
                       .rst_n(rst_n),
                       .sum64(sum64),
                       .result(out));
                       
  always_ff @(posedge clk or negedge rst_n) begin 
    if (!rst_n) begin 
      for (int i= 0; i< 8; i++) begin 
        for (int j= 0; j< 8; j++) begin 
          p2_reg[i][j] <= '0; 
        end 
      end 
    end else begin 
      for (int i= 0; i< 8; i++) begin 
        for (int j= 0; j< 8; j++) begin 
          p2_reg[i][j] <= p2[i][j]; 
        end 
      end 
    end 
  end
  
endmodule
