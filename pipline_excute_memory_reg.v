
/*
Name:pipline_decode_excute_Register
owner:Omar Salah
Description:It is used to stall the instructions by hazard control unit
input:CLK,RST,CLR(FROM HAZARD CONTROL),PCPLUS4F(from adder),RD(InstrF out put for fetch)
,EN (from control unit)
output:InstrD(output for the decode stage),PCPlus4D(out for the second adder)
--------For mapping------------
.RD1E(),
.RD2E(),
.SignImmE(),
.RtE(),
.RdE(),
.RsE(),
.RegWriteE(),
.MemtoRegE(),
.MemWriteE(),
.ALUSrcE(),
.RegDstE(),
.ALUControlE(),
.CLK(),
.RST(),
.CLR(),
.RD1D(),
.RD2D(),
.SignImmD(),
.RtD(),
.RdD(),
.RsD(),
.RegWriteD(),
.MemtoRegD(),
.MemWriteD(),
.ALUSrcD(),
.RegDstD(),
.ALUControlD()

*/
module  reg_excute  #(parameter INPUT_DATA  = 32  ,
                                OUTPUT_DATA = 32)  
(
output  reg    [OUTPUT_DATA-1:0]  RD1E,RD2E,SignImmE,
output  reg    [4:0]              RtE,RdE,RsE,
output  reg                       RegWriteE,MemtoRegE,MemWriteE,ALUSrcE,RegDstE,
output  reg    [2:0]              ALUControlE,
input   wire                      CLK,RST,CLR,
input   wire   [INPUT_DATA-1:0]   RD1D,RD2D,SignImmD,
input   wire   [4:0]              RtD, RdD, RsD,
input   wire                      RegWriteD,MemtoRegD,MemWriteD,ALUSrcD,RegDstD,
input   wire   [2:0]              ALUControlD    
);

always @ ( posedge CLK or negedge RST)
    begin
        if ( ! RST )
            begin
                RD1E <= 32'd0;
                RD2E <= 32'd0;
                RsE <= 32'd0;
                RtE <= 5'd0;
                RdE <= 5'd0;
                SignImmE <= 32'd0;
                RegWriteE <= 1'b0;
                MemtoRegE <= 1'b0;
                MemWriteE <= 1'b0;
                ALUSrcE <= 1'b0;
                RegDstE <= 1'b0;
                ALUControlE <= 3'd0;            
            end
        else if ( CLR )
            begin
                RD1E <= 32'd0;
                RD2E <= 32'd0;
                RsE <= 32'd0;
                RtE <= 5'd0;
                RdE <= 5'd0;
                SignImmE <= 32'd0;
                RegWriteE <= 1'b0;
                MemtoRegE <= 1'b0;
                MemWriteE <= 1'b0;
                ALUSrcE <= 1'b0;
                RegDstE <= 1'b0;
                ALUControlE <= 3'd0;                
            end
        else
            begin
                RD1E <= RD1D;
                RD2E <= RD2D;
                RsE <= RsD;
                RtE <= RtD;
                RdE <= RdD;
                SignImmE <= SignImmD;
                RegWriteE <= RegWriteD;
                MemtoRegE <= MemtoRegD;
                MemWriteE <= MemWriteD;
                ALUSrcE <= ALUSrcD;
                RegDstE <= RegDstD;
                ALUControlE <= ALUControlD;
            end
    end
endmodule