/*
Name:Main_Decoder.v
Owner:Omar Salah
Description: Decoder that takes Funct[5:0],ALUOP[1:0],and get Output ALUCONTROL[2:0] that control alu signal to make the operations
MAPPING:
.Funct(),
.Opcode(),
.MemtoReg(),
.MemWrite(),
.Branch(),
.ALUSrc(),
.RegDst(),
.RegWrite(),
.Jump(),
.ALUControl() 
*/
module  Control_Unit(
input   wire  [5:0] Funct,
input   wire  [5:0] Opcode,
output  wire        MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,
output  wire  [2:0] ALUControl 
);
wire  [1:0] ALUOp;

ALU_Decoder aludecoder (
.Funct(Funct),
.ALUOp(ALUOp),
.ALUControl(ALUControl) 
);
Main_Decoder  maindecoder(
.MemtoReg (MemtoReg),
    .MemWrite (MemWrite),
    .Branch (Branch),
    .ALUSrc (ALUSrc),
    .RegDst (RegDst),
    .RegWrite (RegWrite),
    .Jump (Jump),
    .ALUOp (ALUOp),
    .Opcode (Opcode)
);
endmodule