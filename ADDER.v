/*
- Owner : Omar Salah ELDIN
- Name  : ADDER.v
- Description : ADDER module paramitized that add 2  inputs and get 1 output
                2 Inputs A,B
                1 Output  C
*/
module ADDER #(parameter  INPUT_DATA=32,
                          OUTPUT_DATA=32)
(
input     wire    [INPUT_DATA-1:0]      A         ,
input     wire    [INPUT_DATA-1:0]      B         ,
output    wire    [OUTPUT_DATA-1:0]     C     
);

assign  C = A+B;
endmodule