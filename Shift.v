/*
- Owner : Omar Salah ELDIN
- Name  : Shift.v
- Description : Shift module paramitized that shift the input by 2 bits left
*/
module  SHIFT #(parameter INPUT_DATA  =32,    
                          OUTPUT_DATA =32)
(
input     wire      [INPUT_DATA-1:0]    IN      ,
output    wire      [OUTPUT_DATA-1:0]   OUT     
);

assign  OUT=IN<<2'b10;
endmodule