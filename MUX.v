
/*
Name:MUX.v
Owner:Omar Salah
Description: MUX that takes 
Input:in1,in2,sel
Output: out of mux
*/
module  mux #(parameter DATA=32)
(
input   wire  [DATA-1:0]  in1,in2,
input   wire              sel,
output  reg   [DATA-1:0]  out
);

always  @ (*)
begin
  if(sel)
    out=in2;
  else
    out=in1;
end
endmodule

                        