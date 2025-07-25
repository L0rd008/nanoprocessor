# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/.Xil/Vivado-22284-L0rd/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a35tcpg236-1

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_vhdl -lib xil_defaultlib {
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/14Bit_Instruction_Decoder.vhd}
      {L:/Documents/Xilinx/Processor1/Nanoprocessor/needed components/CLOCK.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Carry_Look_Ahead.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Carry_Look_Ahead_Adder_Subtractor.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Comparator.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Comparator_Latch.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/D_FF.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Decoder_2_to_4.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Decoder_3_to_8.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/FA.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Full_Adder.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/HA.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Half_Adder.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/LUT_16_7.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/MUX_2_way_3_bit.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/MUX_2_way_4_bit.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/MUX_8_to_1.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/MUX_8_way_4_bit.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/PROM.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/ProgramCounter.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/RCA_4.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/RegisterBank.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/needed components/Register_4_bit.vhd}
      {L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/Nanoprocessor2.srcs/sources_1/new/Nanoprocessor2.vhd}
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top Nanoprocessor2
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "L:/Documents/Xilinx/Processor2/FinalNanoprocessor - Iterative Add/.Xil/Vivado-22284-L0rd/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
