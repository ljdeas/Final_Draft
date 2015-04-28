/////////////////////////////////////////////////////// 
//  Hardware Implementation of the Nueral Network   //
//                 Digital Aliance                   //
//    James Ginley, Kaila Balacio, Lillian Deas     //
/////////////////////////////////////////////////////

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
      bR[7] = bR[6];
      yR[7] = yR[6];
      aR[6] = aR[5];
      bR[6] = bR[5];
      yR[6] = yR[5];
      aR[5] = aR[4];
      bR[5] = bR[4];
      yR[5] = yR[4];
      aR[4] = aR[3];
      bR[4] = bR[3];
      yR[4] = yR[3];
      aR[3] = aR[2];
      bR[3] = bR[2];
      yR[3] = yR[2];
      aR[2] = aR[1];
      bR[2] = bR[1];
      yR[2] = yR[1];
      aR[1] = aR[0];
      bR[1] = bR[0];
      yR[1] = yR[0];

      aR[0] = a;
      bR[0] =b;
      yR[0] = 8x8_Mult_Piped(aR[0], bR[0]);

    end
