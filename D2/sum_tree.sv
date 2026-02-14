module sum_tree (input logic clk,
                 input logic rst_n,
                 input logic [127:0] sum64 [0:63],
                 output logic [127:0] result);
  
  logic [127:0] sum32 [0:31];
  logic [127:0] sum16 [0:15];
  logic [127:0] sum8 [0:7];
  logic [127:0] sum4 [0:3];
  logic [127:0] sum2 [0:1];
  logic [127:0] sum1;
  
  assign result= sum1;
  
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int n= 0; n< 32; n++)
        sum32[n]<= '0;
    end else begin
      for (int n= 0; n< 32; n++)
        sum32[n]<= sum64[n*2] + sum64[n*2+1];
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int n= 0; n< 16; n++)
        sum16[n]<= '0;
    end else begin
      for (int n= 0; n< 16; n++)
        sum16[n]<= sum32[n*2] + sum32[n*2+1];
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int n= 0; n< 8; n++)
        sum8[n]<= '0;
    end else begin
      for (int n= 0; n< 8; n++)
        sum8[n]<= sum16[n*2] + sum16[n*2+1];
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int n= 0; n< 4; n++)
        sum4[n]<= '0;
    end else begin
      for (int n= 0; n< 4; n++)
        sum4[n]<= sum8[n*2] + sum8[n*2+1];
    end
  end
  
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int n= 0; n< 2; n++)
        sum2[n]<= '0;
    end else begin
      for (int n= 0; n< 2; n++)
        sum2[n]<= sum4[n*2] + sum4[n*2+1];
    end
  end
  
    always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sum1<= '0;
    end else begin
      sum1<= sum2[0] + sum2[1];
    end
  end
  
endmodule