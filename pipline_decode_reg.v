/*
Name:pipline_decode_fitch_Register
owner:Omar Salah
Description:It is used to stall the instructions by hazard control unit
input:CLK,RST,CLR(FROM HAZARD CONTROL),PCPLUS4F(from adder),RD(InstrF out put for fetch)
,EN (from control unit)
output:InstrD(output for the decode stage),PCPlus4D(out for the second adder)
--------For mapping------------
.CLK(),
.CLR(),
.RST(),
.PCPlus4F(),
.RD(),
.InstrD(),
.PCPlus4D()
*/
module  reg_decode  #(parameter INPUT_DATA  = 32  ,
                                OUTPUT_DATA = 32)  
(
  input   wire                     CLK,CLR,RST,EN,
  input   wire  [INPUT_DATA-1:0]   PCPlus4F,RD,//InstrF
  output  reg   [OUTPUT_DATA-1:0]  InstrD,PCPlus4D
);
always  @(posedge CLK or negedge RST)
begin 
  if(!RST)
     begin
        PCPlus4D <= 'd0;
        InstrD   <= 'd0;
     end
  else if ( CLR && !EN )
      begin
        PCPlus4D <= 'd0;
        InstrD   <= 'd0;
      end
  else if (!EN)
       begin
        PCPlus4D <= PCPlus4F;
        InstrD   <= RD;
       end    
end

endmodule
