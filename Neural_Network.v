/////////////////////////////////////////////////////// 
//  Hardware Implementation of the Nueral Network   //
//                 Digital Aliance                   //
//    James Ginley, Kaila Balacio, Lillian Deas     //
/////////////////////////////////////////////////////


// 2 to 1 Mux for First Stage
module 2to1Mux ( in_0, in_1, out);
  input [3:0] in_0;
  input       in_1;
  output [3:0] out;
  
  assign out = in_1 ? in_0;
  
endmodule

// Pipelined Multiplier for Second and Third Stages
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
    
    function [15:0] 8x8_Mult_Piped;
    input [7:0] a,b;
    reg [7:0] a_mag, b_mag;
    reg [14:0] y_mag;
    reg [14:0] y_neg;
    begin
      
      case (a[7])
        0: a_mag = a[6:0];
        1: a_mag = 128 - a[6:0];
      endcase
      
      case(b[7])
        0: b_mag = b[6:0];
        1: b_mag = 128 - b[6:0];
      endcase 
      
      y_mag = a_mag * b_mag;
      
      if ((a[7]^b[7]) & (y_mag != 0))
      begin
        y_neg = 32768 - y_mag[13:0]
        8x8_Mult_Piped = {1'b1, y_neg};
      end
      else 
        8x8_Mult_Piped = y_mag;
      end
      
      endfunction 
      
      assign y = yR[7];
      
      endmodule
