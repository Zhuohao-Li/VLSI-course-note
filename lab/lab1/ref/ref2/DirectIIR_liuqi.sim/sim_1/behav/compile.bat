@echo off
set xv_path=E:\\Vivado_2017.2\\Vivado\\2017.2\\bin
echo "xvlog -m64 --relax -prj IIRDirect_vlg_tst_vlog.prj"
call %xv_path%/xvlog  -m64 --relax -prj IIRDirect_vlg_tst_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
echo "xvhdl -m64 --relax -prj IIRDirect_vlg_tst_vhdl.prj"
call %xv_path%/xvhdl  -m64 --relax -prj IIRDirect_vlg_tst_vhdl.prj -log xvhdl.log
call type xvhdl.log >> compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
