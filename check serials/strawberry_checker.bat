@echo off
goto check_Permissions

:check_Permissions

    
    net session >nul 2>&1
    if %errorLevel% == 0 (
	goto run
    ) else (
	color 4
        echo Failure: RUN AS ADMIN!
    )
    
    pause >nul

:run


:reload

cls
@echo off
title "Serial Checker by |strawberry|:)
color 4
echo ***********
echo * CHECKER *
echo ***********
color 6
echo Bios
wmic bios get serialnumber
color 5
ECHO CPU 
wmic cpu get serialnumber
color 7
ECHO Baseboard/Motherboard
wmic baseboard get serialnumber
color 2
wmic logicaldisk get volumeserialnumber
color 6
wmic csproduct get uuid
getmac
echo.
echo  [1] Reload  [2] Winmgmt  [3] Exit  

choice /C:123 /N
set _erl=%errorlevel%
if %_erl%==1 goto reload
if %_erl%==2 goto winmgmt
if %_erl%==3 exit /b


:winmgmt 
cls
net stop winmgmt /y

goto reload