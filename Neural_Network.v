/////////////////////////////////////////////////////// 
//  Hardware Implementation of the Nueral Network   //
//                Digital Aliance                   //
//    James Ginley, Kaila Balacio, Lillian Deas    //
/////////////////////////////////////////////////////

module 2to1Mux ( in_0, in_1, out);
  input [3:0] in_0;
  input       in_1;
  output [3:0] out;
  
  assign out = in_1 ? in_0;
  
endmodule
  
  
