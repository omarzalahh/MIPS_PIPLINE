
/*
Name:MUX2.v
Owner:Omar Salah
Description: MUX2 that takes 
Input:in1,in2,in3,in4,sel
Output: out of mux
*/
module  mux2 #(parameter IN_DATA=32,
                        OUT_DATA=32)
(
input   wire  [IN_DATA-1:0]  in1,in2,in3,in4,
input   wire  [1:0]          sel,
output  reg   [OUT_DATA-1:0] out
);

always  @ (*)
begin
  case(sel)
    2'b00:  out = in1;
    2'b01:  out = in2;
    2'b10:  out = in3;
    2'b11:  out = in4;
  endcase
end
endmodule

                        

