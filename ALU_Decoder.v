/*
Name:ALU_Decoder.v
Owner:Omar Salah
Description: Decoder that takes Funct[5:0],ALUOP[1:0],and get Output ALUCONTROL[2:0] that control alu signal to make the operations
*/
module  ALU_Decoder(
input   wire  [5:0] Funct,
input   wire  [1:0] ALUOp,
output  reg   [2:0] ALUControl 
);
always  @ (*)
begin
  case(ALUOp)
    //AND
    2'b00 : ALUControl = 3'b010;
    //SUB
    2'b01 : ALUControl = 3'b100;

    2'b10 : 
            begin
                case(Funct)
                // add
                6'b100000 : ALUControl = 3'b010;
                // sub
                6'b100010 : ALUControl = 3'b100;
                // slt
                6'b101010 : ALUControl = 3'b110;
                // mul
                6'b011100 : ALUControl = 3'b101;
                endcase
            end
              //ADD
    default : ALUControl = 3'b010;

    endcase
end

endmodule 
