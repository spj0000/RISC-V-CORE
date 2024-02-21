-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from spj_fp_add_0002
-- VHDL created on Sun Feb 11 12:57:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity spj_fp_add_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end spj_fp_add_0002;

architecture normal of spj_fp_add_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cWFP2_uid61_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid63_fpAddTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid64_fpAddTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid65_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid67_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid76_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid77_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid80_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid82_fpAddTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid84_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid86_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid87_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid89_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oneCST_uid90_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInc_uid91_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid92_fpAddTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid93_fpAddTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid93_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid94_fpAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid94_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid95_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid95_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid96_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid96_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid97_fpAddTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid97_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid98_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid99_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid103_fpAddTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid104_fpAddTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal wEP2AllOwE_uid105_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid106_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid106_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid111_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid112_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfEQMin_uid113_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid114_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid114_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid115_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid116_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid116_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid117_fpAddTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid117_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid118_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid119_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid120_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid121_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid122_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid123_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid124_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid125_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid126_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid127_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid128_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid129_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid130_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid131_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid132_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid133_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid135_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid136_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid137_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid138_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid139_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid140_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid143_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid143_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid147_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid147_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid148_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid150_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid151_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid152_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid153_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid154_lzCountVal_uid85_fpAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid154_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid155_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid157_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid157_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid160_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid163_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid163_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid164_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid166_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid169_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid169_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid170_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid172_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid175_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid175_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid177_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid178_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid179_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal wIntCst_uid183_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng16_uid185_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx1_uid187_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng32_uid188_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx2Pad32_uid189_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2_uid190_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng48_uid191_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx3Pad48_uid192_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid193_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng4_uid196_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx1_uid198_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng8_uid199_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage1Idx2_uid201_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng12_uid202_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal rightShiftStage1Idx3Pad12_uid203_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3_uid204_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage2Idx1_uid209_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage2Idx2_uid212_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage2Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3_uid215_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal zeroOutCst_uid218_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid219_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid219_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx1_uid225_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2_uid228_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad24_uid229_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx3_uid231_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx1_uid236_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid239_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Pad6_uid240_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1Idx3_uid242_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage2Idx1_uid247_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_vStage_uid154_lzCountVal_uid85_fpAddTest_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist3_fracGRS_uid84_fpAddTest_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist4_effSub_uid52_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sigB_uid51_fpAddTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sigA_uid50_fpAddTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_InvExpXIsZero_uid44_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracXIsZero_uid39_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_expXIsMax_uid38_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_frac_aSig_uid22_fpAddTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist12_exp_aSig_uid21_fpAddTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- cAmA_uid86_fpAddTest(CONSTANT,85)
    cAmA_uid86_fpAddTest_q <= "11100";

    -- zs_uid150_lzCountVal_uid85_fpAddTest(CONSTANT,149)
    zs_uid150_lzCountVal_uid85_fpAddTest_q <= "0000000000000000";

    -- sigY_uid9_fpAddTest(BITSELECT,8)@0
    sigY_uid9_fpAddTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- expY_uid11_fpAddTest(BITSELECT,10)@0
    expY_uid11_fpAddTest_b <= b(30 downto 23);

    -- fracY_uid10_fpAddTest(BITSELECT,9)@0
    fracY_uid10_fpAddTest_b <= b(22 downto 0);

    -- ypn_uid12_fpAddTest(BITJOIN,11)@0
    ypn_uid12_fpAddTest_q <= sigY_uid9_fpAddTest_b & expY_uid11_fpAddTest_b & fracY_uid10_fpAddTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(30 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(32));

    -- bSig_uid17_fpAddTest(MUX,16)@0
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_combproc: PROCESS (bSig_uid17_fpAddTest_s, en, a, ypn_uid12_fpAddTest_q)
    BEGIN
        CASE (bSig_uid17_fpAddTest_s) IS
            WHEN "0" => bSig_uid17_fpAddTest_q <= a;
            WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@0
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(31 downto 31));

    -- aSig_uid16_fpAddTest(MUX,15)@0
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, en, ypn_uid12_fpAddTest_q, a)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= a;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@0
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(31 downto 31));

    -- effSub_uid52_fpAddTest(LOGICAL,51)@0 + 1
    effSub_uid52_fpAddTest_qi <= sigA_uid50_fpAddTest_b xor sigB_uid51_fpAddTest_b;
    effSub_uid52_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_qi, xout => effSub_uid52_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@0
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(30 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(30 downto 23);

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@0
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(30 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(30 downto 23);

    -- expAmExpB_uid60_fpAddTest(SUB,59)@0
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid21_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid35_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(8 downto 0);

    -- cWFP2_uid61_fpAddTest(CONSTANT,60)
    cWFP2_uid61_fpAddTest_q <= "11001";

    -- shiftedOut_uid63_fpAddTest(COMPARE,62)@0
    shiftedOut_uid63_fpAddTest_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid61_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid63_fpAddTest_a) - UNSIGNED(shiftedOut_uid63_fpAddTest_b));
    shiftedOut_uid63_fpAddTest_c(0) <= shiftedOut_uid63_fpAddTest_o(10);

    -- iShiftedOut_uid67_fpAddTest(LOGICAL,66)@0
    iShiftedOut_uid67_fpAddTest_q <= not (shiftedOut_uid63_fpAddTest_c);

    -- zeroOutCst_uid218_alignmentShifter_uid64_fpAddTest(CONSTANT,217)
    zeroOutCst_uid218_alignmentShifter_uid64_fpAddTest_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage2Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest(CONSTANT,213)
    rightShiftStage2Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest(BITSELECT,212)@0
    rightShiftStage2Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q(48 downto 3);

    -- rightShiftStage2Idx3_uid215_alignmentShifter_uid64_fpAddTest(BITJOIN,214)@0
    rightShiftStage2Idx3_uid215_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q & rightShiftStage2Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid170_lzCountVal_uid85_fpAddTest(CONSTANT,169)
    zs_uid170_lzCountVal_uid85_fpAddTest_q <= "00";

    -- rightShiftStage2Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest(BITSELECT,209)@0
    rightShiftStage2Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q(48 downto 2);

    -- rightShiftStage2Idx2_uid212_alignmentShifter_uid64_fpAddTest(BITJOIN,211)@0
    rightShiftStage2Idx2_uid212_alignmentShifter_uid64_fpAddTest_q <= zs_uid170_lzCountVal_uid85_fpAddTest_q & rightShiftStage2Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage2Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest(BITSELECT,206)@0
    rightShiftStage2Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q(48 downto 1);

    -- rightShiftStage2Idx1_uid209_alignmentShifter_uid64_fpAddTest(BITJOIN,208)@0
    rightShiftStage2Idx1_uid209_alignmentShifter_uid64_fpAddTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx3Pad12_uid203_alignmentShifter_uid64_fpAddTest(CONSTANT,202)
    rightShiftStage1Idx3Pad12_uid203_alignmentShifter_uid64_fpAddTest_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid202_alignmentShifter_uid64_fpAddTest(BITSELECT,201)@0
    rightShiftStage1Idx3Rng12_uid202_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q(48 downto 12);

    -- rightShiftStage1Idx3_uid204_alignmentShifter_uid64_fpAddTest(BITJOIN,203)@0
    rightShiftStage1Idx3_uid204_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3Pad12_uid203_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx3Rng12_uid202_alignmentShifter_uid64_fpAddTest_b;

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid199_alignmentShifter_uid64_fpAddTest(BITSELECT,198)@0
    rightShiftStage1Idx2Rng8_uid199_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q(48 downto 8);

    -- rightShiftStage1Idx2_uid201_alignmentShifter_uid64_fpAddTest(BITJOIN,200)@0
    rightShiftStage1Idx2_uid201_alignmentShifter_uid64_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q & rightShiftStage1Idx2Rng8_uid199_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid164_lzCountVal_uid85_fpAddTest(CONSTANT,163)
    zs_uid164_lzCountVal_uid85_fpAddTest_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid196_alignmentShifter_uid64_fpAddTest(BITSELECT,195)@0
    rightShiftStage1Idx1Rng4_uid196_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q(48 downto 4);

    -- rightShiftStage1Idx1_uid198_alignmentShifter_uid64_fpAddTest(BITJOIN,197)@0
    rightShiftStage1Idx1_uid198_alignmentShifter_uid64_fpAddTest_q <= zs_uid164_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx1Rng4_uid196_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx3Pad48_uid192_alignmentShifter_uid64_fpAddTest(CONSTANT,191)
    rightShiftStage0Idx3Pad48_uid192_alignmentShifter_uid64_fpAddTest_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid191_alignmentShifter_uid64_fpAddTest(BITSELECT,190)@0
    rightShiftStage0Idx3Rng48_uid191_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 48);

    -- rightShiftStage0Idx3_uid193_alignmentShifter_uid64_fpAddTest(BITJOIN,192)@0
    rightShiftStage0Idx3_uid193_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3Pad48_uid192_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx3Rng48_uid191_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx2Pad32_uid189_alignmentShifter_uid64_fpAddTest(CONSTANT,188)
    rightShiftStage0Idx2Pad32_uid189_alignmentShifter_uid64_fpAddTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng32_uid188_alignmentShifter_uid64_fpAddTest(BITSELECT,187)@0
    rightShiftStage0Idx2Rng32_uid188_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 32);

    -- rightShiftStage0Idx2_uid190_alignmentShifter_uid64_fpAddTest(BITJOIN,189)@0
    rightShiftStage0Idx2_uid190_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx2Pad32_uid189_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx2Rng32_uid188_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx1Rng16_uid185_alignmentShifter_uid64_fpAddTest(BITSELECT,184)@0
    rightShiftStage0Idx1Rng16_uid185_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 16);

    -- rightShiftStage0Idx1_uid187_alignmentShifter_uid64_fpAddTest(BITJOIN,186)@0
    rightShiftStage0Idx1_uid187_alignmentShifter_uid64_fpAddTest_q <= zs_uid150_lzCountVal_uid85_fpAddTest_q & rightShiftStage0Idx1Rng16_uid185_alignmentShifter_uid64_fpAddTest_b;

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@0
    excZ_bSig_uid17_uid37_fpAddTest_q <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@0
    InvExpXIsZero_uid44_fpAddTest_q <= not (excZ_bSig_uid17_uid37_fpAddTest_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "00000000000000000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@0
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(22 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(22 downto 0);

    -- fracBz_uid56_fpAddTest(MUX,55)@0
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_combproc: PROCESS (fracBz_uid56_fpAddTest_s, en, frac_bSig_uid36_fpAddTest_b, cstZeroWF_uid19_fpAddTest_q)
    BEGIN
        CASE (fracBz_uid56_fpAddTest_s) IS
            WHEN "0" => fracBz_uid56_fpAddTest_q <= frac_bSig_uid36_fpAddTest_b;
            WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@0
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- padConst_uid64_fpAddTest(CONSTANT,63)
    padConst_uid64_fpAddTest_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid65_fpAddTest(BITJOIN,64)@0
    rightPaddedIn_uid65_fpAddTest_q <= oFracB_uid59_fpAddTest_q & padConst_uid64_fpAddTest_q;

    -- rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest(MUX,194)@0
    rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_b;
    rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_s, en, rightPaddedIn_uid65_fpAddTest_q, rightShiftStage0Idx1_uid187_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx2_uid190_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx3_uid193_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "00" => rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q <= rightPaddedIn_uid65_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx1_uid187_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx2_uid190_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3_uid193_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest(MUX,205)@0
    rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_c;
    rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_s, en, rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx1_uid198_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx2_uid201_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx3_uid204_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "00" => rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0_uid195_alignmentShifter_uid64_fpAddTest_q;
            WHEN "01" => rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx1_uid198_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx2_uid201_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3_uid204_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select(BITSELECT,250)@0
    rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(5 downto 0);
    rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_b <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(5 downto 4);
    rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_c <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(3 downto 2);
    rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_d <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(1 downto 0);

    -- rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest(MUX,216)@0
    rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel5Dto4_uid194_alignmentShifter_uid64_fpAddTest_merged_bit_select_d;
    rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_s, en, rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q, rightShiftStage2Idx1_uid209_alignmentShifter_uid64_fpAddTest_q, rightShiftStage2Idx2_uid212_alignmentShifter_uid64_fpAddTest_q, rightShiftStage2Idx3_uid215_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "00" => rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1_uid206_alignmentShifter_uid64_fpAddTest_q;
            WHEN "01" => rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx1_uid209_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx2_uid212_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx3_uid215_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid183_alignmentShifter_uid64_fpAddTest(CONSTANT,182)
    wIntCst_uid183_alignmentShifter_uid64_fpAddTest_q <= "110001";

    -- shiftedOut_uid184_alignmentShifter_uid64_fpAddTest(COMPARE,183)@0
    shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid183_alignmentShifter_uid64_fpAddTest_q);
    shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_a) - UNSIGNED(shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_b));
    shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_n(0) <= not (shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_o(10));

    -- r_uid219_alignmentShifter_uid64_fpAddTest(MUX,218)@0
    r_uid219_alignmentShifter_uid64_fpAddTest_s <= shiftedOut_uid184_alignmentShifter_uid64_fpAddTest_n;
    r_uid219_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (r_uid219_alignmentShifter_uid64_fpAddTest_s, en, rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q, zeroOutCst_uid218_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (r_uid219_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "0" => r_uid219_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2_uid217_alignmentShifter_uid64_fpAddTest_q;
            WHEN "1" => r_uid219_alignmentShifter_uid64_fpAddTest_q <= zeroOutCst_uid218_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => r_uid219_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid68_fpAddTest(LOGICAL,67)@0
    alignFracBPostShiftOut_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid67_fpAddTest_q(0)) & iShiftedOut_uid67_fpAddTest_q));
    alignFracBPostShiftOut_uid68_fpAddTest_q <= r_uid219_alignmentShifter_uid64_fpAddTest_q and alignFracBPostShiftOut_uid68_fpAddTest_b;

    -- stickyBits_uid69_fpAddTest_merged_bit_select(BITSELECT,251)@0
    stickyBits_uid69_fpAddTest_merged_bit_select_b <= alignFracBPostShiftOut_uid68_fpAddTest_q(22 downto 0);
    stickyBits_uid69_fpAddTest_merged_bit_select_c <= alignFracBPostShiftOut_uid68_fpAddTest_q(48 downto 23);

    -- redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1(DELAY,256)
    redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid69_fpAddTest_merged_bit_select_c, xout => redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- fracBAddOp_uid80_fpAddTest(BITJOIN,79)@1
    fracBAddOp_uid80_fpAddTest_q <= GND_q & redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid81_fpAddTest(LOGICAL,80)@1
    fracBAddOpPostXor_uid81_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    fracBAddOpPostXor_uid81_fpAddTest_q <= fracBAddOp_uid80_fpAddTest_q xor fracBAddOpPostXor_uid81_fpAddTest_b;

    -- zocst_uid76_fpAddTest(CONSTANT,75)
    zocst_uid76_fpAddTest_q <= "01";

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@0
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(22 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(22 downto 0);

    -- redist11_frac_aSig_uid22_fpAddTest_b_1(DELAY,267)
    redist11_frac_aSig_uid22_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid22_fpAddTest_b, xout => redist11_frac_aSig_uid22_fpAddTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,70)@0 + 1
    cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN stickyBits_uid69_fpAddTest_merged_bit_select_b = cstZeroWF_uid19_fpAddTest_q ELSE "0";
    cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- effSubInvSticky_uid74_fpAddTest(LOGICAL,73)@1
    effSubInvSticky_uid74_fpAddTest_q <= effSub_uid52_fpAddTest_q and cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;

    -- fracAAddOp_uid77_fpAddTest(BITJOIN,76)@1
    fracAAddOp_uid77_fpAddTest_q <= zocst_uid76_fpAddTest_q & redist11_frac_aSig_uid22_fpAddTest_b_1_q & GND_q & effSubInvSticky_uid74_fpAddTest_q;

    -- fracAddResult_uid82_fpAddTest(ADD,81)@1
    fracAddResult_uid82_fpAddTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid77_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid81_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid82_fpAddTest_a) + UNSIGNED(fracAddResult_uid82_fpAddTest_b));
    fracAddResult_uid82_fpAddTest_q <= fracAddResult_uid82_fpAddTest_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid83_fpAddTest(BITSELECT,82)@1
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in <= fracAddResult_uid82_fpAddTest_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid72_fpAddTest(LOGICAL,71)@1
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q <= not (cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q);

    -- fracGRS_uid84_fpAddTest(BITJOIN,83)@1
    fracGRS_uid84_fpAddTest_q <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b & invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q;

    -- rVStage_uid151_lzCountVal_uid85_fpAddTest(BITSELECT,150)@1
    rVStage_uid151_lzCountVal_uid85_fpAddTest_b <= fracGRS_uid84_fpAddTest_q(27 downto 12);

    -- vCount_uid152_lzCountVal_uid85_fpAddTest(LOGICAL,151)@1
    vCount_uid152_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid151_lzCountVal_uid85_fpAddTest_b = zs_uid150_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStage_uid154_lzCountVal_uid85_fpAddTest(BITSELECT,153)@1
    vStage_uid154_lzCountVal_uid85_fpAddTest_in <= fracGRS_uid84_fpAddTest_q(11 downto 0);
    vStage_uid154_lzCountVal_uid85_fpAddTest_b <= vStage_uid154_lzCountVal_uid85_fpAddTest_in(11 downto 0);

    -- mO_uid153_lzCountVal_uid85_fpAddTest(CONSTANT,152)
    mO_uid153_lzCountVal_uid85_fpAddTest_q <= "1111";

    -- cStage_uid155_lzCountVal_uid85_fpAddTest(BITJOIN,154)@1
    cStage_uid155_lzCountVal_uid85_fpAddTest_q <= vStage_uid154_lzCountVal_uid85_fpAddTest_b & mO_uid153_lzCountVal_uid85_fpAddTest_q;

    -- vStagei_uid157_lzCountVal_uid85_fpAddTest(MUX,156)@1
    vStagei_uid157_lzCountVal_uid85_fpAddTest_s <= vCount_uid152_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid157_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid157_lzCountVal_uid85_fpAddTest_s, en, rVStage_uid151_lzCountVal_uid85_fpAddTest_b, cStage_uid155_lzCountVal_uid85_fpAddTest_q)
    BEGIN
        CASE (vStagei_uid157_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= rVStage_uid151_lzCountVal_uid85_fpAddTest_b;
            WHEN "1" => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= cStage_uid155_lzCountVal_uid85_fpAddTest_q;
            WHEN OTHERS => vStagei_uid157_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,252)@1
    rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid157_lzCountVal_uid85_fpAddTest_q(15 downto 8);
    rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid157_lzCountVal_uid85_fpAddTest_q(7 downto 0);

    -- vCount_uid160_lzCountVal_uid85_fpAddTest(LOGICAL,159)@1
    vCount_uid160_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- vStagei_uid163_lzCountVal_uid85_fpAddTest(MUX,162)@1
    vStagei_uid163_lzCountVal_uid85_fpAddTest_s <= vCount_uid160_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid163_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid163_lzCountVal_uid85_fpAddTest_s, en, rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid163_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= rVStage_uid159_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid163_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,253)@1
    rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid163_lzCountVal_uid85_fpAddTest_q(7 downto 4);
    rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid163_lzCountVal_uid85_fpAddTest_q(3 downto 0);

    -- vCount_uid166_lzCountVal_uid85_fpAddTest(LOGICAL,165)@1
    vCount_uid166_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid164_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStagei_uid169_lzCountVal_uid85_fpAddTest(MUX,168)@1
    vStagei_uid169_lzCountVal_uid85_fpAddTest_s <= vCount_uid166_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid169_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid169_lzCountVal_uid85_fpAddTest_s, en, rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid169_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= rVStage_uid165_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid169_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,254)@1
    rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid169_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid169_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- vCount_uid172_lzCountVal_uid85_fpAddTest(LOGICAL,171)@1
    vCount_uid172_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid170_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStagei_uid175_lzCountVal_uid85_fpAddTest(MUX,174)@1
    vStagei_uid175_lzCountVal_uid85_fpAddTest_s <= vCount_uid172_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid175_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid175_lzCountVal_uid85_fpAddTest_s, en, rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid175_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= rVStage_uid171_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid175_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid177_lzCountVal_uid85_fpAddTest(BITSELECT,176)@1
    rVStage_uid177_lzCountVal_uid85_fpAddTest_b <= vStagei_uid175_lzCountVal_uid85_fpAddTest_q(1 downto 1);

    -- vCount_uid178_lzCountVal_uid85_fpAddTest(LOGICAL,177)@1
    vCount_uid178_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid177_lzCountVal_uid85_fpAddTest_b = GND_q ELSE "0";

    -- r_uid179_lzCountVal_uid85_fpAddTest(BITJOIN,178)@1
    r_uid179_lzCountVal_uid85_fpAddTest_q <= vCount_uid152_lzCountVal_uid85_fpAddTest_q & vCount_uid160_lzCountVal_uid85_fpAddTest_q & vCount_uid166_lzCountVal_uid85_fpAddTest_q & vCount_uid172_lzCountVal_uid85_fpAddTest_q & vCount_uid178_lzCountVal_uid85_fpAddTest_q;

    -- redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1(DELAY,257)
    redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => r_uid179_lzCountVal_uid85_fpAddTest_q, xout => redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aMinusA_uid87_fpAddTest(LOGICAL,86)@2
    aMinusA_uid87_fpAddTest_q <= "1" WHEN redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q = cAmA_uid86_fpAddTest_q ELSE "0";

    -- invAMinusA_uid129_fpAddTest(LOGICAL,128)@2
    invAMinusA_uid129_fpAddTest_q <= not (aMinusA_uid87_fpAddTest_q);

    -- redist6_sigA_uid50_fpAddTest_b_2(DELAY,262)
    redist6_sigA_uid50_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist6_sigA_uid50_fpAddTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist9_expXIsMax_uid38_fpAddTest_q_2(DELAY,265)
    redist9_expXIsMax_uid38_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_q, xout => redist9_expXIsMax_uid38_fpAddTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@2
    invExpXIsMax_uid43_fpAddTest_q <= not (redist9_expXIsMax_uid38_fpAddTest_q_2_q);

    -- redist7_InvExpXIsZero_uid44_fpAddTest_q_2(DELAY,263)
    redist7_InvExpXIsZero_uid44_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid44_fpAddTest_q, xout => redist7_InvExpXIsZero_uid44_fpAddTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@2
    excR_bSig_uid45_fpAddTest_q <= redist7_InvExpXIsZero_uid44_fpAddTest_q_2_q and invExpXIsMax_uid43_fpAddTest_q;

    -- redist12_exp_aSig_uid21_fpAddTest_b_1(DELAY,268)
    redist12_exp_aSig_uid21_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid21_fpAddTest_b, xout => redist12_exp_aSig_uid21_fpAddTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@1 + 1
    expXIsMax_uid24_fpAddTest_qi <= "1" WHEN redist12_exp_aSig_uid21_fpAddTest_b_1_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid24_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpAddTest_qi, xout => expXIsMax_uid24_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@2
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@1 + 1
    excZ_aSig_uid16_uid23_fpAddTest_qi <= "1" WHEN redist12_exp_aSig_uid21_fpAddTest_b_1_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";
    excZ_aSig_uid16_uid23_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid16_uid23_fpAddTest_qi, xout => excZ_aSig_uid16_uid23_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@2
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@2
    excR_aSig_uid31_fpAddTest_q <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;

    -- signRReg_uid130_fpAddTest(LOGICAL,129)@2
    signRReg_uid130_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q and redist6_sigA_uid50_fpAddTest_b_2_q and invAMinusA_uid129_fpAddTest_q;

    -- redist5_sigB_uid51_fpAddTest_b_2(DELAY,261)
    redist5_sigB_uid51_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist5_sigB_uid51_fpAddTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2(DELAY,266)
    redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_q, xout => redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid134_fpAddTest(LOGICAL,133)@2
    excAZBZSigASigB_uid134_fpAddTest_q <= excZ_aSig_uid16_uid23_fpAddTest_q and redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2_q and redist6_sigA_uid50_fpAddTest_b_2_q and redist5_sigB_uid51_fpAddTest_b_2_q;

    -- excBZARSigA_uid135_fpAddTest(LOGICAL,134)@2
    excBZARSigA_uid135_fpAddTest_q <= redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2_q and excR_aSig_uid31_fpAddTest_q and redist6_sigA_uid50_fpAddTest_b_2_q;

    -- signRZero_uid136_fpAddTest(LOGICAL,135)@2
    signRZero_uid136_fpAddTest_q <= excBZARSigA_uid135_fpAddTest_q or excAZBZSigASigB_uid134_fpAddTest_q;

    -- fracXIsZero_uid39_fpAddTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = frac_bSig_uid36_fpAddTest_b ELSE "0";
    fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_qi, xout => fracXIsZero_uid39_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist8_fracXIsZero_uid39_fpAddTest_q_2(DELAY,264)
    redist8_fracXIsZero_uid39_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_q, xout => redist8_fracXIsZero_uid39_fpAddTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@2
    excI_bSig_uid41_fpAddTest_q <= redist9_expXIsMax_uid38_fpAddTest_q_2_q and redist8_fracXIsZero_uid39_fpAddTest_q_2_q;

    -- sigBBInf_uid131_fpAddTest(LOGICAL,130)@2
    sigBBInf_uid131_fpAddTest_q <= redist5_sigB_uid51_fpAddTest_b_2_q and excI_bSig_uid41_fpAddTest_q;

    -- fracXIsZero_uid25_fpAddTest(LOGICAL,24)@1 + 1
    fracXIsZero_uid25_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist11_frac_aSig_uid22_fpAddTest_b_1_q ELSE "0";
    fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_qi, xout => fracXIsZero_uid25_fpAddTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@2
    excI_aSig_uid27_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and fracXIsZero_uid25_fpAddTest_q;

    -- sigAAInf_uid132_fpAddTest(LOGICAL,131)@2
    sigAAInf_uid132_fpAddTest_q <= redist6_sigA_uid50_fpAddTest_b_2_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid133_fpAddTest(LOGICAL,132)@2
    signRInf_uid133_fpAddTest_q <= sigAAInf_uid132_fpAddTest_q or sigBBInf_uid131_fpAddTest_q;

    -- signRInfRZRReg_uid137_fpAddTest(LOGICAL,136)@2
    signRInfRZRReg_uid137_fpAddTest_q <= signRInf_uid133_fpAddTest_q or signRZero_uid136_fpAddTest_q or signRReg_uid130_fpAddTest_q;

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@2
    fracXIsNotZero_uid40_fpAddTest_q <= not (redist8_fracXIsZero_uid39_fpAddTest_q_2_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@2
    excN_bSig_uid42_fpAddTest_q <= redist9_expXIsMax_uid38_fpAddTest_q_2_q and fracXIsNotZero_uid40_fpAddTest_q;

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@2
    fracXIsNotZero_uid26_fpAddTest_q <= not (fracXIsZero_uid25_fpAddTest_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@2
    excN_aSig_uid28_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;

    -- excRNaN2_uid124_fpAddTest(LOGICAL,123)@2
    excRNaN2_uid124_fpAddTest_q <= excN_aSig_uid28_fpAddTest_q or excN_bSig_uid42_fpAddTest_q;

    -- redist4_effSub_uid52_fpAddTest_q_2(DELAY,260)
    redist4_effSub_uid52_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist4_effSub_uid52_fpAddTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excAIBISub_uid125_fpAddTest(LOGICAL,124)@2
    excAIBISub_uid125_fpAddTest_q <= excI_aSig_uid27_fpAddTest_q and excI_bSig_uid41_fpAddTest_q and redist4_effSub_uid52_fpAddTest_q_2_q;

    -- excRNaN_uid126_fpAddTest(LOGICAL,125)@2
    excRNaN_uid126_fpAddTest_q <= excAIBISub_uid125_fpAddTest_q or excRNaN2_uid124_fpAddTest_q;

    -- invExcRNaN_uid138_fpAddTest(LOGICAL,137)@2
    invExcRNaN_uid138_fpAddTest_q <= not (excRNaN_uid126_fpAddTest_q);

    -- signRPostExc_uid139_fpAddTest(LOGICAL,138)@2
    signRPostExc_uid139_fpAddTest_q <= invExcRNaN_uid138_fpAddTest_q and signRInfRZRReg_uid137_fpAddTest_q;

    -- cRBit_uid99_fpAddTest(CONSTANT,98)
    cRBit_uid99_fpAddTest_q <= "01000";

    -- leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest(BITSELECT,245)@2
    leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q(26 downto 0);
    leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_in(26 downto 0);

    -- leftShiftStage2Idx1_uid247_fracPostNormExt_uid88_fpAddTest(BITJOIN,246)@2
    leftShiftStage2Idx1_uid247_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx1Rng1_uid246_fracPostNormExt_uid88_fpAddTest_b & GND_q;

    -- leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest(BITSELECT,240)@2
    leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q(21 downto 0);
    leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_in(21 downto 0);

    -- leftShiftStage1Idx3Pad6_uid240_fracPostNormExt_uid88_fpAddTest(CONSTANT,239)
    leftShiftStage1Idx3Pad6_uid240_fracPostNormExt_uid88_fpAddTest_q <= "000000";

    -- leftShiftStage1Idx3_uid242_fracPostNormExt_uid88_fpAddTest(BITJOIN,241)@2
    leftShiftStage1Idx3_uid242_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3Rng6_uid241_fracPostNormExt_uid88_fpAddTest_b & leftShiftStage1Idx3Pad6_uid240_fracPostNormExt_uid88_fpAddTest_q;

    -- leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest(BITSELECT,237)@2
    leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q(23 downto 0);
    leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_in(23 downto 0);

    -- leftShiftStage1Idx2_uid239_fracPostNormExt_uid88_fpAddTest(BITJOIN,238)@2
    leftShiftStage1Idx2_uid239_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2Rng4_uid238_fracPostNormExt_uid88_fpAddTest_b & zs_uid164_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest(BITSELECT,234)@2
    leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q(25 downto 0);
    leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_in(25 downto 0);

    -- leftShiftStage1Idx1_uid236_fracPostNormExt_uid88_fpAddTest(BITJOIN,235)@2
    leftShiftStage1Idx1_uid236_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1Rng2_uid235_fracPostNormExt_uid88_fpAddTest_b & zs_uid170_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest(BITSELECT,229)@2
    leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_in <= redist3_fracGRS_uid84_fpAddTest_q_1_q(3 downto 0);
    leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_in(3 downto 0);

    -- leftShiftStage0Idx3Pad24_uid229_fracPostNormExt_uid88_fpAddTest(CONSTANT,228)
    leftShiftStage0Idx3Pad24_uid229_fracPostNormExt_uid88_fpAddTest_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid231_fracPostNormExt_uid88_fpAddTest(BITJOIN,230)@2
    leftShiftStage0Idx3_uid231_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3Rng24_uid230_fracPostNormExt_uid88_fpAddTest_b & leftShiftStage0Idx3Pad24_uid229_fracPostNormExt_uid88_fpAddTest_q;

    -- redist2_vStage_uid154_lzCountVal_uid85_fpAddTest_b_1(DELAY,258)
    redist2_vStage_uid154_lzCountVal_uid85_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid154_lzCountVal_uid85_fpAddTest_b, xout => redist2_vStage_uid154_lzCountVal_uid85_fpAddTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid228_fracPostNormExt_uid88_fpAddTest(BITJOIN,227)@2
    leftShiftStage0Idx2_uid228_fracPostNormExt_uid88_fpAddTest_q <= redist2_vStage_uid154_lzCountVal_uid85_fpAddTest_b_1_q & zs_uid150_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest(BITSELECT,223)@2
    leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_in <= redist3_fracGRS_uid84_fpAddTest_q_1_q(19 downto 0);
    leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_in(19 downto 0);

    -- leftShiftStage0Idx1_uid225_fracPostNormExt_uid88_fpAddTest(BITJOIN,224)@2
    leftShiftStage0Idx1_uid225_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1Rng8_uid224_fracPostNormExt_uid88_fpAddTest_b & cstAllZWE_uid20_fpAddTest_q;

    -- redist3_fracGRS_uid84_fpAddTest_q_1(DELAY,259)
    redist3_fracGRS_uid84_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracGRS_uid84_fpAddTest_q, xout => redist3_fracGRS_uid84_fpAddTest_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest(MUX,232)@2
    leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b;
    leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_s, en, redist3_fracGRS_uid84_fpAddTest_q_1_q, leftShiftStage0Idx1_uid225_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx2_uid228_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx3_uid231_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q <= redist3_fracGRS_uid84_fpAddTest_q_1_q;
            WHEN "01" => leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1_uid225_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx2_uid228_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3_uid231_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest(MUX,243)@2
    leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c;
    leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_s, en, leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx1_uid236_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx2_uid239_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx3_uid242_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0_uid233_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "01" => leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1_uid236_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2_uid239_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3_uid242_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select(BITSELECT,255)@2
    leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b <= redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q(4 downto 3);
    leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c <= redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q(2 downto 1);
    leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d <= redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q(0 downto 0);

    -- leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest(MUX,248)@2
    leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel4Dto3_uid232_fracPostNormExt_uid88_fpAddTest_merged_bit_select_d;
    leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_s, en, leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage2Idx1_uid247_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "0" => leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1_uid244_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "1" => leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage2Idx1_uid247_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid97_fpAddTest(BITSELECT,96)@2
    LSB_uid97_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(4 downto 0));
    LSB_uid97_fpAddTest_b <= STD_LOGIC_VECTOR(LSB_uid97_fpAddTest_in(4 downto 4));

    -- Guard_uid96_fpAddTest(BITSELECT,95)@2
    Guard_uid96_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(3 downto 0));
    Guard_uid96_fpAddTest_b <= STD_LOGIC_VECTOR(Guard_uid96_fpAddTest_in(3 downto 3));

    -- Round_uid95_fpAddTest(BITSELECT,94)@2
    Round_uid95_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(2 downto 0));
    Round_uid95_fpAddTest_b <= STD_LOGIC_VECTOR(Round_uid95_fpAddTest_in(2 downto 2));

    -- Sticky1_uid94_fpAddTest(BITSELECT,93)@2
    Sticky1_uid94_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(1 downto 0));
    Sticky1_uid94_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky1_uid94_fpAddTest_in(1 downto 1));

    -- Sticky0_uid93_fpAddTest(BITSELECT,92)@2
    Sticky0_uid93_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(0 downto 0));
    Sticky0_uid93_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky0_uid93_fpAddTest_in(0 downto 0));

    -- rndBitCond_uid98_fpAddTest(BITJOIN,97)@2
    rndBitCond_uid98_fpAddTest_q <= LSB_uid97_fpAddTest_b & Guard_uid96_fpAddTest_b & Round_uid95_fpAddTest_b & Sticky1_uid94_fpAddTest_b & Sticky0_uid93_fpAddTest_b;

    -- rBi_uid100_fpAddTest(LOGICAL,99)@2
    rBi_uid100_fpAddTest_q <= "1" WHEN rndBitCond_uid98_fpAddTest_q = cRBit_uid99_fpAddTest_q ELSE "0";

    -- roundBit_uid101_fpAddTest(LOGICAL,100)@2
    roundBit_uid101_fpAddTest_q <= not (rBi_uid100_fpAddTest_q);

    -- oneCST_uid90_fpAddTest(CONSTANT,89)
    oneCST_uid90_fpAddTest_q <= "00000001";

    -- expInc_uid91_fpAddTest(ADD,90)@1 + 1
    expInc_uid91_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist12_exp_aSig_uid21_fpAddTest_b_1_q);
    expInc_uid91_fpAddTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid90_fpAddTest_q);
    expInc_uid91_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expInc_uid91_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expInc_uid91_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid91_fpAddTest_a) + UNSIGNED(expInc_uid91_fpAddTest_b));
            END IF;
        END IF;
    END PROCESS;
    expInc_uid91_fpAddTest_q <= expInc_uid91_fpAddTest_o(8 downto 0);

    -- expPostNorm_uid92_fpAddTest(SUB,91)@2
    expPostNorm_uid92_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid91_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & redist1_r_uid179_lzCountVal_uid85_fpAddTest_q_1_q);
    expPostNorm_uid92_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid92_fpAddTest_a) - UNSIGNED(expPostNorm_uid92_fpAddTest_b));
    expPostNorm_uid92_fpAddTest_q <= expPostNorm_uid92_fpAddTest_o(9 downto 0);

    -- fracPostNorm_uid89_fpAddTest(BITSELECT,88)@2
    fracPostNorm_uid89_fpAddTest_b <= leftShiftStage2_uid249_fracPostNormExt_uid88_fpAddTest_q(27 downto 1);

    -- fracPostNormRndRange_uid102_fpAddTest(BITSELECT,101)@2
    fracPostNormRndRange_uid102_fpAddTest_in <= fracPostNorm_uid89_fpAddTest_b(25 downto 0);
    fracPostNormRndRange_uid102_fpAddTest_b <= fracPostNormRndRange_uid102_fpAddTest_in(25 downto 2);

    -- expFracR_uid103_fpAddTest(BITJOIN,102)@2
    expFracR_uid103_fpAddTest_q <= expPostNorm_uid92_fpAddTest_q & fracPostNormRndRange_uid102_fpAddTest_b;

    -- rndExpFrac_uid104_fpAddTest(ADD,103)@2
    rndExpFrac_uid104_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid103_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid101_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid104_fpAddTest_a) + UNSIGNED(rndExpFrac_uid104_fpAddTest_b));
    rndExpFrac_uid104_fpAddTest_q <= rndExpFrac_uid104_fpAddTest_o(34 downto 0);

    -- expRPreExc_uid117_fpAddTest(BITSELECT,116)@2
    expRPreExc_uid117_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(31 downto 0);
    expRPreExc_uid117_fpAddTest_b <= expRPreExc_uid117_fpAddTest_in(31 downto 24);

    -- rndExpFracOvfBits_uid109_fpAddTest(BITSELECT,108)@2
    rndExpFracOvfBits_uid109_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(33 downto 0);
    rndExpFracOvfBits_uid109_fpAddTest_b <= rndExpFracOvfBits_uid109_fpAddTest_in(33 downto 32);

    -- rOvfExtraBits_uid110_fpAddTest(LOGICAL,109)@2
    rOvfExtraBits_uid110_fpAddTest_q <= "1" WHEN rndExpFracOvfBits_uid109_fpAddTest_b = zocst_uid76_fpAddTest_q ELSE "0";

    -- wEP2AllOwE_uid105_fpAddTest(CONSTANT,104)
    wEP2AllOwE_uid105_fpAddTest_q <= "0011111111";

    -- rndExp_uid106_fpAddTest(BITSELECT,105)@2
    rndExp_uid106_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(33 downto 0);
    rndExp_uid106_fpAddTest_b <= rndExp_uid106_fpAddTest_in(33 downto 24);

    -- rOvfEQMax_uid107_fpAddTest(LOGICAL,106)@2
    rOvfEQMax_uid107_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllOwE_uid105_fpAddTest_q ELSE "0";

    -- rOvf_uid111_fpAddTest(LOGICAL,110)@2
    rOvf_uid111_fpAddTest_q <= rOvfEQMax_uid107_fpAddTest_q or rOvfExtraBits_uid110_fpAddTest_q;

    -- regInputs_uid118_fpAddTest(LOGICAL,117)@2
    regInputs_uid118_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q;

    -- rInfOvf_uid121_fpAddTest(LOGICAL,120)@2
    rInfOvf_uid121_fpAddTest_q <= regInputs_uid118_fpAddTest_q and rOvf_uid111_fpAddTest_q;

    -- excRInfVInC_uid122_fpAddTest(BITJOIN,121)@2
    excRInfVInC_uid122_fpAddTest_q <= rInfOvf_uid121_fpAddTest_q & excN_bSig_uid42_fpAddTest_q & excN_aSig_uid28_fpAddTest_q & excI_bSig_uid41_fpAddTest_q & excI_aSig_uid27_fpAddTest_q & redist4_effSub_uid52_fpAddTest_q_2_q;

    -- excRInf_uid123_fpAddTest(LOOKUP,122)@2
    excRInf_uid123_fpAddTest_combproc: PROCESS (excRInfVInC_uid122_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid122_fpAddTest_q) IS
            WHEN "000000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "000001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "000010" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "000011" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "000100" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "000101" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "000110" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "000111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "001111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "010111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "011111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100000" => excRInf_uid123_fpAddTest_q <= "1";
            WHEN "100001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "100111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "101111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "110111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111000" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111001" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111010" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111011" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111100" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111101" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111110" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN "111111" => excRInf_uid123_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid123_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rUdfExtraBit_uid114_fpAddTest(BITSELECT,113)@2
    rUdfExtraBit_uid114_fpAddTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid104_fpAddTest_q(33 downto 0));
    rUdfExtraBit_uid114_fpAddTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid114_fpAddTest_in(33 downto 33));

    -- wEP2AllZ_uid112_fpAddTest(CONSTANT,111)
    wEP2AllZ_uid112_fpAddTest_q <= "0000000000";

    -- rUdfEQMin_uid113_fpAddTest(LOGICAL,112)@2
    rUdfEQMin_uid113_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllZ_uid112_fpAddTest_q ELSE "0";

    -- rUdf_uid115_fpAddTest(LOGICAL,114)@2
    rUdf_uid115_fpAddTest_q <= rUdfEQMin_uid113_fpAddTest_q or rUdfExtraBit_uid114_fpAddTest_b;

    -- excRZeroVInC_uid119_fpAddTest(BITJOIN,118)@2
    excRZeroVInC_uid119_fpAddTest_q <= aMinusA_uid87_fpAddTest_q & rUdf_uid115_fpAddTest_q & regInputs_uid118_fpAddTest_q & redist10_excZ_bSig_uid17_uid37_fpAddTest_q_2_q & excZ_aSig_uid16_uid23_fpAddTest_q;

    -- excRZero_uid120_fpAddTest(LOOKUP,119)@2
    excRZero_uid120_fpAddTest_combproc: PROCESS (excRZeroVInC_uid119_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid119_fpAddTest_q) IS
            WHEN "00000" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00001" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00010" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00011" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "00100" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00101" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00110" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "00111" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01000" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01001" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01010" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01011" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "01100" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "01101" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01110" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "01111" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10000" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10001" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10010" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10011" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "10100" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "10101" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10110" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "10111" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11000" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11001" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11010" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11011" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "11100" => excRZero_uid120_fpAddTest_q <= "1";
            WHEN "11101" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11110" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN "11111" => excRZero_uid120_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid120_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid127_fpAddTest(BITJOIN,126)@2
    concExc_uid127_fpAddTest_q <= excRNaN_uid126_fpAddTest_q & excRInf_uid123_fpAddTest_q & excRZero_uid120_fpAddTest_q;

    -- excREnc_uid128_fpAddTest(LOOKUP,127)@2
    excREnc_uid128_fpAddTest_combproc: PROCESS (concExc_uid127_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid127_fpAddTest_q) IS
            WHEN "000" => excREnc_uid128_fpAddTest_q <= "01";
            WHEN "001" => excREnc_uid128_fpAddTest_q <= "00";
            WHEN "010" => excREnc_uid128_fpAddTest_q <= "10";
            WHEN "011" => excREnc_uid128_fpAddTest_q <= "10";
            WHEN "100" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "101" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "110" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN "111" => excREnc_uid128_fpAddTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid128_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid147_fpAddTest(MUX,146)@2
    expRPostExc_uid147_fpAddTest_s <= excREnc_uid128_fpAddTest_q;
    expRPostExc_uid147_fpAddTest_combproc: PROCESS (expRPostExc_uid147_fpAddTest_s, en, cstAllZWE_uid20_fpAddTest_q, expRPreExc_uid117_fpAddTest_b, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid147_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid147_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid147_fpAddTest_q <= expRPreExc_uid117_fpAddTest_b;
            WHEN "10" => expRPostExc_uid147_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid147_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid147_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid140_fpAddTest(CONSTANT,139)
    oneFracRPostExc2_uid140_fpAddTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid116_fpAddTest(BITSELECT,115)@2
    fracRPreExc_uid116_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(23 downto 0);
    fracRPreExc_uid116_fpAddTest_b <= fracRPreExc_uid116_fpAddTest_in(23 downto 1);

    -- fracRPostExc_uid143_fpAddTest(MUX,142)@2
    fracRPostExc_uid143_fpAddTest_s <= excREnc_uid128_fpAddTest_q;
    fracRPostExc_uid143_fpAddTest_combproc: PROCESS (fracRPostExc_uid143_fpAddTest_s, en, cstZeroWF_uid19_fpAddTest_q, fracRPreExc_uid116_fpAddTest_b, oneFracRPostExc2_uid140_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid143_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid143_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid143_fpAddTest_q <= fracRPreExc_uid116_fpAddTest_b;
            WHEN "10" => fracRPostExc_uid143_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid143_fpAddTest_q <= oneFracRPostExc2_uid140_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid143_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid148_fpAddTest(BITJOIN,147)@2
    R_uid148_fpAddTest_q <= signRPostExc_uid139_fpAddTest_q & expRPostExc_uid147_fpAddTest_q & fracRPostExc_uid143_fpAddTest_q;

    -- xOut(GPOUT,4)@2
    q <= R_uid148_fpAddTest_q;

END normal;
