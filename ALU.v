/*
- Owner : Omar Salah ELDIN
- Name  : ALU.v
- Description : ALU module paramitized that make (Add ,subtract,multiply,OR,AND) operations
*/
module  ALU # (parameter IN_DATA=32,
                         OUT_DATA=32)
(
input   wire    [IN_DATA-1:0]   SrcAE,
input   wire    [IN_DATA-1:0]   SrcBE,
input   wire    [2:0]           ALUControlE,
output  reg     [OUT_DATA-1:0]  ALUResult
);

always  @ (*)
begin
  case(ALUControlE)
    3'b000: ALUResult = SrcAE & SrcBE;
    3'b001: ALUResult = SrcAE | SrcBE;
    3'b010: ALUResult = SrcAE + SrcBE;
    3'b100: ALUResult = SrcAE - SrcBE;
    3'b101: ALUResult = SrcAE * SrcBE;
    3'b110:
      begin
        if(SrcAE<SrcBE)
           ALUResult = 'b1;
        else
           ALUResult  = 'b0;
        end
    default:ALUResult = SrcAE + SrcBE;
  endcase   
end
endmodule
   
