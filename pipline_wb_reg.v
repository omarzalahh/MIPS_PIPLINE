module  WB_REG  #(parameter INPUT_DATA  = 32,
                            OUTPUT_DATA = 32)
(
    output  reg    [OUTPUT_DATA-1:0] ALUOutW,ReadDataW,
    output  reg    [4:0]             WriteRegW,
    output  reg                      RegWriteW,MemtoRegW,
    input   wire                     CLK,RST,
    input   wire   [INPUT_DATA-1:0]  ALUOutM,ReadDataM,
    input   wire   [4:0]             WriteRegM,
    input   wire                     RegWriteM,MemtoRegM
);

always @ ( posedge CLK or negedge RST)
    begin
        if ( !RST )
            begin
                ALUOutW <= 32'd0;
                ReadDataW <= 32'd0;
                WriteRegW <= 5'd0;
                RegWriteW <= 1'b0;
                MemtoRegW <= 1'b0;          
            end
        else
            begin
                ALUOutW <= ALUOutM;
                ReadDataW <= ReadDataM;
                WriteRegW <= WriteRegM;
                RegWriteW <= RegWriteM;
                MemtoRegW <= MemtoRegM; 
            end
    end
endmodule
