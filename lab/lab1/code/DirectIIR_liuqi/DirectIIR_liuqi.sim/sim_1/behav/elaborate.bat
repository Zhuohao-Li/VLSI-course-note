@echo off
set xv_path=E:\\Vivado_2017.2\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 8925e0309f1b4c60b2de217b1db3a70c -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0_7 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot IIRDirect_vlg_tst_behav xil_defaultlib.IIRDirect_vlg_tst xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
