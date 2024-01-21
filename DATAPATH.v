module  DATAPATH  #(parameter DATASIZE = 32)
(    
    output  wire    [4:0]              rs_e,rt_e,rs_d,rt_d,outmux2_A3,outmux3_A3,outmux4_A3,
    output  wire    [5:0]              opcode,funct,
    output  wire    [15:0]             testvalue,
    output  wire                       RegWrite2,RegWrite3,RegWrite4,MemtoReg2,MemtoReg3,
    input   wire                       clk,reset,StallF,StallD,FlushE,
    input   wire                       RegWrite,MemtoReg,MemWrite,ALUSrc,RegDst,Branch,Jump,
    input   wire    [2:0]              ALUcontrol,
    input   wire    [1:0]              ForwardAE,ForwardBE,
    input   wire                       ForwardAD,ForwardBD         
);
wire    [DATASIZE-1:0]     RD1,RD2,RD1_2,RD2_2,SrcA2,SrcB2,WriteData2,RD_inst2,RD_inst;
wire    [DATASIZE-1:0]     Pc,ALUout3,WriteData3;
wire    [DATASIZE-1:0]     outmux_WD3;
wire    [DATASIZE-1:0]     SignImm,shiftout_inst6,SignImm2,ALUout,ALUout4,RD_Data4;   
wire    [DATASIZE-1:0]     PCBranch,PCPlus4,PCPlus4_1;
wire    [DATASIZE-1:0]     currentpc,RD_instF,RD_Data,RD1_muxout,RD2_muxout;
wire                       MemWrite2,ALUSrc2,RegDst2,MemtoReg4;
wire                       MemWrite3,EqualD, CLR_D, B_E_and ;
wire    [27:0]             PCjump;
wire    [2:0]              ALUcontrol2;
wire    [1:0]              PCSrcD;

assign EqualD = ( RD1_muxout == RD2_muxout ) ? 1'b1:1'b0 ;
assign B_E_and = EqualD & Branch;
assign PCSrcD={ Jump , B_E_and };
assign CLR_D  = PCSrcD [0] | PCSrcD [1];
assign rs_e   = RD_inst2[25:21];//A1 REG FILE
assign rt_e   = RD_inst2[20:16];//A2 REG FILE
assign rs_d   = RD_inst[25:21]; 
assign rt_d   = RD_inst[20:16];
assign opcode = RD_inst[31:26];
assign funct  = RD_inst[5:0];


// Fetch stage 
program_counter program(
.PC_out(Pc),
.CLK(clk),
.RST(reset),
.EN(StallF),
.PC_in(currentpc)     
);
mux2  MUX2_INST1
(
.in1(PCPlus4),
.in2(PCBranch),
.in3({ PCPlus4_1[31:28] , RD_inst[25:0] , 2'b00 }),
.in4(32'd0),
.sel(PCSrcD),
.out(currentpc)
);
Instruction_memory  INST_MEMORY
(
.RD(RD_instF),
.A(Pc)
);
ADDER ADDER_INSTR1
(
.A(Pc),
.B(32'd4),
.C(PCPlus4)     
);


//Pipline fetch to decode register
reg_decode Fetch_Decode
(
  .CLK(clk),
  .CLR(CLR_D),
  .RST(reset),
  .EN(StallD),
  .PCPlus4F(PCPlus4),//input PCPlus4F
  .RD(RD_instF),//InstrF input RD 
  .InstrD(RD_inst),//out
  .PCPlus4D(PCPlus4_1)//out
);

//Decode stage
Register_File register_file
(
.CLK(clk),
.RST(reset),
.WE(RegWrite4),
.readadr1(RD_inst[25:21]),
.readadr2(RD_inst[20:16]),
.writeaddr3(outmux4_A3),
.WD(outmux_WD3),
.RD1(RD1),
.RD2(RD2)
);
mux MUX_inst1 (
.out (RD1_muxout),
.in1 (RD1),
.in2 (ALUout3),
.sel (ForwardAD)
);
mux  MUX_inst2 (
.out (RD2_muxout),
.in1 (RD2),
.in2 (ALUout3),
.sel (ForwardBD)
);
SIGN_EXTEND sign_extend
(
.Instr(RD_inst[15:0]),
.SignImm(SignImm)
);
SHIFT shiftleft_twice
(
.IN(SignImm),
.OUT(shiftout_inst6)    
);
ADDER Adder_inst2 (
.C(PCBranch),
.A(shiftout_inst6),
.B(PCPlus4_1)
);

//Pipline Decode to Excute stage register
reg_excute  Decode_Excute(
.RD1E(RD1_2),
.RD2E(RD2_2),
.SignImmE(SignImm2),
.RtE(RD_inst2[20:16]),
.RdE(RD_inst2[15:11]),
.RsE(RD_inst2[25:21]),
.RegWriteE(RegWrite2),
.MemtoRegE(MemtoReg2),
.MemWriteE(MemWrite2),
.ALUSrcE(ALUSrc2),
.RegDstE(RegDst2),
.ALUControlE(ALUcontrol2),
.CLK(clk),
.RST(reset),
.CLR(FlushE),
.RD1D(RD1),
.RD2D(RD2),
.SignImmD(SignImm),
.RtD(RD_inst[20:16]),
.RdD(RD_inst[15:11]),
.RsD(RD_inst[25:21]),
.RegWriteD(RegWrite),
.MemtoRegD(MemtoReg),
.MemWriteD(MemWrite),
.ALUSrcD(ALUSrc),
.RegDstD(RegDst),
.ALUControlD(ALUcontrol)
);

//Excute stage
mux #(.DATA(5)) MUX_inst3
(
.out (outmux2_A3),
.in1 (RD_inst2[20:16]),
.in2 (RD_inst2[15:11]),
.sel (RegDst2)
);
mux2  MUX2_INST2
(
.in1(RD1_2),
.in2(outmux_WD3),
.in3(ALUout3),
.in4(32'd0),
.sel(ForwardAE),
.out(SrcA2)
);

mux2  MUX2_INST3
(
.in1(RD2_2),
.in2(outmux_WD3),
.in3(ALUout3),
.in4(32'd0),
.sel(ForwardBE),
.out(WriteData2)
);
mux MUX_inst4
(
.out (SrcB2),
.in1 (WriteData2),
.in2 (SignImm2),
.sel (ALUSrc2)
);
ALU ALU (
.SrcAE(SrcA2),
.SrcBE(SrcB2),
.ALUControlE(ALUcontrol2),
.ALUResult(ALUout)
);
//pipline excute to memory stage
mem_reg Pipeline_register3 (

    .ALUOutM (ALUout3),
    .WriteDataM (WriteData3),
    .WriteRegM (outmux3_A3),
    .RegWriteM (RegWrite3),
    .MemtoRegM (MemtoReg3),
    .MemWriteM (MemWrite3),
    .CLK (clk),
    .RST (reset),
    .ALUOutE (ALUout),
    .WriteDataE (WriteData2),
    .WriteRegE (outmux2_A3),
    .RegWriteE (RegWrite2),
    .MemtoRegE (MemtoReg2),
    .MemWriteE (MemWrite2)
);
// Memory Stage
 Data_memory data_mem (

    .RD (RD_Data),
    .test_value (testvalue),
    .CLK (clk),
    .RST (reset),
    .WE (MemWrite3),
    .WD (WriteData3),
    .A (ALUout3)
);
//Write back pipiline register 
WB_REG Pipeline_register4 (

    .ALUOutW (ALUout4),
    .ReadDataW (RD_Data4),
    .WriteRegW (outmux4_A3),
    .RegWriteW (RegWrite4),
    .MemtoRegW (MemtoReg4),
    .CLK (clk),
    .RST (reset),
    .ALUOutM (ALUout3),
    .ReadDataM (RD_Data),
    .WriteRegM (outmux3_A3),
    .RegWriteM (RegWrite3),
    .MemtoRegM (MemtoReg3)
);

// Writeback stage 

mux MUX_inst5 (

    .out (outmux_WD3),
    .in1 (ALUout4),
    .in2 (RD_Data4),
    .sel (MemtoReg4)
);
endmodule


