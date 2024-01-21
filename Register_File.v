
module  Register_File # (parameter  WIDTH=32,
                                    DEPTH=100,
                                    REG_NUM=32 )
(
input   wire                           CLK,RST,WE,
input   wire    [$clog2(REG_NUM)-1:0]  readadr1,readadr2,writeaddr3,
input   wire    [WIDTH-1:0]            WD,
output  wire    [WIDTH-1:0]            RD1,RD2
);
reg [WIDTH-1:0] MEM [DEPTH-1:0];
integer i;

always @ (negedge CLK or negedge RST)
    begin
        if (!RST)
            begin 
                for (i=0; i<DEPTH; i=i+1)
                    begin
                        MEM [i] <= { (WIDTH) {1'b0} };
                    end
            end
        else if (WE) 
            begin
                MEM[writeaddr3] <= WD;
            end
    end 
assign RD1 = MEM[readadr1];
assign RD2 = MEM[readadr2];

endmodule