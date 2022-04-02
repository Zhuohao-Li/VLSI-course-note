@echo off
set xv_path=E:\\Vivado_2017.2\\Vivado\\2017.2\\bin
call %xv_path%/xsim IIRDirect_vlg_tst_behav -key {Behavioral:sim_1:Functional:IIRDirect_vlg_tst} -tclbatch IIRDirect_vlg_tst.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
