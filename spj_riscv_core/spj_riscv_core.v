// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
//----------------------------------------------------------------------------
// spjRISC521pipe_v    Harvard    Seperate Mapped I/Os
// (c) Dorin Patru 2022; Updated by Stefan Maczynski 2023
// Modified for design specification by Sean Jacobs
//----------------------------------------------------------------------------
`define SIMULATION // REMOVE FOR FPGA EMULATION!
// `define DISABLE_PIPELINE // Use for debuging issues with data-forwarding!
`define CACHE // Use for Debugging issues with Cache Memory
module spj_riscv_core (
input             Resetn_pin    , // Reset, implemented with push-button on FPGA
input             Clock_pin     , // Clock, implemented with Oscillator on FPGA
input      [ 4:0] SW_pin        , // Four switches and remaining push-button
output reg [ 7:0] Display_pin     // 8 LEDs
);

//----------------------------------------------------------------------------
//-- Declare machine cycle and instruction cycle parameters
//----------------------------------------------------------------------------

//Jump conditions
localparam [3:0]  JU  = 4'b0000 ; // Jump Unconditional

//----------------------------------------------------------------------------
//-- Declare internal signals
//----------------------------------------------------------------------------
reg  [31:0]    R       [31:0] ; // Register File (RF) 32 32-bit registers
reg  [31:0]    FP      [31:0] ; // FP Register File
reg            WR_DM          ; // Write-enable data-memory input
reg            stall_mc0      ; // Stall Control Bits
reg            stall_mc1      ; // Stall Control Bits
reg            stall_mc2      ; // Stall Control Bits
reg            stall_mc3      ; // Stall Control Bits
reg  [31:0]    PC             ; // Program Counter
reg  [31:0]    SP             ; // Stack Pointer
reg  [63:0]    ACCUM          ; // Accumulator Register
reg  [31:0]    IR3            ; // Instruction Register 3
reg  [31:0]    IR2            ; // Instruction Register 2
reg  [31:0]    IR1            ; // Instruction Register 1
reg  [31:0]    MAB            ; // Memory Address B
reg  [31:0]    MAX            ; // Memory Address X
reg  [31:0]    MAeff          ; // Memory Address Effective
reg  [31:0]    DM_in          ; // Data-Memory Input
reg  [31:0]    TA             ; // Temporary Input of Arithmetic-Logic-Unit "A"
reg  [31:0]    TB             ; // Temporary Input of Arithmetic-Logic-Unit "B"
reg  [31:0]    TALUH          ; // Temporary Output of Arithmetic-Logic-Unit "High"
reg  [31:0]    TALUL          ; // Temporary Output of Arithmetic-Logic-Unit "Low"
wire           Clock_not      ; // Inverted Clock
wire [31:0]    PM_out         ; // Output of Program-Memory
wire [31:0]    DM_out         ; // Output of Data-Memory
wire           DM_Done        ; // Control Signal for Data Memory Cache
wire           PM_Done        ; // Control Signal for Program Memory Cache
integer        k              ; // Index for looping construct

// Floating Point Signals
reg [31:0] fp_x;
reg [31:0] fp_y;
reg start_fp_add;
wire [31:0] fp_sum;
wire fp_add_valid;

// RV32I Base Integer Instructions
wire [6:0] opcode;
wire [6:0] opcode_2;
wire [6:0] opcode_3;

wire [4:0] rd_2;
wire [4:0] rd_3;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rs1_3;
wire [4:0] rs2_3;

wire [2:0] funct3;
wire [2:0] funct3_2;
wire [2:0] funct3_3;

wire [6:0] funct7;
wire [6:0] funct7_2;
wire [6:0] funct7_3;

// R-TYPE INSTRUCTION WORD FORMAT BREAKDOWN
assign opcode = IR1[6:0];
assign opcode_2 = IR2[6:0];
assign opcode_3 = IR3[6:0];

assign rd_2 = IR2[11:7]; // Destination Register of the previous instruction *used for DF*
assign rd_3 = IR3[11:7]; // Destination Register for write back

assign rs1 = IR1[19:15];
assign rs2 = IR1[24:20];
assign rs1_3 = IR3[19:15]; 
assign rs2_3 = IR3[24:20]; // Register to store back into memory

assign funct3 = IR1[14:12];
assign funct3_2 = IR2[14:12];
assign funct3_3 = IR3[14:12];

assign funct7 = IR1[31:25];
assign funct7_2 = IR2[31:25];
assign funct7_3 = IR3[31:25];

// assign TA = (rs1_df) ? TALUH : R[rs1]; // need to add data forwarding registers 

not clock_inverter ( Clock_not, Clock_pin ); // Using a language primative so timing analyzer can recognize the derived clock

// - Both memories are clock synchronous i.e., the address and input data are evaluated on a positive clock edge 
// - Note that we are using inverted clocks
`ifndef CACHE
    // Monolithic Program Memory
    spjRISC521_rom1 my_rom(
        .address    ( PC         [9:0] ), // input
        .clock      ( Clock_not         ), // input
        .q          ( PM_out     [31:0] )  // output // {OpCode, Ri, Rj} = PM_out
    );
    // Monolithic Data Memory
    spjRISC521_init_ram my_ram (
        .address    ( MAeff      [9:0] ), // input
        .clock      ( Clock_not         ), // input
        .data       ( DM_in      [31:0] ), // input
        .wren       ( WR_DM             ), // input
        .q          ( DM_out     [31:0] )  // output
    );
    assign PM_Done = 1'b1 ;
    assign DM_Done = 1'b1 ;
`else
    // 2 caches one for DM and on for PM (set wr signal to 0)
    // Program Memory Cache
    spj_cache_4w_v2 pm_cache (
        .Resetn      ( Resetn_pin            ), // input
        .MEM_address ( PC             [31:0] ), // input   // Address coming from the CPU
        .MEM_in      ( 32'b0                 ), // input   // Write-Back data from the CPU // Would this also be PC?
        .WR          ( 1'b0                  ), // input   // Write-Enable from the CPU // Disabled to prevent writeback to Program Memory
        .Clock       ( Clock_not             ), // input
        .MEM_out     ( PM_out         [31:0] ), // output  // Data Stored at the Address pointed to by MEM_address
        .Done        ( PM_Done               )  // output  // Data out is valid // Not sure what needs to be done here for integration
    );
    defparam pm_cache.main_mem.altsyncram_component.init_file = "spjRISC521_rom1.mif"; // Override mif selection -> Take note of this for your future labs! // Overwrite this file
    // Data Memory Cache
    spj_cache_4w_v2 dm_cache (
        .Resetn      ( Resetn_pin       ), // input
        .MEM_address ( MAeff     [31:0] ), // input   // Address coming from the CPU
        .MEM_in      ( DM_in     [31:0] ), // input   // Write-Back data from the CPU
        .WR          ( WR_DM            ), // input   // Write-Enable from the CPU
        .Clock       ( Clock_not        ), // input
        .MEM_out     ( DM_out    [31:0] ), // output  // Data Stored at the Address pointed to by MEM_address
        .Done        ( DM_Done          )  // output  // Data out is valid // Not sure what needs to be done here for integration
    );
    defparam dm_cache.main_mem.altsyncram_component.init_file = "spj_dm_rom.mif"; // Override mif selection -> Take note of this for your future labs! // Overwrite this file
`endif

// Floating Point Module 
Float_Add spj_fp_add(
    .clk (Clock_not),
    .rst (Resetn_pin),
    .start (start_fp_add),
    .X (fp_x),
    .Y (fp_y),
    .sum (fp_sum),
    .valid (fp_add_valid)
);

// will remove once i add floating point lw and sw
initial begin
    FP[0] = 32'h40700000; // 6.75
    FP[1] = 32'hc0d80000; // -3.75
end

always@(posedge Clock_pin) begin : my_CPU
//----------------------------------------------------------------------------
// RESET 
//----------------------------------------------------------------------------
if (Resetn_pin == 0) begin    
    // - The reset is active low and clock synchronous.
    // - Initialize registers.
    PC = 32'h00000000; // Initialize the PC to point to the location of the FIRST instruction to be executed; location 0000 is arbitrary!
    SP = 32'h03ffffff; // Initialize the SP replace with register in RF (x3)
    ACCUM = 64'd0;     // Initialize the accumulator to 0 will replace a general purpose register (x31?)
    for (k = 0; k < 32; k = k+1) begin R[k] = 0; end
    for (k = 2; k < 32; k = k+1) begin FP[k] = 0; end
    MAB         = 32'd0;
    MAX         = 32'd0;
    MAeff       = 32'd0;
    DM_in       = 32'd0;
    TA          = 32'd0;
    TB          = 32'd0;
    TALUH       = 32'd0;
    TALUL       = 32'd0;
    Display_pin =  8'd0;
    IR1         = 32'hffffffff; // All IRs are initialized to the "don't care OpCode value 0xffff
    IR2         = 32'hffffffff;
    IR3         = 32'hffffffff;
    stall_mc0   =  1'b0; // The initialization of the stall_mc signals is necessary for the correct startup of the pipeline.
    stall_mc1   =  1'b1;
    stall_mc2   =  1'b1;
    stall_mc3   =  1'b1;
    WR_DM       =  1'b0;
    start_fp_add = 1'b0; // turn off FP add start signal
    fp_x = 32'd0;
    fp_y = 32'd0;
end // if (Resetn_pin == 0)
else if (fp_add_valid) begin
    FP[rd_2] = fp_sum;
    start_fp_add = 0; // Remove the stall from FP operation
end
else if (PM_Done && DM_Done && (!start_fp_add)) begin // Normal Operation
// else begin
//----------------------------------------------------------------------------
// MACHINE CYCLE 3
//----------------------------------------------------------------------------
    // MC3 is executed first because its assignments might be needed by the instructions executing MC2 or MC1 to resolve data or control D/H.
    // An instruction that has arrived in MC3 does not have any dependency.
    if ((!stall_mc3) && (IR3 != 32'hFFFFFFFF)) begin 
        case (opcode_3)
            7'b0110011: begin // R-Type Instructions
                case (funct3_3)
                    3'b000, 3'b001, 3'b100, 3'b110, 3'b111, 3'b101: begin // add & mul, sub, sll, xor & div, or, and, srl, sra
                        if (funct7_3 == 7'b0000011) begin
                            ACCUM = ACCUM + TALUH;
                        end
                        R[rd_3] = TALUH;
                    end
                endcase
            end
            7'b0000011: begin // I-Type Load Instructions
                case (funct3_3)
                    // 000: // lb opcode *NOT USING*
                    // 001: // lh opcode *NOT USING*
                    3'b010: begin // lw
                        R[rd_3] = DM_out;
                    end
                    // 100: // lbu opcode *NOT USING*
                    // 101: // lhu opcode *NOT USING*
                endcase
            end
            7'b0010011: begin // I-Type - Arithmetic Instructions
                case (funct3_3) 
                    3'b000, 3'b100, 3'b110, 3'b111, 3'b010, 3'b011, 3'b001, 3'b101: begin // addi, xori, ori, andi, slt, sltiu, slli, srli, srai
                        R[rd_3] = TALUH;
                    end
                endcase
            end
            7'b0100011: begin // S-Type Instructions
                case (funct3_3)
                    // 000: // sb *NOT USING*
                    // 001: // sh *NOT USING*
                    3'b010: begin // sw
                        DM_in = R[rs2_3];
                        WR_DM = 1'b1;
                    end
                endcase
            end
            7'b1100011: begin // SB-Type Instructions ***LATER***
                case (funct3_3)
                    3'b000: begin // beq
                        if (R[rs1_3] == R[rs2_3]) begin PC = MAeff; end
                        else begin PC = PC; end
                    end
                    3'b001: begin // bne
                        if (R[rs1_3] != R[rs2_3]) begin PC = MAeff; end
                        else begin PC = PC; end
                    end
                    3'b100: begin // blt
                        if (R[rs1_3] < R[rs2_3]) begin PC = MAeff; end
                        else begin PC = PC; end
                    end
                    3'b101: begin // bge *note this is greater than or equals*
                        if (R[rs1_3] >= R[rs2_3]) begin PC = MAeff; end
                        else begin PC = PC; end
                    end
                    // 110: // bltu *NOT USING*
                    // 111: // bgeu *NOT USING*
                endcase
            end
            7'b1010011: begin // Floating Point Instruction
                //nop
            end
        endcase
    end 

//----------------------------------------------------------------------------
// MACHINE CYCLE 2
//----------------------------------------------------------------------------
    if ((!stall_mc2) && (IR2 != 32'hFFFFFFFF)) begin
           case (opcode_2)
            7'b0110011: begin // R-Type Instructions
                case (funct3_2)
                    3'b000: begin
                        case (funct7_2)
                            7'b0000000: begin // add
                                TALUH = TA + TB;
                            end
                            7'b0100000: begin // sub
                                TALUH = TA - TB;
                            end
                            7'b0000001, 7'b0000011: begin // mul, mac
                                TALUH = TA * TB;
                            end
                        endcase
                    end
                    3'b001: begin // sll
                        TALUH = TA << TB;
                    end
                    3'b100: begin // xor
                        if (funct7_2 == 7'b0000001) begin
                            TALUH = TA / TB;
                        end
                        else begin
                            TALUH = TA ^ TB;
                        end
                    end
                    3'b110: begin // or
                        TALUH = TA | TB;
                    end
                    3'b111: begin // and
                        TALUH = TA & TB;
                    end
                    // 010: // slt *NOT USING*
                    // 011: // sltu *NOT USING*
                    3'b101: begin // srl & sra
                        case (funct7_2)
                            7'b0000000: begin // srl
                                TALUH = TA >> TB;
                            end
                            7'b0100000: begin // sra
                                {TALUL, TALUH} = {{32{TA[31]}},TA} >> TB;
                            end
                        endcase
                    end
                endcase
            end
            7'b0000011: begin // I-Type - Load Instructions
                case (funct3_2)
                    // 000: // lb opcode *NOT USING*
                    // 001: // lh opcode *NOT USING*
                    3'b010: begin // lw
                        MAeff = MAB + MAX;
                        WR_DM = 1'b0;
                    end
                    // 100: // lbu opcode *NOT USING*
                    // 101: // lhu opcode *NOT USING*
                endcase
            end
            7'b0010011: begin // I-Type - Arithmetic Instructions
                case (funct3_2) 
                    3'b000: begin // addi
                        TALUH = TA + TB;
                    end
                    3'b100: begin // xori
                        TALUH = TA ^ TB;
                    end
                    3'b110: begin // ori
                        TALUH = TA | TB;
                    end
                    3'b111: begin // andi
                        TALUH = TA & TB;
                    end 
                    // 010: // slt *NOT USING*
                    // 011: // sltiu *NOT USING*
                    3'b001: begin // slli
                        TALUH = TA << TB;
                    end 
                    3'b101: begin
                        case (funct7_2) // higher-order immediate bits
                            7'b0000000: begin // srli
                                TALUH = TA >> TB;
                            end
                            7'b0100000: begin // srai
                                {TALUL, TALUH} = {{14{TA[13]}},TA} >> TB;
                            end
                        endcase
                    end
                endcase
            end
            7'b0100011: begin // S-Type Instructions
                case (funct3_2)
                    // 000: // sb *NOT USING*
                    // 001: // sh *NOT USING*
                    3'b010: begin // sw
                        MAeff = MAB + MAX;
                    end
                endcase
            end
            7'b1100011: begin // SB-Type Instructions ***LATER***
                case (funct3_2)
                    3'b000, 3'b001, 3'b100, 3'b101: begin // beq, bne, blt, bge
                        MAeff = MAX;
                        WR_DM = 1'b0;
                    end
                    // 110: // bltu *NOT USING*
                    // 111: // bgeu *NOT USING*
                endcase
            end
            7'b1010011: begin // Floating Point Instruction
                // nop
            end
        endcase
    end 

//----------------------------------------------------------------------------
// MACHINE CYCLE 1
//----------------------------------------------------------------------------
    if ((!stall_mc1) && (IR1 != 32'hffffffff)) begin // MC1, or Operand Fetch for manip inst, or Address_Fetch for transfer and flow control inst
        case (opcode)
            7'b0110011: begin // R-Type Instructions
                case (funct3)
                    3'b000: begin
                        case (funct7)
                            7'b0000000, 7'b0100000, 7'b0000001, 7'b0000011: begin // add, sub, mul, mac
                                if (rs1 != rd_2) begin TA = R[rs1]; end else begin TA = TALUH; end // Data forwarding 
                                if (rs2 != rd_2) begin TB = R[rs2]; end else begin TB = TALUH; end
                            end
                        endcase
                    end
                    3'b001, 3'b100, 3'b110, 3'b111: begin // sll, xor (contains div), or, and
                        if (rs1 != rd_2) begin TA = R[rs1]; end else begin TA = TALUH; end
                        if (rs2 != rd_2) begin TB = R[rs2]; end else begin TB = TALUH; end
                    end
                    // 010: // slt *NOT USING*
                    // 011: // sltu *NOT USING*
                    3'b101: begin // srl & sra
                        case (funct7)
                            7'b0000000, 7'b0100000: begin // srl
                                if (rs1 != rd_2) begin TA = R[rs1]; end else begin TA = TALUH; end
                                if (rs2 != rd_2) begin TB = R[rs2]; end else begin TB = TALUH; end
                            end
                        endcase
                    end
                endcase
            end
            7'b0000011: begin // I-Type - Load Instructions
                case (funct3)
                    // 000: // lb opcode *NOT USING*
                    // 001: // lh opcode *NOT USING*
                    3'b010: begin // lw 
                        if (rs1 != rd_2) begin MAB = R[rs1]; end else begin MAB = TALUH; end // base address in rs1
                        MAX <= {20'd0, IR1[31:20]}; // immediate value offset
                    end
                    // 100: // lbu opcode *NOT USING*
                    // 101: // lhu opcode *NOT USING*
                endcase
            end
            7'b0010011: begin // I-Type - Arithmetic Instructions
                case (funct3) 
                    3'b000, 3'b100, 3'b110, 3'b111: begin // addi, xori, ori, andi
                        if (rs1 != rd_2) begin TA = R[rs1]; end else begin TA = TALUH; end
                        TB = {20'd0, IR1[31:20]};
                    end 
                    // 010: // slt NOT USING
                    // 011: // sltiu NOT USING
                    3'b001, 3'b101: begin // slli & srli & srai
                        if (rs1 != rd_2) begin TA = R[rs1]; end else begin TA = TALUH; end
                        TB = IR1[24:20]; // shift amount for 0->31 bits
                    end
                endcase
            end
            7'b0100011: begin // S-Type Instructions
                case (funct3)
                    // 000: // sb *NOT USING*
                    // 001: // sh *NOT USING*
                    3'b010: begin // sw
                        if(rs1 != rs2) begin MAB = R[rs1]; end else begin MAB = TALUH; end // base memory address
                        MAX = {20'd0, IR1[31:25], IR1[11:7]}; // memory address offset
                    end
                endcase
            end
            7'b1100011: begin // SB-Type Instructions NEED TO SWAP TO BYTE ADDRESSING
                case (funct3)
                    3'b000, 3'b001, 3'b100, 3'b101: begin // beq, bne, blt, bge
                        // MAB = PM_out;
                        MAX = {IR1[31],IR1[7],IR1[30:25],IR1[11:8]}; // immediate value in dumb format
                    end
                    // 110: // bltu *NOT USING*
                    // 111: // bgeu *NOT USING*
                endcase
            end
            7'b1010011: begin // Floating Point Instruction
                fp_x = FP[rs1];
                fp_y = FP[rs2];
                start_fp_add = 1'b1;
            end
        endcase
    end // stall_mc1

//----------------------------------------------------------------------------
// MACHINE CYCLE 0 and Stall Control
//----------------------------------------------------------------------------
    // The only data D/H that can occur are RAW.  These are automatically resolved.  
    // In the case of the JUMPS we stall until the adress of the next instruction to be executed is known.
    // The IR value 0xffff I call a "don't care" OpCode value.  
    // It allows us to control the refill of the pipe after the stalls of a jump emptied it.
    // Instruction in MC2 can move to MC3; 
    // Below: Rj3 = Ri3 because the previous instruction returns a result in Ri2; 
    //        need to modify for a previous SWAP
    if ((!stall_mc2) && (IR3[6:0] != 7'b1100011)) begin 
        IR3 = IR2;
        // Ri3 = Ri2;
        // Rj3 = Rj2;
        stall_mc3 = 0;
    end 
    // Instruction in MC2 is stalled and IR3 is loaded with the "don't care IW"    
    else begin 
        stall_mc2 = 1; 
        IR3 = 14'h3fff; 
    end 
    // Instruction in MC1 can move to MC2; Rj2 may need to be = Ri1 for certain instruction sequences
    if ((!stall_mc1) && (IR2[6:0] != 7'b1100011)) begin 
        IR2 = IR1;
        // Ri2 = Ri1;
        // Rj2 = Rj1;
        stall_mc2 = 0;
    end
    // Instruction in MC1 is stalled and IR2 is loaded with the "don't care IW"    
    else begin
        stall_mc1 = 1;
        IR2 = 14'h3fff;
    end 
    // Instruction in MC0 can move to MC1;     
    if ((!stall_mc0) && (IR1[6:0] != 7'b1100011)) begin
        // Below: IW0 is fetched directly into IR1, Ri1, and Rj1
        IR1 = PM_out; 
        // Ri1 = PM_out[7:4];
        // Rj1 = PM_out[3:0]; 
        PC = PC + 1'b1; 
        stall_mc1 = 0; 
    end
    // Instruction in MC0 is stalled and IR1 is loaded with the "don't care IW"    
    else begin 
        stall_mc0 = 1; 
        IR1 = 14'h3fff; 
    end 
    // After the JMP_IC instruction reaches MC3 OR (LD_IC or ST_C) reach MC1,
    // start refilling the pipe by removing the stalls. For JMP_IC the stalls are 
    // removed in this order: stall_mc0 --> stall_mc1 --> stall_mc2
    if ((IR3 == 14'h3fff) && (IR2[6:0] != 7'b1100011)) begin // update stalls for branching
        stall_mc0 = 0; 
    end
end // reset
end // my_CPU
endmodule
