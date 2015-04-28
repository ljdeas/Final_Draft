/////////////////////////////////////////////////////// 
//  Hardware Implementation of the Nueral Network   //
//                Digital Aliance                   //
//    James Ginley, Kaila Balacio, Lillian Deas     //
//////////////////////////////////////////////////////

module 2to1Mux ( in_0, in_1, out);
  input [3:0] in_0;
  input       in_1;
  output [3:0] out;
  
  assign out = in_1 ? in_0;
  
endmodule
  
module 8x8_Mult_Piped (a, b, clk, reset, y);
  input clk, reset;
  input[0:7] a, b;
  output[15:0] y

  reg[7:0] aR[8:0];
  reg[7:0] bR[8:0];
  reg[15:0] yR[8:0];
  
  always @ (posedge clk)
    begin
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
      aR[7] = aR[6];
