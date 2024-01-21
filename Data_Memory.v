/*
Name:Data_Memory.v
Owner:Omar Salah
Description: Data_Memory that takes 
Input:CLk,WE,(to allow write data when it is equal1),A(ADDRESS from ALU),
WD(data should be write in memory),rest 
Output: RD that get out the data and test value 
*/
module Data_memory
#(parameter WIDTH = 32, 
            DEPTH = 100)
(
    output  reg    [WIDTH-1:0]       RD,
    output  reg    [(WIDTH/2)-1:0]   test_value,
    input   wire                     CLK,RST,WE, 
    input   wire   [WIDTH-1:0]       WD,A
);

reg   [WIDTH-1:0]   RAM  [DEPTH-1:0];
integer i;

always @( posedge CLK or negedge RST)

    begin
        if ( ! RST )
            begin
                for( i=0 ; i<DEPTH ; i=i+1)  
                    RAM[i] <= { (WIDTH) {1'b0} };
            end
        else if ( WE )
            begin
                RAM [A] <= WD;
            end
    end

always @(*)
    begin
        RD = RAM [A];
        test_value = RAM [{ (WIDTH) {1'b0} }];
    end
endmodule 