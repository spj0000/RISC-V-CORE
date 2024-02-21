module spj_ir2assembly_v (
input      [31:0] IR         ,
input             Resetn_pin ,
output reg [95:0] ICis
);

// This module is converting the IW information into a string of ASCII characters. 
// This is ONLY needed for debugging purposes. 
// It should be eliminated when compiling/ synthesizing for FPGA implementation. 
// It is described behaviorally. 
// In the ModelSim wavform, select the display radix for this output signal to be ASCII.

// Internal wire declarations
reg [7:0] IR11to6  ;
reg [7:0] IR5to0   ;
reg [7:0] sbit     ;
reg [7:0] sbit_val ;

reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
reg [4:0] rd;
reg [4:0] rs1;
reg [4:0] rs2;
reg [11:0] immediate;
reg [8:0] name;

always @ (*) begin
    // Converting register numbers to ASCII digit character numbers
    IR11to6 = 8'h30 + {2'b00, IR[7:4]};
    IR5to0 = 8'h30 + {2'b00, IR[3:0]};

    opcode = IR[6:0];
    rd = 8'h30 + {IR[11:7]};
    funct3 = IR[14:12];
    rs1 = 8'h30 + {2'b00, IR[19:15]};
    rs2 = 8'h30 + {2'b00, IR[24:20]};
    funct7 = IR[31:25];

    if (Resetn_pin == 1'b0)
        ICis = {8'h52, 8'h53, 8'h54, 8'h20}; //RST;
    else if (IR == 32'hffffffff)
        ICis = {8'h53, 8'h54, 8'h41, 8'h4C, 8'h4C, 8'h20, 8'h20, 8'h20, 8'h20, 8'h20, 8'h20, 8'h20}; //STALL
    else case (opcode)
        7'b0110011: begin // R-Type Instructions
            case (funct3)
                3'b000: begin
                    case (funct7)
                        7'b0000000: begin // add
                            ICis = {"add x",rd," x",rs1," x",rs2};
                        end
                        7'b0100000: begin // sub
                            ICis = {"sub x",rd," x",rs1," x",rs2};
                        end
                    endcase
                end
                3'b001: begin // sll
                    ICis = {"sll x",rd," x",rs1," x",rs2};
                end
                3'b100: begin // xor
                    ICis = {"xor x",rd," x",rs1," x",rs2};
                end
                3'b110: begin // or
                    ICis = {"or x",rd," x",rs1," x",rs2};
                end
                3'b111: begin // and
                    ICis = {"and x",rd," x",rs1," x",rs2};
                end
                3'b101: begin // srl & sra
                    case (funct7)
                        7'b0000000: begin // srl
                            ICis = {"srl x",rd," x",rs1," x",rs2};
                        end
                        7'b0100000: begin // sra
                            ICis = {"sra x",rd," x",rs1," x",rs2};
                        end
                    endcase
                end
            endcase
        end
        7'b0000011: begin // I-Type - Load Instructions
            case (funct3)
                3'b010: begin // lw
                    ICis = {"load word FINISH ME LATER"};
                end
            endcase
        end
        7'b0010011: begin // I-Type - Arithmetic Instructions
            case (funct3) 
                3'b000: begin // addi
                    ICis = {"addi"};
                end
                3'b100: begin // xori
                    ICis = {"xori x",rd," x", rs1};
                end
                3'b110: begin // ori
                    ICis = {"ori x",rd," x", rs1};
                end
                3'b111: begin // andi
                    ICis = {"andi x",rd," x", rs1};
                end 
                3'b001: begin // slli
                    ICis = {"slli x",rd," x", rs1};
                end 
                3'b101: begin
                    case (funct7) // higher-order immediate bits
                        7'b0000000: begin // srli
                            ICis = {"srli x",rd," x", rs1};
                        end
                        7'b0100000: begin // srai
                            ICis = {"srai x",rd," x", rs1};
                        end
                    endcase
                end
            endcase
        end
        default : ICis = {8'h4E, 8'h44, 8'h45, 8'h46}; // NDEF 
        endcase
end
endmodule
