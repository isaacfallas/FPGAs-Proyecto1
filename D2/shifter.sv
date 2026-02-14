module shifter #(parameter int SHIFT= 0) 
                (input logic [15:0] product,
                 output logic [127:0] out);
  
  assign out= ({112'b0, product}) << (8* SHIFT);
  
endmodule