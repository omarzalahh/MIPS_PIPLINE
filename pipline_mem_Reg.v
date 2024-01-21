
module  mem_reg #(parameter   IN_DATA=32,
                              OUT_DATA=32 )
(

    output  reg    [OUT_DATA-1:0]   ALUOutM,WriteDataM,
    output  reg    [4:0]            WriteRegM,
    output  reg                     RegWriteM,MemtoRegM,MemWriteM,
    input   wire                    CLK,RST,
    input   wire   [IN_DATA-1:0]    ALUOutE,WriteDataE,
    input   wire   [4:0]            WriteRegE,
    input   wire                    RegWriteE,MemtoRegE,MemWriteE
);

always @ ( posedge CLK or negedge RST)
    begin
        if ( ! RST )
            begin
                ALUOutM <= 32'd0;
                WriteDataM <= 32'd0;
                WriteRegM <= 5'd0;
                RegWriteM <= 1'b0;
                MemtoRegM <= 1'b0;
                MemWriteM <= 1'b0;       
            end
        else
            begin
                ALUOutM <= ALUOutE;
                WriteDataM <= WriteDataE;
                WriteRegM <= WriteRegE;
                RegWriteM <= RegWriteE;
                MemtoRegM <= MemtoRegE;
                MemWriteM <= MemWriteE;
            end
    end
endmodule