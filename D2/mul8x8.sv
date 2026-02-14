module mul8x8(input logic [7:0] a, 
              input logic [7:0] b,
              output logic [15:0] out);
  
  assign out= a * b;
  
endmodule