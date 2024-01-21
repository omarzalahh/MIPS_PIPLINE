/*
- Owner : Omar Salah ELDIN
- Name  : SIGN_EXTEND.v
- Description : SIGN_EXTEND module paramitized that check last bit from input 
                ,if (last bit==0) extend the input to 32 bits with (16'b0)
                else  extend the input to 32 bits with (16'hFFFF)
*/
module  SIGN_EXTEND #(parameter INPUT_DATA=16,
                                OUTPUT_DATA=32)
(
input     wire    [INPUT_DATA-1:0]    Instr,
output    reg     [OUTPUT_DATA-1:0]   SignImm
);

always  @ (*)
begin
  if(Instr[INPUT_DATA-1])
    begin
      SignImm={{16{1'b1}},Instr};
    end
  else
    begin
      SignImm={{16{1'b0}},Instr};
    end  
  end
endmodule