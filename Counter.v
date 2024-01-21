
/*
 Module: Program_counter.v
 Owner:Omar Salah
 Description: Program counter verilog code  that takes 
 input:CLK,RST,ENABLE(EN),PC_in as intial value
 output:PC_out

*/

module program_counter 
#(parameter data_size = 32)
(

    output  reg    [data_size-1:0]  PC_out,
    input   wire                    CLK,RST,EN,
    input   wire   [data_size-1:0]  PC_in     
);

always @ ( posedge CLK or negedge RST)
begin
    if ( !RST )
        PC_out <= 32'd0;
    else if (! EN)
        PC_out <= PC_in;
end

endmodule
