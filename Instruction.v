/*
Name:Instruction_Memory.v
Owner:Omar Salah
Description: Instruction_Memory that takes A(ADDRESS) and out Instruction the fetch
*/

module Instruction_memory
#(parameter WIDTH = 32, parameter DEPTH = 100)
(
    output  wire    [WIDTH-1:0]  RD,
    input   wire    [WIDTH-1:0]  A
);

reg   [WIDTH-1:0]   ROM   [DEPTH-1:0];

initial 
    begin
        $readmemh ("Test Program.txt", ROM);//read text file there is address in it
    end

assign RD = ROM[A>>2];//shift address by 2 left 

endmodule 
