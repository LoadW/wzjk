::����վ���� sh�ű�ִ���� --- by lovefc
::����ʱ�䣺2017/08/2
::github:https://github.com/lovefc/wzjk
@echo off
color 1f
title ��վ�����ű�ִ���� --by lovefc
::mode con cols=90 lines=30
call:is_num
echo ��ʼִ������ %jk_time%�� ���һ��
set sh_file=%~dp0sh\restart.sh
set wz_list=%~dp0wz.list
call:win_is_64

if "%BITS%"=="true"  (
set curl_path=%~dp0exe\64\curl.exe
) else (
set curl_path=%~dp0exe\32\curl.exe
)

start "" %~dp0exe\puttyAlertStopper.exe

call:wzjt %wz_list% %jk_time%
:wzjt
setlocal enabledelayedexpansion  
set /a v=0  
for /f "delims=" %%i in (%1) do (
set /a v+=1
call:jt %%i
)
setlocal disabledelayedexpansion
ping /n %2 127.1>nul
echo -----------------------------������ʼ-----------------------------
call:wzjt %1 %2
)
gito:eof
:jt
set "wzurl=%1" 
set "wzurl=%wzurl: =%"
set str="0"
%curl_path% -sL -w "%%{http_code}" %wzurl% -o nul>check.txt
setlocal enabledelayedexpansion 
set /p str=<check.txt
if "!str!"=="200" (
call:get_ip %wzurl%
echo %wzurl% ��%date% %time:~0,5%  �������� !wzip!
if NOT EXIST %~dp0info\!wzip!.txt (
echo open>%~dp0info\!wzip!.txt
)
) else (
echo %wzurl% ��%date% %time:~0,5% �޷���������
call:get_ip %wzurl%
if EXIST %~dp0info\!wzip!.txt (
echo %wzurl% �ű�ִ���С�������
echo SSH��Ϣ:%~dp0info\!wzip!.txt
call:pyrun %~dp0info\!wzip!.txt %sh_file% 0>nul 1>nul 2>nul
)
)
del check.txt /q  0>nul 1>nul 2>nul
setlocal disabledelayedexpansion
goto:eof
:pyrun
setlocal enabledelayedexpansion  
set /a v=0  
for /f "delims=" %%i in (%1) do (
set /a v+=1

if "!v!"=="1" (
set Server=%%i
)
if "!v!"=="2" (
set Port=%%i
)
if "!v!"=="3" (
set UserName=%%i
)
if "!v!"=="4" (
set UserPass=%%i
)
if "!v!"=="5" (
set sh_file=%%i
)
)
setlocal disabledelayedexpansion
set "Server=%Server%" 
set "Server=%Server: =%"
set "Port=%Port%" 
set "Port=%Port: =%"
set "UserName=%UserName%" 
set "UserName=%UserName: =%"
set "UserPass=%UserPass%" 
set "UserPass=%UserPass: =%"
%~dp0exe\putty.exe -pw %UserPass% -P %Port% -m %2 %UserName%@%Server%
gito:eof

:win_is_64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
  set BITS=true
) else (
  set BITS=false
)
goto:eof 
:is_num
set /p jk_time=   ��������ʱ�� ��λ��:
if %jk_time% gtr 0x3FFFFFFF (
echo  ���ʱ�� ���������֡���
call:is_num
)
goto:eof
:get_ip
ping %1 -4 -n 1 |find /i "ping">%1.txt
for /f "tokens=2 delims=[]" %%b in (%1.txt) do set wzip=%%b
del /f /q %1.txt
goto:eof

