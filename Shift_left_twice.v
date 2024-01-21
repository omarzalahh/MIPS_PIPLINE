module  Shift_LEFT  #(parameter INPUT_DATA  = 32,
                                OUTPUT_DATA = 32  )
(
input   wire  [INPUT_DATA-1:0]  in,
output  reg   [OUTPUT_DATA-1:0] out  
);

always @(*)

    begin
        out = in << 2;
    end

endmodule
