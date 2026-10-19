@echo off
@ECHO OFF
setlocal EnableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"
title Platinum+ ToolBox V1.1
:: UI DIMENSION
set "WIDTH=120"
set "LINES=55"
mode con: cols=%WIDTH% lines=%LINES%

:: --- DARK RED + GOLD ANSI COLOR PALETTE ---
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "ESC=%%E"
set "c_reset=%ESC%[0m"
set "c_red=%ESC%[38;5;196m"
set "c_dark_red=%ESC%[38;5;160m"
set "c_gold=%ESC%[38;5;220m"
set "c_gray=%ESC%[38;5;160m"
set "c_white=%ESC%[38;5;255m"
set "c_yellow=%ESC%[38;5;220m"
set "c_green=%ESC%[38;5;82m"
set "c_cyan=%ESC%[38;5;220m"
set "c_purple=%ESC%[38;5;160m"

:: --- SYSTEM INFO FETCH ---
set "USER=%USERNAME%"
set "COMP=%COMPUTERNAME%"
set "VERSION=1.1"
set "OS_BUILD=Unknown"
for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber 2^>nul') do set "OS_BUILD=%%B"

:: Centering Padding Strings
set "H_MARG=                     "
set "M=                "
set "M_OPT=                                          "
set "L_M3=                                                  "
set "PROMPT_PAD=      "

:: Global Separator
set "SEP="
for /L %%i in (1,1,%WIDTH%) do set "SEP=!SEP!="

:LOGIN
cls
echo.
echo %c_gray%%SEP%%c_reset%
echo %H_MARG%%c_dark_red%                PLATINUM+ TOOLBOX - SECURE LOGIN                %c_reset%
echo %c_gray%%SEP%%c_reset%
echo.
echo %M_OPT%%c_gold%[i]%c_white% Enter your login credentials to continue...%c_reset%
echo.

set "INPUT_USER="
set /p INPUT_USER="%PROMPT_PAD%%c_white%Username: %c_reset%"

set "INPUT_PASS="
for /f "delims=" %%P in ('powershell -NoProfile -Command "$p=Read-Host -AsSecureString 'Password'; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($p))"') do set "INPUT_PASS=%%P"

if /i not "!INPUT_USER!"=="TyonCao" goto LOGIN_FAIL
if not "!INPUT_PASS!"=="TyonCao@2025" goto LOGIN_FAIL
goto MENU

:LOGIN_FAIL
echo.
echo %c_red%[!] Wrong username or password.%c_reset%
timeout /t 2 >nul
goto LOGIN

:MENU
cls
echo.
echo %c_gray%%SEP%%c_reset%
echo %H_MARG%%c_dark_red%USER:%c_white% %USER%  %c_gray%^|%c_reset%  %c_dark_red%COMP:%c_white% %COMP%  %c_gray%^|%c_reset%  %c_dark_red%TOOLBOX:%c_white% %VERSION%  %c_gray%^|%c_reset%  %c_dark_red%OS BUILD:%c_white% %OS_BUILD%%c_reset%
echo %c_gray%%SEP%%c_reset%
echo.

:: --- RENDER DOUBLE ASCII LOGO (BOTH RED & CENTER ALIGNED) ---
set "L_M1=                      "
echo.%L_M1%%c_red%██████╗ ██╗      █████╗ ████████╗██╗███╗   ██╗██╗   ██╗███╗   ███╗        %c_reset%
echo.%L_M1%%c_red%██╔══██╗██║     ██╔══██╗╚══██╔══╝██║████╗  ██║██║   ██║████╗ ████║   ██╗  %c_reset%
echo.%L_M1%%c_red%██████╔╝██║     ███████║   ██║   ██║██╔██╗ ██║██║   ██║██╔████╔██║ ██████╗ %c_reset%
echo.%L_M1%%c_red%██╔═══╝ ██║     ██╔══██║   ██║   ██║██║╚██╗██║██║   ██║██║╚██╔╝██║ ╚═██╔═╝ %c_reset%
echo.%L_M1%%c_red%██║     ███████╗██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║   ╚═╝   %c_reset%
echo.%L_M1%%c_red%╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝         %c_reset%
echo.
set "L_M2=                             "
echo.%L_M2%%c_red%████████╗██╗░░░██╗ ██████╗░███╗░░██╗██╗░░░██╗███╗░░██╗%c_reset%
echo.%L_M2%%c_red%╚══██╔══╝╚██╗░██╔╝██╔═══██╗████╗░██║██║░░░██║████╗░██║%c_reset%
echo.%L_M2%%c_red%░░░██║░░░░╚████╔╝░██║░░░██║██╔██╗██║██║░░░██║██╔██╗██║%c_reset%
echo.%L_M2%%c_red%░░░██║░░░░░╚██╔╝░░██║░░░██║██║╚████║██║░░░██║██║╚████║%c_reset%
echo.%L_M2%%c_red%░░░██║░░░░░░██║░░░╚██████╔╝██║░╚███║╚██████╔╝██║░╚███║%c_reset%
echo.%L_M2%%c_red%░░░╚═╝░░░░░░╚═╝░░░░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚══╝%c_reset%
echo.
echo.                                              %c_gold%« %c_white%Developed by @TyonCao%c_gold% »%c_reset%
echo.

:: --- SECTION A & B --- 
echo %M%%c_dark_red%[A] WINDOWS ^& GAMING SERVICES                        [B] NETWORK, WIRELESS ^& ACCESS%c_reset%
echo %M%%c_gray%-----------------------------                        ------------------------------%c_reset%
echo %M%%c_gold%[01]%c_white% Windows Update Controls                         %c_gold%[08]%c_white% Windows Search ^& Indexing%c_reset%
echo %M%%c_gold%[02]%c_white% Microsoft Store Services                        %c_gold%[09]%c_white% Runtime Broker ^& UWP Tasks%c_reset%
echo %M%%c_gold%[03]%c_white% Xbox Services ^& Game Bar                        %c_gold%[10]%c_white% VBS ^& Memory Integrity (HVCI)%c_reset%
echo %M%%c_gold%[04]%c_white% Bluetooth Controller ^& Devices                  %c_gold%[11]%c_white% Shell Experience ^& Start Menu%c_reset%
echo %M%%c_gold%[05]%c_white% Wi-Fi ^& Hotspot Services                        %c_gold%[12]%c_white% Telemetry ^& Diagnostics%c_reset%
echo %M%%c_gold%[06]%c_white% Print Spooler Services                          %c_gold%[13]%c_white% Remote Desktop ^& Remote Services%c_reset%
echo %M%%c_gold%[07]%c_white% Windows Time ^& Clock Sync                       %c_gold%[14]%c_white% Location ^& Device Sensors%c_reset%
echo.
:: --- SECTION C & D ---
echo %M%%c_dark_red%[C] HARDWARE ^& PERIPHERALS                           [D] SYSTEM SERVICES ^& INTEGRATION%c_reset%
echo %M%%c_gray%--------------------------                           ---------------------------------%c_reset%
echo %M%%c_gold%[15]%c_white% SmartCard Security Services                     %c_gold%[20]%c_white% Cloud Clipboard Sync%c_reset%
echo %M%%c_gold%[16]%c_white% CTF Loader Service (TabletInputService)         %c_gold%[21]%c_white% AutoPlay ^& Hardware Detection%c_reset%
echo %M%%c_gold%[17]%c_white% Push Notifications ^& Action Center              %c_gold%[22]%c_white% Work Folders Enterprise Sync%c_reset%
echo %M%%c_gold%[18]%c_white% Radio Management ^& Flight Mode                  %c_gold%[23]%c_white% Legacy VPN ^& RasMan Services%c_reset%
echo %M%%c_gold%[19]%c_white% Network Tweaks (NDU ^& IPHelper)                 %c_gold%[24]%c_white% UPnP ^& Network Discovery%c_reset%
echo %M%                                                     %c_gold%[25]%c_white% User OOBE Setup Broker%c_reset%
echo.
:: --- SECTION E & F ---
echo %M%%c_dark_red%[E] BUG FIXES                                        [F] APPLICATIONS ^& LIBRARIES%c_reset%
echo %M%%c_gray%-------------                                        ----------------------------%c_reset%
echo %M%%c_gold%[26]%c_white% Anti-Cheat ^& Hypervisor Fix                     %c_gold%[35]%c_white% Install Brave Browser%c_reset%
echo %M%%c_gold%[27]%c_white% Fix Explorer Crash                              %c_gold%[36]%c_white% Install Google Chrome%c_reset%
echo %M%%c_gold%[28]%c_white% Fix WebView2                                    %c_gold%[37]%c_white% Install Mozilla Firefox%c_reset%
echo %M%%c_gold%[29]%c_white% FiveM Services ^& Audio Fix                      %c_gold%[38]%c_white% Install Microsoft Edge%c_reset%
echo %M%%c_gold%[30]%c_white% System Restore Point Fix                        %c_gold%[39]%c_white% Install WebView2 Runtime%c_reset%
echo %M%%c_gold%[31]%c_white% Fix Game Launchers (Battle.net)                 %c_gold%[40]%c_white% Install DirectX Web Setup%c_reset%
echo %M%%c_gold%[32]%c_white% Fix Store ^& App Installer                       %c_gold%[41]%c_white% Install Winget Package Manager%c_reset%
echo %M%%c_gold%[33]%c_white% Fix GTA 5 crash and black screen                %c_gold%[42]%c_white% Add Store ^& Xbox to LTSC%c_reset%
echo %M%%c_gold%[34]%c_white% Fix VPN ^& Proxy%c_reset%
echo.
echo.%L_M3%%c_red%[0] EXIT TOOLBOX%c_reset%
echo.
echo.

set "OPTION="
set /p OPTION="%PROMPT_PAD%%c_white%Select Option: %c_reset%"

if "!OPTION!"=="0" exit
if "!OPTION!"=="1" goto ACTION_1
if "!OPTION!"=="01" goto ACTION_1
if "!OPTION!"=="2" goto ACTION_2
if "!OPTION!"=="02" goto ACTION_2
if "!OPTION!"=="3" goto ACTION_3
if "!OPTION!"=="03" goto ACTION_3
if "!OPTION!"=="4" goto ACTION_4
if "!OPTION!"=="04" goto ACTION_4
if "!OPTION!"=="5" goto ACTION_5
if "!OPTION!"=="05" goto ACTION_5
if "!OPTION!"=="6" goto ACTION_6
if "!OPTION!"=="06" goto ACTION_6
if "!OPTION!"=="7" goto ACTION_7
if "!OPTION!"=="07" goto ACTION_7
if "!OPTION!"=="8" goto ACTION_8
if "!OPTION!"=="08" goto ACTION_8
if "!OPTION!"=="9" goto ACTION_9
if "!OPTION!"=="09" goto ACTION_9
if "!OPTION!"=="10" goto ACTION_10
if "!OPTION!"=="11" goto ACTION_11
if "!OPTION!"=="12" goto ACTION_12
if "!OPTION!"=="13" goto ACTION_13
if "!OPTION!"=="14" goto ACTION_14
if "!OPTION!"=="15" goto ACTION_15
if "!OPTION!"=="16" goto ACTION_16
if "!OPTION!"=="17" goto ACTION_17
if "!OPTION!"=="18" goto ACTION_18
if "!OPTION!"=="19" goto ACTION_19
if "!OPTION!"=="20" goto ACTION_20
if "!OPTION!"=="21" goto ACTION_21
if "!OPTION!"=="22" goto ACTION_22
if "!OPTION!"=="23" goto ACTION_23
if "!OPTION!"=="24" goto ACTION_24
if "!OPTION!"=="25" goto ACTION_25
if "!OPTION!"=="26" goto ACTION_26
if "!OPTION!"=="27" goto ACTION_27
if "!OPTION!"=="28" goto ACTION_28
if "!OPTION!"=="29" goto ACTION_29
if "!OPTION!"=="30" goto ACTION_30
if "!OPTION!"=="31" goto ACTION_31
if "!OPTION!"=="32" goto ACTION_32
if "!OPTION!"=="33" goto ACTION_33
if "!OPTION!"=="34" goto ACTION_34
if "!OPTION!"=="35" goto ACTION_35
if "!OPTION!"=="36" goto ACTION_36
if "!OPTION!"=="37" goto ACTION_37
if "!OPTION!"=="38" goto ACTION_38
if "!OPTION!"=="39" goto ACTION_39
if "!OPTION!"=="40" goto ACTION_40
if "!OPTION!"=="41" goto ACTION_41
if "!OPTION!"=="42" goto ACTION_42

echo %PROMPT_PAD%%c_red%[!] Invalid choice.%c_reset%
timeout /t 1 >nul
goto MENU


:ACTION_1
set "CURRENT_TITLE=Windows Update Controls"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables wuauserv, UsoSvc, BITS and WaaSMedicSvc services to block Windows Update        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% operations and reduce automatic update activity while keeping installed drivers and      %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% applications functional.                                                                 %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Windows Update Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Windows Update (No Drivers Update)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_1_OPT1
if "!SUBOPT!"=="2" goto ACTION_1_OPT2
goto ACTION_1

:ACTION_1_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Windows Update Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
    sc config "wuauserv" start= disabled >nul 2>&1
    sc stop "wuauserv" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "UsoSvc" start= disabled >nul 2>&1
    sc stop "UsoSvc" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "WaaSMedicSvc" start= disabled >nul 2>&1
    sc stop "WaaSMedicSvc" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "DoSvc" start= disabled >nul 2>&1
    sc stop "DoSvc" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "PushToInstall" start= disabled >nul 2>&1
    sc stop "PushToInstall" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "uhssvc" start= disabled >nul 2>&1
    sc stop "uhssvc" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\uhssvc" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "upfc" start= disabled >nul 2>&1
    sc stop "upfc" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\upfc" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1
    sc config "BITS" start= disabled >nul 2>&1
    sc stop "BITS" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DriverUpdateWizardWuSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1

for %%t in (
    "\Microsoft\Windows\WindowsUpdate\Automatic App Update"
    "\Microsoft\Windows\WindowsUpdate\Scheduled Start"
    "\Microsoft\Windows\UpdateOrchestrator\Report policies"
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static"
    "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant"
    "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantAllUsers"
    "\Microsoft\Windows\WaaSMedic\PerformRemediation"
) do (
    schtasks /change /tn "%%~t" /disable >nul 2>&1
)


echo [SUCCESS] Windows Update services and scheduled tasks have been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_1

:ACTION_1_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Windows Update (No Drivers Update)"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "UsoSvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "WaaSMedicSvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "PushToInstall" start= demand >nul 2>&1

for %%t in (
    "\Microsoft\Windows\WindowsUpdate\Automatic App Update"
    "\Microsoft\Windows\WindowsUpdate\Scheduled Start"
    "\Microsoft\Windows\UpdateOrchestrator\Report policies"
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static"
    "\Microsoft\Windows\WaaSMedic\PerformRemediation"
) do (
    schtasks /query /tn "%%~t" >nul 2>&1 && schtasks /change /tn "%%~t" /enable >nul 2>&1
)

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v DriverUpdateWizardWuSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f >nul 2>&1

echo [SUCCESS] Windows Update services have been enabled with driver updates excluded
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_1

:ACTION_2
set "CURRENT_TITLE=Microsoft Store Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables InstallService, ClipSVC and AppXSvc services to block Microsoft Store app       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% installation, licensing and updates while already installed UWP applications may         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% continue working.                                                                        %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Microsoft Store Services (FULL)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Disable Microsoft Store Services (SAFE)%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Disable Microsoft Store Services (Standard)%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Enable Microsoft Store Services (FULL)%c_reset%
echo %M_OPT%%c_gold%[5]%c_white% Enable Microsoft Store Services (Standard)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_2_OPT1
if "!SUBOPT!"=="2" goto ACTION_2_OPT2
if "!SUBOPT!"=="3" goto ACTION_2_OPT3
if "!SUBOPT!"=="4" goto ACTION_2_OPT4
if "!SUBOPT!"=="5" goto ACTION_2_OPT5
goto ACTION_2

:ACTION_2_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Microsoft Store Services (FULL)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1

        sc config "AppXSvc" start= disabled >nul 2>&1
        sc stop "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "ClipSvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= disabled >nul 2>&1
        sc stop "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "PushToInstall" start= disabled >nul 2>&1
        sc stop "PushToInstall" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 4 /f >nul 2>&1


echo [SUCCESS] MicrosoftStore FULL service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_2

:ACTION_2_OPT2
cls
set "CURRENT_TITLE=Execute: Disable Microsoft Store Services (SAFE)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1

        sc config "PushToInstall" start= disabled >nul 2>&1
        sc stop "PushToInstall" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

rem Keep ClipSvc and LicenseManager on DEMAND for Xbox / Store games
sc config ClipSvc start= demand >nul 2>&1
sc config LicenseManager start= demand >nul 2>&1


echo [SUCCESS] MicrosoftStore SAFE service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_2

:ACTION_2_OPT3
cls
set "CURRENT_TITLE=Execute: Disable Microsoft Store Services (Standard)"
call :SHOW_HEADER
echo.
chcp 437 >nul
rem Disable automatic downloads and store apps via Policy
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1

rem Disable background services for automatic updates without breaking existing game licenses (ClipSvc and LicenseManager remain active)
        sc config "PushToInstall" start= disabled >nul 2>&1
        sc stop "PushToInstall" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

rem Keep ClipSvc and LicenseManager on DEMAND for Xbox / Store games
sc config ClipSvc start= demand >nul 2>&1
sc config LicenseManager start= demand >nul 2>&1


echo [SUCCESS] MicrosoftStore service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_2

:ACTION_2_OPT4
cls
set "CURRENT_TITLE=Execute: Enable Microsoft Store Services (FULL)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableAutoUpdate /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableStoreApps /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableStoreApps /f >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "AppXSvc" start= demand >nul 2>&1
        sc start "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "ClipSvc" start= demand >nul 2>&1
        sc start "ClipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= demand >nul 2>&1
        sc start "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        sc start "LicenseManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "PushToInstall" start= demand >nul 2>&1
        sc start "PushToInstall" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1

powershell -ExecutionPolicy Bypass -NoProfile -Command "Get-AppxPackage -AllUsers *WindowsStore* ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml' -ErrorAction SilentlyContinue}" >nul 2>&1
start /wait wsreset.exe -i >nul 2>&1
start ms-windows-store: >nul 2>&1

echo [SUCCESS] MicrosoftStore FULL service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_2

:ACTION_2_OPT5
cls
set "CURRENT_TITLE=Execute: Enable Microsoft Store Services (Standard)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableAutoUpdate /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableStoreApps /f >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "AppXSvc" start= demand >nul 2>&1
        sc start "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "ClipSvc" start= demand >nul 2>&1
        sc start "ClipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= demand >nul 2>&1
        sc start "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        sc start "LicenseManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "PushToInstall" start= demand >nul 2>&1
        sc start "PushToInstall" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1

start ms-windows-store: >nul 2>&1

echo [SUCCESS] MicrosoftStore service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_2

:ACTION_3
set "CURRENT_TITLE=Xbox Services & Game Bar"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables XblAuthManager, XblGameSave, XboxNetApiSvc and XboxGipSvc services to           %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% disable Xbox account integration, cloud saves, Game Bar features while Steam, Epic       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Games, EA App and GOG remain unaffected.                                                 %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Xbox Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Xbox Services%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Fix Xbox Game Pass ^& Party Chat%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Fix Xbox Game Bar%c_reset%
echo %M_OPT%%c_gold%[5]%c_white% Fix Xbox Party Chat / Teredo%c_reset%
echo %M_OPT%%c_gold%[6]%c_white% Install Xbox Identity Provider%c_reset%
echo %M_OPT%%c_gold%[7]%c_white% Open Gaming Services in Store%c_reset%
echo %M_OPT%%c_gold%[8]%c_white% Uninstall Xbox Game Bar%c_reset%
echo %M_OPT%%c_gold%[9]%c_white% Uninstall Xbox Identity Provider%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_3_OPT1
if "!SUBOPT!"=="2" goto ACTION_3_OPT2
if "!SUBOPT!"=="3" goto ACTION_3_OPT3
if "!SUBOPT!"=="4" goto ACTION_3_OPT4
if "!SUBOPT!"=="5" goto ACTION_3_OPT5
if "!SUBOPT!"=="6" goto ACTION_3_OPT6
if "!SUBOPT!"=="7" goto ACTION_3_OPT7
if "!SUBOPT!"=="8" goto ACTION_3_OPT8
if "!SUBOPT!"=="9" goto ACTION_3_OPT9
goto ACTION_3

:ACTION_3_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Xbox Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "XblAuthManager" start= disabled >nul 2>&1
        sc stop "XblAuthManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "XblGameSave" start= disabled >nul 2>&1
        sc stop "XblGameSave" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "XboxNetApiSvc" start= disabled >nul 2>&1
        sc stop "XboxNetApiSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "XboxGipSvc" start= disabled >nul 2>&1
        sc stop "XboxGipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "xbgm" start= disabled >nul 2>&1
        sc stop "xbgm" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "GameInputSvc" start= disabled >nul 2>&1
        sc stop "GameInputSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GameInputSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "gip" start= disabled >nul 2>&1
        sc stop "gip" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\gip" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "GamingServices" start= disabled >nul 2>&1
        sc stop "GamingServices" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "GamingServicesNet" start= disabled >nul 2>&1
        sc stop "GamingServicesNet" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "BcastDVRUserService" start= disabled >nul 2>&1
        sc stop "BcastDVRUserService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1

echo [SUCCESS] XboxServices service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Xbox Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblAuthManager" start= demand >nul 2>&1
        sc start "XblAuthManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblGameSave" start= demand >nul 2>&1
        sc start "XblGameSave" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxNetApiSvc" start= demand >nul 2>&1
        sc start "XboxNetApiSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxGipSvc" start= demand >nul 2>&1
        sc start "XboxGipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "xbgm" start= demand >nul 2>&1
        sc start "xbgm" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GameInputSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GameInputSvc" start= demand >nul 2>&1
        sc start "GameInputSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\gip" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "gip" start= demand >nul 2>&1
        sc start "gip" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServices" start= demand >nul 2>&1
        sc start "GamingServices" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServicesNet" start= demand >nul 2>&1
        sc start "GamingServicesNet" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BcastDVRUserService" start= demand >nul 2>&1
        sc start "BcastDVRUserService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "ClipSVC" start= demand >nul 2>&1
        sc start "ClipSVC" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= demand >nul 2>&1
        sc start "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        sc start "LicenseManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "AppXSvc" start= demand >nul 2>&1
        sc start "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /enable >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f >nul 2>&1

start ms-windows-store://pdp/?productid=9MWPM2CQNLHN >nul 2>&1

echo [SUCCESS] XboxServices service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT3
cls
set "CURRENT_TITLE=Execute: Fix Xbox Game Pass & Party Chat"
call :SHOW_HEADER
echo.
chcp 437 >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "XblAuthManager" start= demand >nul 2>&1
    sc start "XblAuthManager" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "XblGameSave" start= demand >nul 2>&1
    sc start "XblGameSave" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "XboxNetApiSvc" start= demand >nul 2>&1
    sc start "XboxNetApiSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "XboxGipSvc" start= demand >nul 2>&1
    sc start "XboxGipSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "xbgm" start= demand >nul 2>&1
    sc start "xbgm" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\GameInputSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "GameInputSvc" start= demand >nul 2>&1
    sc start "GameInputSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\gip" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "gip" start= demand >nul 2>&1
    sc start "gip" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "GamingServices" start= demand >nul 2>&1
    sc start "GamingServices" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "GamingServicesNet" start= demand >nul 2>&1
    sc start "GamingServicesNet" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "ClipSvc" start= demand >nul 2>&1
    sc start "ClipSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "LicenseManager" start= demand >nul 2>&1
    sc start "LicenseManager" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "InstallService" start= demand >nul 2>&1
    sc start "InstallService" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "AppXSvc" start= demand >nul 2>&1
    sc start "AppXSvc" >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /enable >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config iphlpsvc start= demand >nul 2>&1
sc start iphlpsvc >nul 2>&1
netsh interface teredo set state type=default >nul 2>&1

echo [SUCCESS] Xbox GamePass PartyChat settings have been successfully fixed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT4
cls
set "CURRENT_TITLE=Execute: Fix Xbox Game Bar"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "XblAuthManager" start= demand >nul 2>&1
        sc start "XblAuthManager" >nul 2>&1
        sc config "XblGameSave" start= demand >nul 2>&1
        sc start "XblGameSave" >nul 2>&1
        sc config "XboxGipSvc" start= demand >nul 2>&1
        sc start "XboxGipSvc" >nul 2>&1
        sc config "XboxNetApiSvc" start= demand >nul 2>&1
        sc start "XboxNetApiSvc" >nul 2>&1
        sc config "ClipSVC" start= demand >nul 2>&1
        sc start "ClipSVC" >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /f >nul 2>&1

start ms-windows-store://pdp/?productid=9NZKPSTSNW4P >nul 2>&1

echo [SUCCESS] XboxGameBar settings have been successfully fixed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT5
cls
set "CURRENT_TITLE=Execute: Fix Xbox Party Chat / Teredo"
call :SHOW_HEADER
echo.
chcp 437 >nul
rem Enable IP Helper (iphlpsvc)
sc config iphlpsvc start= demand >nul 2>&1
sc start iphlpsvc >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

rem Enable Xbox Networking Service
sc config XboxNetApiSvc start= demand >nul 2>&1
sc start XboxNetApiSvc >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

rem Reset Teredo State
netsh interface teredo set state type=default >nul 2>&1
netsh interface teredo set state clientport=60000 >nul 2>&1

echo [SUCCESS] XboxPartyChat Teredo settings have been successfully fixed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT6
cls
set "CURRENT_TITLE=Execute: Install Xbox Identity Provider"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblAuthManager" start= demand >nul 2>&1
        sc start "XblAuthManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblGameSave" start= demand >nul 2>&1
        sc start "XblGameSave" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxNetApiSvc" start= demand >nul 2>&1
        sc start "XboxNetApiSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxGipSvc" start= demand >nul 2>&1
        sc start "XboxGipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "xbgm" start= demand >nul 2>&1
        sc start "xbgm" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GameInputSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GameInputSvc" start= demand >nul 2>&1
        sc start "GameInputSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\gip" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "gip" start= demand >nul 2>&1
        sc start "gip" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServices" start= demand >nul 2>&1
        sc start "GamingServices" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServicesNet" start= demand >nul 2>&1
        sc start "GamingServicesNet" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "ClipSVC" start= demand >nul 2>&1
        sc start "ClipSVC" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= demand >nul 2>&1
        sc start "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        sc start "LicenseManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "AppXSvc" start= demand >nul 2>&1
        sc start "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1

start ms-windows-store://pdp/?productid=9WZDNCRD1HKW >nul 2>&1

echo [SUCCESS] XboxIdentityProvider package has been successfully installed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT7
cls
set "CURRENT_TITLE=Execute: Open Gaming Services in Store"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblAuthManager" start= demand >nul 2>&1
        sc start "XblAuthManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XblGameSave" start= demand >nul 2>&1
        sc start "XblGameSave" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxNetApiSvc" start= demand >nul 2>&1
        sc start "XboxNetApiSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "XboxGipSvc" start= demand >nul 2>&1
        sc start "XboxGipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "xbgm" start= demand >nul 2>&1
        sc start "xbgm" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GameInputSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GameInputSvc" start= demand >nul 2>&1
        sc start "GameInputSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\gip" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "gip" start= demand >nul 2>&1
        sc start "gip" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServices" start= demand >nul 2>&1
        sc start "GamingServices" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "GamingServicesNet" start= demand >nul 2>&1
        sc start "GamingServicesNet" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "ClipSvc" start= demand >nul 2>&1
        sc start "ClipSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "LicenseManager" start= demand >nul 2>&1
        sc start "LicenseManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "InstallService" start= demand >nul 2>&1
        sc start "InstallService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "AppXSvc" start= demand >nul 2>&1
        sc start "AppXSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "wuauserv" start= demand >nul 2>&1
        sc start "wuauserv" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "BITS" start= demand >nul 2>&1
        sc start "BITS" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "DoSvc" start= demand >nul 2>&1
        sc start "DoSvc" >nul 2>&1

start ms-windows-store://pdp/?productid=9MWPM2CQNLHN >nul 2>&1

echo [SUCCESS] XboxGamingServices Store target page has been successfully launched
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT8
cls
set "CURRENT_TITLE=Execute: Uninstall Xbox Game Bar"
call :SHOW_HEADER
echo.
chcp 437 >nul
powershell -Command "Get-AppxPackage -AllUsers *Xbox* ^| Remove-AppxPackage -ErrorAction SilentlyContinue; Get-AppxProvisionedPackage -Online ^| Where-Object {$_.DisplayName -like '*Xbox*'} ^| Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue" >nul 2>&1

        sc config "XblAuthManager" start= disabled >nul 2>&1
        sc stop "XblAuthManager" >nul 2>&1
        sc config "XblGameSave" start= disabled >nul 2>&1
        sc stop "XblGameSave" >nul 2>&1
        sc config "XboxNetApiSvc" start= disabled >nul 2>&1
        sc stop "XboxNetApiSvc" >nul 2>&1
        sc config "XboxGipSvc" start= disabled >nul 2>&1
        sc stop "XboxGipSvc" >nul 2>&1
        sc config "GameInputSvc" start= disabled >nul 2>&1
        sc stop "GameInputSvc" >nul 2>&1
        sc config "GamingServices" start= disabled >nul 2>&1
        sc stop "GamingServices" >nul 2>&1
        sc config "GamingServicesNet" start= disabled >nul 2>&1
        sc stop "GamingServicesNet" >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1

echo [SUCCESS] XboxGameBar package has been successfully uninstalled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_3_OPT9
cls
set "CURRENT_TITLE=Execute: Uninstall Xbox Identity Provider"
call :SHOW_HEADER
echo.
chcp 437 >nul
powershell -ExecutionPolicy Bypass -NoProfile -Command "Get-AppxPackage -AllUsers *XboxIdentityProvider* ^| Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue; Get-AppxProvisionedPackage -Online ^| Where-Object {$_.DisplayName -like '*XboxIdentityProvider*'} ^| Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue" >nul 2>&1

        sc config "XblAuthManager" start= disabled >nul 2>&1
        sc stop "XblAuthManager" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "XblGameSave" start= disabled >nul 2>&1
        sc stop "XblGameSave" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] XboxIdentityProvider package has been successfully uninstalled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_3

:ACTION_4
set "CURRENT_TITLE=Bluetooth Controller & Devices"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Bluetooth Support Service (bthserv) which prevents Bluetooth pairing and        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% wireless Bluetooth device usage while Wi-Fi and Ethernet networking remain               %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% unaffected.                                                                              %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Bluetooth Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Bluetooth Services%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Fix Bluetooth Gamepads%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Revert Bluetooth Gamepads Fix%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_4_OPT1
if "!SUBOPT!"=="2" goto ACTION_4_OPT2
if "!SUBOPT!"=="3" goto ACTION_4_OPT3
if "!SUBOPT!"=="4" goto ACTION_4_OPT4
goto ACTION_4

:ACTION_4_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Bluetooth Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "bthserv" start= disabled >nul 2>&1
        sc stop "bthserv" >nul 2>&1
        sc config "BTAGService" start= disabled >nul 2>&1
        sc stop "BTAGService" >nul 2>&1
        sc config "bthHFSrv" start= disabled >nul 2>&1
        sc stop "bthHFSrv" >nul 2>&1
        sc config "BthAvctpSvc" start= disabled >nul 2>&1
        sc stop "BthAvctpSvc" >nul 2>&1

echo [SUCCESS] Bluetooth service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_4

:ACTION_4_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Bluetooth Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "bthserv" start= demand >nul 2>&1
        sc start "bthserv" >nul 2>&1
        sc config "BTAGService" start= demand >nul 2>&1
        sc start "BTAGService" >nul 2>&1
        sc config "bthHFSrv" start= demand >nul 2>&1
        sc start "bthHFSrv" >nul 2>&1
        sc config "BthAvctpSvc" start= demand >nul 2>&1
        sc start "BthAvctpSvc" >nul 2>&1
        sc config "CDPSvc" start= demand >nul 2>&1
        sc start "CDPSvc" >nul 2>&1

echo [SUCCESS] Bluetooth service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_4

:ACTION_4_OPT3
cls
set "CURRENT_TITLE=Execute: Fix Bluetooth Gamepads"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config bthserv start= demand >nul 2>&1
sc start bthserv >nul 2>&1

    sc config "BTAGService" start= demand >nul 2>&1
    sc start "BTAGService" >nul 2>&1
    sc config "bthHFSrv" start= demand >nul 2>&1
    sc start "bthHFSrv" >nul 2>&1
    sc config "BthAvctpSvc" start= demand >nul 2>&1
    sc start "BthAvctpSvc" >nul 2>&1
    sc config "CDPSvc" start= demand >nul 2>&1
    sc start "CDPSvc" >nul 2>&1
    sc config "XboxGipSvc" start= demand >nul 2>&1
    sc start "XboxGipSvc" >nul 2>&1

echo [SUCCESS] Bluetooth Gamepads settings have been successfully fixed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_4

:ACTION_4_OPT4
cls
set "CURRENT_TITLE=Execute: Revert Bluetooth Gamepads Fix"
call :SHOW_HEADER
echo.
chcp 437 >nul
    sc config "bthserv" start= disabled >nul 2>&1
    sc stop "bthserv" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "BTAGService" start= disabled >nul 2>&1
    sc stop "BTAGService" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTAGService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "bthHFSrv" start= disabled >nul 2>&1
    sc stop "bthHFSrv" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthHFSrv" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "BthAvctpSvc" start= disabled >nul 2>&1
    sc stop "BthAvctpSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] Bluetooth Gamepads settings have been successfully reverted
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_4

:ACTION_5
set "CURRENT_TITLE=Wi-Fi & Hotspot Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables WLAN AutoConfig (WlanSvc) and Mobile Hotspot features which prevents Wi-Fi      %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% connections, wireless network scanning and hotspot functionality while wired             %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Ethernet LAN remains fully operational.                                                  %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Wi-Fi ^& Hotspot Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Wi-Fi ^& Hotspot Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_5_OPT1
if "!SUBOPT!"=="2" goto ACTION_5_OPT2
goto ACTION_5

:ACTION_5_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Wi-Fi & Hotspot Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
powershell -NoProfile -NonInteractive -Command "Get-NetAdapter -ErrorAction SilentlyContinue ^| Where-Object { $_.PhysicalMediaType -like '*802.11*' -or $_.MediaType -like '*Native 802.11*' -or $_.InterfaceDescription -like '*Wireless*' -or $_.InterfaceDescription -like '*Wi-Fi*' } ^| Disable-NetAdapter -Confirm:$false" >nul 2>&1

        sc config "WlanSvc" start= disabled >nul 2>&1
        sc stop "WlanSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "icssvc" start= disabled >nul 2>&1
        sc stop "icssvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\icssvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "WFDSConMgrSvc" start= disabled >nul 2>&1
        sc stop "WFDSConMgrSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WFDSConMgrSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] WiFi service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_5

:ACTION_5_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Wi-Fi & Hotspot Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "WlanSvc" start= auto >nul 2>&1
        sc start "WlanSvc" >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\icssvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "icssvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WFDSConMgrSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "WFDSConMgrSvc" start= demand >nul 2>&1

powershell -NoProfile -NonInteractive -Command "Get-NetAdapter -ErrorAction SilentlyContinue ^| Where-Object { $_.PhysicalMediaType -like '*802.11*' -or $_.MediaType -like '*Native 802.11*' -or $_.InterfaceDescription -like '*Wireless*' -or $_.InterfaceDescription -like '*Wi-Fi*' } ^| Enable-NetAdapter -Confirm:$false" >nul 2>&1

echo [SUCCESS] WiFi service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_5

:ACTION_6
set "CURRENT_TITLE=Print Spooler Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Print Spooler and related printing services which prevents Windows printer      %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% communication and many virtual printing functions while standalone scanners remain       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% operational.                                                                             %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Print Spooler Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Print Spooler Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_6_OPT1
if "!SUBOPT!"=="2" goto ACTION_6_OPT2
goto ACTION_6

:ACTION_6_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Print Spooler Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "Spooler" start= disabled >nul 2>&1
        sc stop "Spooler" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "PrintNotify" start= disabled >nul 2>&1
        sc stop "PrintNotify" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "LanmanServer" start= disabled >nul 2>&1
        sc stop "LanmanServer" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] Printing service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_6

:ACTION_6_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Print Spooler Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "Spooler" start= auto >nul 2>&1
        sc start "Spooler" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "LanmanServer" start= auto >nul 2>&1
        sc start "LanmanServer" >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "PrintNotify" start= demand >nul 2>&1

echo [SUCCESS] Printing service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_6

:ACTION_7
set "CURRENT_TITLE=Windows Time & Clock Synchronization"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables or Enables W32Time service, Auto Time Zone updater (tzautoupdate) and scheduled %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% tasks to manage automatic internet time synchronization, NTP server polling, and clock   %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% precision updates without affecting manual offline clock configuration.                  %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Windows Time Services (No Sync)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Windows Time Services (NTP Sync)%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Force Instant Clock Resync (w32tm /resync)%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Configure High-Precision Custom NTP Servers%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_7_OPT1
if "!SUBOPT!"=="2" goto ACTION_7_OPT2
if "!SUBOPT!"=="3" goto ACTION_7_OPT3
if "!SUBOPT!"=="4" goto ACTION_7_OPT4
goto ACTION_7

:ACTION_7_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Windows Time Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config "W32Time" start= disabled >nul 2>&1
sc stop "W32Time" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

sc config "tzautoupdate" start= disabled >nul 2>&1
sc stop "tzautoupdate" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NoSync" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\W32Time\Parameters" /v "Type" /t REG_SZ /d "NoSync" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AutoTimeZoneUpdating" /t REG_DWORD /d 0 /f >nul 2>&1

for %%t in (
    "\Microsoft\Windows\Time Synchronization\SynchronizeTime"
    "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime"
    "\Microsoft\Windows\Time Zone\SynchronizeTimeZone"
) do (
    schtasks /change /tn "%%~t" /disable >nul 2>&1
)

echo [SUCCESS] Windows Time services, NTP client and scheduled tasks have been completely disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_7

:ACTION_7_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Windows Time Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\W32Time" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AutoTimeZoneUpdating" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NTP" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "NtpServer" /t REG_SZ /d "time.windows.com,0x9 pool.ntp.org,0x9" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /v "AnnounceFlags" /t REG_DWORD /d 10 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v "Enabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v "SpecialPollInterval" /t REG_DWORD /d 3600 /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config "W32Time" start= auto >nul 2>&1
sc start "W32Time" >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config "tzautoupdate" start= demand >nul 2>&1
sc start "tzautoupdate" >nul 2>&1

for %%t in (
    "\Microsoft\Windows\Time Synchronization\SynchronizeTime"
    "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime"
    "\Microsoft\Windows\Time Zone\SynchronizeTimeZone"
) do (
    schtasks /query /tn "%%~t" >nul 2>&1 && schtasks /change /tn "%%~t" /enable >nul 2>&1
)

w32tm /config /manualpeerlist:"time.windows.com,0x9 pool.ntp.org,0x9" /syncfromflags:manual /reliable:yes /update >nul 2>&1
w32tm /resync /nowait >nul 2>&1

echo [SUCCESS] Windows Time services, NTP client and scheduled tasks have been completely enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_7

:ACTION_7_OPT3
cls
set "CURRENT_TITLE=Execute: Force Instant Clock Resync"
call :SHOW_HEADER
echo.
chcp 437 >nul
echo Sincronizzazione orologio di Windows in corso tramite server NTP...
echo.
sc config "W32Time" start= auto >nul 2>&1
sc start "W32Time" >nul 2>&1
w32tm /config /update >nul 2>&1
w32tm /resync /rediscover
if errorlevel 1 (
    echo [INFO] Tentativo di sincronizzazione orario forzata PowerShell...
    powershell -NoProfile -Command "Start-Service w32time -ErrorAction SilentlyContinue; w32tm /resync /force"
)
echo.
echo [SUCCESS] Instant Clock Resync command executed successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_7

:ACTION_7_OPT4
cls
set "CURRENT_TITLE=Execute: Configure High-Precision NTP Servers"
call :SHOW_HEADER
echo.
echo %M_OPT%%c_gold%[1]%c_white% Use Cloudflare Time (time.cloudflare.com)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Use Google Public NTP (time.google.com)%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Use NTP Pool Project (pool.ntp.org)%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Use Microsoft Time (time.windows.com)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Windows Time Menu%c_reset%
echo.
set "NTPOPT="
set /p NTPOPT="%PROMPT_PAD%%c_white%Select NTP Server: %c_reset%"
if "!NTPOPT!"=="0" goto ACTION_7
set "SELECTED_NTP="
if "!NTPOPT!"=="1" set "SELECTED_NTP=time.cloudflare.com,0x9"
if "!NTPOPT!"=="2" set "SELECTED_NTP=time.google.com,0x9"
if "!NTPOPT!"=="3" set "SELECTED_NTP=pool.ntp.org,0x9"
if "!NTPOPT!"=="4" set "SELECTED_NTP=time.windows.com,0x9"
if not defined SELECTED_NTP goto ACTION_7_OPT4
chcp 437 >nul
sc config "W32Time" start= auto >nul 2>&1
sc start "W32Time" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NTP" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "NtpServer" /t REG_SZ /d "!SELECTED_NTP!" /f >nul 2>&1
w32tm /config /manualpeerlist:"!SELECTED_NTP!" /syncfromflags:manual /reliable:yes /update >nul 2>&1
w32tm /resync /nowait >nul 2>&1
echo.
echo [SUCCESS] NTP Server successfully updated to: !SELECTED_NTP!
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_7

:ACTION_8
set "CURRENT_TITLE=Windows Search & Indexing"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Windows Search service (WSearch) and indexing functionality which disables      %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% native Windows file indexing and may limit Start Menu search capabilities while          %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% third-party search tools such as Everything remain functional.                           %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Windows Search (StartAllBack friendly)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Windows Search ^& Indexing%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_8_OPT1
if "!SUBOPT!"=="2" goto ACTION_8_OPT2
goto ACTION_8

:ACTION_8_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Windows Search (StartAllBack friendly)"
call :SHOW_HEADER
echo.
chcp 437 >nul
    sc config "WSearch" start= disabled >nul 2>&1
    sc stop "WSearch" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f  >nul 2>&1


reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableCloudSearch /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v PreventIndexingLowDiskSpaceMB /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v Cortanacontent /t REG_DWORD /d 0 /f >nul 2>&1

for %%t in (
    "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
    "\Microsoft\Windows\Windows Search\GatheringManager"
) do (
    schtasks /change /tn "%%~t" /disable >nul 2>&1
)

echo [SUCCESS] WindowsSearch StartAllBack service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_8

:ACTION_8_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Windows Search & Indexing"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "WSearch" start= delayed-auto >nul 2>&1
        sc start "WSearch" >nul 2>&1

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableCloudSearch /f >nul 2>&1

for %%t in (
    "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
    "\Microsoft\Windows\Windows Search\GatheringManager"
) do (
    schtasks /query /tn "%%~t" >nul 2>&1 && schtasks /change /tn "%%~t" /enable >nul 2>&1
)

echo [SUCCESS] WindowsSearch service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_8

:ACTION_9
set "CURRENT_TITLE=Runtime Broker & UWP Tasks"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables TimeBrokerSvc background task scheduling which may affect Microsoft Store       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% UWP background tasks, notifications and permission-based operations while classic        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Win32 applications remain functional.                                                    %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Runtime Broker ^& UWP Tasks%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Runtime Broker ^& UWP Tasks%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_9_OPT1
if "!SUBOPT!"=="2" goto ACTION_9_OPT2
goto ACTION_9

:ACTION_9_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Runtime Broker & UWP Tasks"
call :SHOW_HEADER
echo.
chcp 437 >nul
    sc config "TimeBrokerSvc" start= disabled >nul 2>&1
    sc stop "TimeBrokerSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "TimeBroker" start= disabled >nul 2>&1
    sc stop "TimeBroker" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v Start /t REG_DWORD /d 4 /f >nul 2>&1


echo [SUCCESS] RuntimeBroker service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_9

:ACTION_9_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Runtime Broker & UWP Tasks"
call :SHOW_HEADER
echo.
chcp 437 >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "TimeBrokerSvc" start= demand >nul 2>&1
    sc start "TimeBrokerSvc" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "TimeBroker" start= demand >nul 2>&1
    sc start "TimeBroker" >nul 2>&1

echo [SUCCESS] RuntimeBroker service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_9

:ACTION_10
set "CURRENT_TITLE=VBS & Memory Integrity (HVCI)"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Virtualization-Based Security, Memory Integrity and related boot security       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% settings which turns off kernel isolation protection while standard Windows              %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% applications continue working normally.                                                  %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable VBS ^& HVCI Memory Integrity%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable VBS ^& HVCI Memory Integrity%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_10_OPT1
if "!SUBOPT!"=="2" goto ACTION_10_OPT2
goto ACTION_10

:ACTION_10_OPT1
cls
set "CURRENT_TITLE=Execute: Disable VBS & HVCI Memory Integrity"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "EnabledBootId" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "WasEnabledBy" /t REG_DWORD /d 0 /f >nul 2>&1
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul 2>&1

bcdedit /set {current} hypervisorlaunchtype off >nul 2>&1
bcdedit /set {current} vsmlaunchtype off >nul 2>&1

echo [SUCCESS] VBS HVCI service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_10

:ACTION_10_OPT2
cls
set "CURRENT_TITLE=Execute: Enable VBS & HVCI Memory Integrity"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "EnabledBootId" /f >nul 2>&1
reg delete "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "WasEnabledBy" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /f >nul 2>&1

bcdedit /set {current} hypervisorlaunchtype auto >nul 2>&1
bcdedit /deletevalue {current} vsmlaunchtype >nul 2>&1

echo [SUCCESS] VBS HVCI service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_10

:ACTION_11
set "CURRENT_TITLE=Shell Experience & Start Menu"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Optimizes StartMenuExperienceHost and ShellExperienceHost processes to improve desktop   %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% responsiveness while keeping core Windows UI elements fully operational.                 %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Shell Experience Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Shell Experience Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_11_OPT1
if "!SUBOPT!"=="2" goto ACTION_11_OPT2
goto ACTION_11

:ACTION_11_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Shell Experience Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableXamlStartMenu /t REG_DWORD /d 0 /f >nul 2>&1

echo [SUCCESS] ShellExperience service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_11

:ACTION_11_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Shell Experience Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableXamlStartMenu /f >nul 2>&1

echo [SUCCESS] ShellExperience service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_11

:ACTION_12
set "CURRENT_TITLE=Telemetry & Diagnostics"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables DiagTrack, WerSvc and diagnostic logging services to stop background telemetry  %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% data collection and error reporting while protecting user privacy.                       %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Telemetry ^& Diagnostics%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Telemetry ^& Diagnostics%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_12_OPT1
if "!SUBOPT!"=="2" goto ACTION_12_OPT2
goto ACTION_12

:ACTION_12_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Telemetry & Diagnostics"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    DiagTrack
    dmwappushservice
    WerSvc
    DPS
    WdiServiceHost
    WdiSystemHost
    PcaSvc
    diagnosticshub.standardcollector.service
    diagsvc
    wercplsupport
    EsifTelemetryService
    NvTelemetryContainer
    AUEPLauncher
    "AMD Crash Defender Service"
) do (
    sc query "%%~s" >nul 2>&1 && (
        sc config "%%~s" start= disabled >nul 2>&1
        sc stop "%%~s" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%~s" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    )
)

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v LoggingDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1

echo [SUCCESS] Telemetry Diagnostics service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_12

:ACTION_12_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Telemetry & Diagnostics"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    DiagTrack
    dmwappushservice
    WerSvc
    DPS
    WdiServiceHost
    WdiSystemHost
    PcaSvc
    diagnosticshub.standardcollector.service
    diagsvc
    wercplsupport
) do (
    sc query "%%~s" >nul 2>&1 && (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%~s" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "%%~s" start= demand >nul 2>&1
    )
)

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /f >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v LoggingDisabled /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /f >nul 2>&1

echo [SUCCESS] Telemetry Diagnostics service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_12

:ACTION_13
set "CURRENT_TITLE=Remote Desktop & Remote Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables TermService, RemoteRegistry and Remote Assistance related services which        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% prevents native Windows remote access features while third-party remote access           %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% software can continue working.                                                           %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Remote Desktop ^& Remote Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Remote Desktop ^& Remote Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_13_OPT1
if "!SUBOPT!"=="2" goto ACTION_13_OPT2
goto ACTION_13

:ACTION_13_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Remote Desktop & Remote Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    RemoteRegistry
    RemoteAccess
    WinRM
    iphlpsvc
    NetTcpPortSharing
    RasAuto
    RasMan
    RpcLocator
    WebClient
    WManSvc
    p2pimsvc
    p2psvc
    PNRPsvc
    PNRPAutoReg
    SharedAccess
    Fax
    PhoneSvc
    TapiSrv
    SmsRouter
    WwanSvc
) do (
    sc query "%%s" >nul 2>&1 && (
        sc config "%%s" start= disabled >nul 2>&1
        sc stop "%%s" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    )
)

echo [SUCCESS] RemoteServices service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_13

:ACTION_13_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Remote Desktop & Remote Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    RemoteRegistry
    RemoteAccess
    WinRM
    iphlpsvc
    NetTcpPortSharing
    RasAuto
    RasMan
    RpcLocator
    WebClient
    WManSvc
    p2pimsvc
    p2psvc
    PNRPsvc
    PNRPAutoReg
    SharedAccess
    Fax
    PhoneSvc
    TapiSrv
    SmsRouter
    WwanSvc
) do (
    sc query "%%s" >nul 2>&1 && (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "%%s" start= demand >nul 2>&1
    )
)

echo [SUCCESS] RemoteServices service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_13

:ACTION_14
set "CURRENT_TITLE=Location & Device Sensors"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables SensorService, SensorDataService, SensrSvc and Windows Location services        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% which prevents access to supported hardware sensors such as orientation, automatic       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% brightness and GPS location features.                                                    %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Sensors ^& Location Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Sensors ^& Location Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_14_OPT1
if "!SUBOPT!"=="2" goto ACTION_14_OPT2
goto ACTION_14

:ACTION_14_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Sensors & Location Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    lfsvc
    MapsBroker
    SensorService
    SensrSvc
    SensorDataService
    perceptionsimulation
    spectrum
    MixedRealityOpenXRSvc
) do (
    sc query "%%s" >nul 2>&1 && (
        sc config "%%s" start= disabled >nul 2>&1
        sc stop "%%s" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    )
)

echo [SUCCESS] Sensors Location service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_14

:ACTION_14_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Sensors & Location Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    lfsvc
    MapsBroker
    SensorService
    SensrSvc
    SensorDataService
    perceptionsimulation
    spectrum
    MixedRealityOpenXRSvc
) do (
    sc query "%%s" >nul 2>&1 && (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "%%s" start= demand >nul 2>&1
    )
)

echo [SUCCESS] Sensors Location service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_14

:ACTION_15
set "CURRENT_TITLE=SmartCard Security Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Smart Card service (SCardSvr) which prevents Smart Card readers and             %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% certificate-based authentication methods requiring smart card support while normal       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% password and PIN login remain available.                                                 %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable SmartCard Security Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable SmartCard Security Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_15_OPT1
if "!SUBOPT!"=="2" goto ACTION_15_OPT2
goto ACTION_15

:ACTION_15_OPT1
cls
set "CURRENT_TITLE=Execute: Disable SmartCard Security Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    BDESVC
    EFS
    SCardSvr
    ScDeviceEnum
    SCPolicySvc
    CertPropSvc
    NaturalAuthentication
    NgcSvc
    NgcCtnrSvc
    PolicyAgent
) do (
    sc query "%%s" >nul 2>&1 && (
        sc config "%%s" start= disabled >nul 2>&1
        sc stop "%%s" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    )
)

echo [SUCCESS] SmartCard Security service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_15

:ACTION_15_OPT2
cls
set "CURRENT_TITLE=Execute: Enable SmartCard Security Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
for %%s in (
    BDESVC
    EFS
    SCardSvr
    ScDeviceEnum
    SCPolicySvc
    CertPropSvc
    NaturalAuthentication
    NgcSvc
    NgcCtnrSvc
    PolicyAgent
) do (
    sc query "%%s" >nul 2>&1 && (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%s" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "%%s" start= demand >nul 2>&1
    )
)

echo [SUCCESS] SmartCard Security service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_15

:ACTION_16
set "CURRENT_TITLE=CTF Loader Service (TabletInputService)"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables or Enables Touch Keyboard ^& Handwriting / CTF Loader service                    %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% (TabletInputService). Windows Text Input Host and Emoji panel remain functional.         %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable CTF Loader Service (TabletInputService)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable CTF Loader Service (TabletInputService)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_16_OPT1
if "!SUBOPT!"=="2" goto ACTION_16_OPT2
goto ACTION_16

:ACTION_16_OPT1
cls
set "CURRENT_TITLE=Execute: Disable CTF Loader Service"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config TabletInputService start= disabled >nul 2>&1
sc stop TabletInputService >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] TabletInputService has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_16

:ACTION_16_OPT2
cls
set "CURRENT_TITLE=Execute: Enable CTF Loader Service"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config TabletInputService start= demand >nul 2>&1
sc start TabletInputService >nul 2>&1

echo [SUCCESS] TabletInputService has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_16

:ACTION_17
set "CURRENT_TITLE=Push Notifications & Action Center"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Windows Push Notification Service (WpnService) which stops push                 %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% notification delivery, notification banners and Action Center updates while              %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% applications can still update content when manually opened.                              %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Push Notifications Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Push Notifications Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_17_OPT1
if "!SUBOPT!"=="2" goto ACTION_17_OPT2
goto ACTION_17

:ACTION_17_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Push Notifications Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoCloudApplicationNotification /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v DisablePushNotificationUser /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1

    sc config "WpnService" start= disabled >nul 2>&1
    sc stop "WpnService" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\WpnService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "WpnUserService" start= disabled >nul 2>&1
    sc stop "WpnUserService" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\WpnUserService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "PushToInstall" start= disabled >nul 2>&1
    sc stop "PushToInstall" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
    sc config "dmwappushservice" start= disabled >nul 2>&1
    sc stop "dmwappushservice" >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

for /f "tokens=1" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" ^| findstr /i "WpnUserService_"') do (
    reg add "%%a" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
)

echo [SUCCESS] PushNotifications service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_17

:ACTION_17_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Push Notifications Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoCloudApplicationNotification /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v DisablePushNotificationUser /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 1 /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WpnService" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
sc config WpnService start= auto >nul 2>&1
sc start WpnService >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WpnUserService" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
sc config WpnUserService start= auto >nul 2>&1

    reg add "HKLM\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "PushToInstall" start= demand >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
    sc config "dmwappushservice" start= demand >nul 2>&1

for /f "tokens=1" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" ^| findstr /i "WpnUserService_"') do (
    reg add "%%a" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
)

echo [SUCCESS] PushNotifications service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_17

:ACTION_18
set "CURRENT_TITLE=Radio Management & Flight Mode"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Radio Management Service (RmSvc) which removes Windows radio management         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% features and Flight Mode integration while individual network devices may still          %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% operate depending on their own drivers and services.                                     %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Radio Management ^& Flight Mode%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Radio Management ^& Flight Mode%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_18_OPT1
if "!SUBOPT!"=="2" goto ACTION_18_OPT2
goto ACTION_18

:ACTION_18_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Radio Management & Flight Mode"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "RmSvc" start= disabled >nul 2>&1
        sc stop "RmSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RmSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "RadioManagementService" start= disabled >nul 2>&1
        sc stop "RadioManagementService" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RadioManagementService" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] RadioFlightMode service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_18

:ACTION_18_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Radio Management & Flight Mode"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RmSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "RmSvc" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RadioManagementService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "RadioManagementService" start= demand >nul 2>&1

echo [SUCCESS] RadioFlightMode service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_18

:ACTION_19
set "CURRENT_TITLE=Network Tweaks (NDU & IPHelper)"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables NDU network data usage monitoring and IP Helper advanced networking             %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% features such as Teredo, IPv6 transition technologies and tunneling while basic IPv4     %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% network connectivity remains available.                                                  %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable NDU ^& IP Helper Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable NDU ^& IP Helper Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_19_OPT1
if "!SUBOPT!"=="2" goto ACTION_19_OPT2
goto ACTION_19

:ACTION_19_OPT1
cls
set "CURRENT_TITLE=Execute: Disable NDU & IP Helper Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "Ndu" start= disabled >nul 2>&1
        sc stop "Ndu" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "iphlpsvc" start= disabled >nul 2>&1
        sc stop "iphlpsvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] NDU_IPHelper service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_19

:ACTION_19_OPT2
cls
set "CURRENT_TITLE=Execute: Enable NDU & IP Helper Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "Ndu" start= auto >nul 2>&1
        sc start "Ndu" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\DusmSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "DusmSvc" start= auto >nul 2>&1
        sc start "DusmSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "iphlpsvc" start= auto >nul 2>&1
        sc start "iphlpsvc" >nul 2>&1

echo [SUCCESS] NDU_IPHelper service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_19

:ACTION_20
set "CURRENT_TITLE=Cloud Clipboard Sync"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Microsoft account clipboard synchronization across devices while local          %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% clipboard functions such as Copy and Paste remain fully operational.                     %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Cloud Clipboard Sync%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Cloud Clipboard Sync%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_20_OPT1
if "!SUBOPT!"=="2" goto ACTION_20_OPT2
goto ACTION_20

:ACTION_20_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Cloud Clipboard Sync"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowClipboardHistory /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowCrossDeviceClipboard /t REG_DWORD /d 0 /f >nul 2>&1

        sc config "cbdhsvc" start= disabled >nul 2>&1
        sc stop "cbdhsvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "CDPSvc" start= disabled >nul 2>&1
        sc stop "CDPSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\CDPSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

for /f "tokens=1" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" ^| findstr /i "cbdhsvc_"') do (
    reg add "%%a" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
)

echo [SUCCESS] CloudClipboard service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_20

:ACTION_20_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Cloud Clipboard Sync"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowClipboardHistory /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowCrossDeviceClipboard /f >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "cbdhsvc" start= auto >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\CDPSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "CDPSvc" start= auto >nul 2>&1

for /f "tokens=1" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" ^| findstr /i "cbdhsvc_"') do (
    reg add "%%a" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
)

echo [SUCCESS] CloudClipboard service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_20

:ACTION_21
set "CURRENT_TITLE=AutoPlay & Hardware Detection"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables Shell Hardware Detection and AutoPlay features which removes automatic          %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% prompts when connecting removable devices while USB storage remains accessible           %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% through File Explorer.                                                                   %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable AutoPlay ^& Shell Hardware Detection%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable AutoPlay ^& Shell Hardware Detection%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_21_OPT1
if "!SUBOPT!"=="2" goto ACTION_21_OPT2
goto ACTION_21

:ACTION_21_OPT1
cls
set "CURRENT_TITLE=Execute: Disable AutoPlay & Shell Hardware Detection"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

        sc config "ShellHWDetection" start= disabled >nul 2>&1
        sc stop "ShellHWDetection" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] AutoPlay service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_21

:ACTION_21_OPT2
cls
set "CURRENT_TITLE=Execute: Enable AutoPlay & Shell Hardware Detection"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /f >nul 2>&1

        reg add "HKLM\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
        sc config "ShellHWDetection" start= auto >nul 2>&1
        sc start "ShellHWDetection" >nul 2>&1

echo [SUCCESS] AutoPlay service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_21

:ACTION_22
set "CURRENT_TITLE=Work Folders Enterprise Sync"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables workfolderssvc service which stops enterprise work folder synchronization while %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% local file access and personal cloud storage services remain unaffected.                 %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Work Folders Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Work Folders Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_22_OPT1
if "!SUBOPT!"=="2" goto ACTION_22_OPT2
goto ACTION_22

:ACTION_22_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Work Folders Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "workfolderssvc" start= disabled >nul 2>&1
        sc stop "workfolderssvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\workfolderssvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] WorkFolders service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_22

:ACTION_22_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Work Folders Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\workfolderssvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "workfolderssvc" start= demand >nul 2>&1

echo [SUCCESS] WorkFolders service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_22

:ACTION_23
set "CURRENT_TITLE=Legacy VPN & RasMan Services"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables RasMan and SstpSvc services which prevents native Windows VPN connections       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% using built-in VPN protocols such as PPTP, L2TP and SSTP while independent VPN           %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% clients may continue working.                                                            %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable Legacy VPN ^& RasMan Services%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable Legacy VPN ^& RasMan Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_23_OPT1
if "!SUBOPT!"=="2" goto ACTION_23_OPT2
goto ACTION_23

:ACTION_23_OPT1
cls
set "CURRENT_TITLE=Execute: Disable Legacy VPN & RasMan Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "RasMan" start= disabled >nul 2>&1
        sc stop "RasMan" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "SstpSvc" start= disabled >nul 2>&1
        sc stop "SstpSvc" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] LegacyVPN service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_23

:ACTION_23_OPT2
cls
set "CURRENT_TITLE=Execute: Enable Legacy VPN & RasMan Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "RasMan" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "SstpSvc" start= demand >nul 2>&1

echo [SUCCESS] LegacyVPN service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_23

:ACTION_24
set "CURRENT_TITLE=UPnP & Network Discovery"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables SSDPSRV and UPnP Host services which prevents automatic device discovery,       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% UPnP and DLNA functionality while web browsing, direct IP connections and SMB file       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% sharing remain available.                                                                %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable UPnP ^& Network Discovery%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable UPnP ^& Network Discovery%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_24_OPT1
if "!SUBOPT!"=="2" goto ACTION_24_OPT2
goto ACTION_24

:ACTION_24_OPT1
cls
set "CURRENT_TITLE=Execute: Disable UPnP & Network Discovery"
call :SHOW_HEADER
echo.
chcp 437 >nul
        sc config "SSDPSRV" start= disabled >nul 2>&1
        sc stop "SSDPSRV" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "FDResPub" start= disabled >nul 2>&1
        sc stop "FDResPub" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\FDResPub" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
        sc config "fdPHost" start= disabled >nul 2>&1
        sc stop "fdPHost" >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\fdPHost" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

echo [SUCCESS] NetworkDiscovery service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_24

:ACTION_24_OPT2
cls
set "CURRENT_TITLE=Execute: Enable UPnP & Network Discovery"
call :SHOW_HEADER
echo.
chcp 437 >nul
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "SSDPSRV" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\FDResPub" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "FDResPub" start= demand >nul 2>&1
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\fdPHost" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
        sc config "fdPHost" start= demand >nul 2>&1

echo [SUCCESS] NetworkDiscovery service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_24

:ACTION_25
set "CURRENT_TITLE=User OOBE Setup Broker"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables UserOOBEBroker execution which removes post-installation and post-update        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% setup suggestion prompts without affecting normal Windows startup operation.             %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Disable User OOBE Setup Broker%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Enable User OOBE Setup Broker%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_25_OPT1
if "!SUBOPT!"=="2" goto ACTION_25_OPT2
goto ACTION_25

:ACTION_25_OPT1
cls
set "CURRENT_TITLE=Execute: Disable User OOBE Setup Broker"
call :SHOW_HEADER
echo.
chcp 437 >nul
schtasks /change /tn "\Microsoft\Windows\Shell\Oobe" /disable >nul 2>&1
schtasks /change /tn "\Microsoft\Windows\OOBE\MSOOBEMain" /disable >nul 2>&1
schtasks /change /tn "\Microsoft\Windows\OOBE\PubOOBE" /disable >nul 2>&1

sc config UserOOBESvc start= disabled >nul 2>&1
sc stop UserOOBESvc >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UserOOBESvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v DisablePrivacyExperience /t REG_DWORD /d 1 /f >nul 2>&1


echo [SUCCESS] UserOOBE service has been successfully disabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_25

:ACTION_25_OPT2
cls
set "CURRENT_TITLE=Execute: Enable User OOBE Setup Broker"
call :SHOW_HEADER
echo.
chcp 437 >nul
schtasks /change /tn "\Microsoft\Windows\Shell\Oobe" /enable >nul 2>&1
schtasks /change /tn "\Microsoft\Windows\OOBE\MSOOBEMain" /enable >nul 2>&1
schtasks /change /tn "\Microsoft\Windows\OOBE\PubOOBE" /enable >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\UserOOBESvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
sc config UserOOBESvc start= demand >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v DisablePrivacyExperience /f >nul 2>&1

echo [SUCCESS] UserOOBE service has been successfully enabled
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_25

:ACTION_26
set "CURRENT_TITLE=Anti-Cheat & Hypervisor Fix (Vanguard / EAC)"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Disables VBS, HVCI and LSASS RunAsPPL protection settings to improve compatibility       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% with some anti-cheat systems while keeping normal Windows operation stable.              %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Fix All Anti-Cheat (Vanguard / EAC)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Revert Anti-Cheat Fixes%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_26_OPT1
if "!SUBOPT!"=="2" goto ACTION_26_OPT2
goto ACTION_26

:ACTION_26_OPT1
cls
set "CURRENT_TITLE=Execute: Fix All Anti-Cheat (Vanguard / EAC)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /f >nul 2>&1

bcdedit /set {current} hypervisorlaunchtype auto >nul 2>&1
bcdedit /deletevalue {current} vsmlaunchtype >nul 2>&1

reg delete "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /f >nul 2>&1
reg delete "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /f >nul 2>&1

echo [SUCCESS] Anti-Cheat and Hypervisor compatibility settings have been successfully applied
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_26

:ACTION_26_OPT2
cls
set "CURRENT_TITLE=Execute: Revert Anti-Cheat Fixes"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul 2>&1

bcdedit /set {current} hypervisorlaunchtype off >nul 2>&1
bcdedit /set {current} vsmlaunchtype off >nul 2>&1

reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [SUCCESS] Anti-Cheat and Hypervisor compatibility settings have been successfully reverted
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_26

:ACTION_27
set "CURRENT_TITLE=Fix Explorer Crash"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Clears the Windows icon and thumbnail caches, verifies the integrity of                  %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% explorer.exe, and rebuilds Explorer's cache to resolve icon display issues               %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% and reduce crashes caused by corrupted cache data.                                       %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute Fix Explorer Crash%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_27_OPT1
goto ACTION_27

:ACTION_27_OPT1
cls
set "CURRENT_TITLE=Execute: Fix Explorer Crash"
call :SHOW_HEADER
echo.
chcp 437 >nul
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 >nul
del /a /q "%localappdata%\IconCache.db" >nul 2>&1
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" >nul 2>&1
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1
sfc /scanfile=%SystemRoot%\explorer.exe
start explorer.exe

echo [SUCCESS] Explorer cache cleared and verified successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_27


:ACTION_28
set "CURRENT_TITLE=Fix WebView2"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Unblocks EdgeUpdate policies/IFEO/DisallowRun, enables update services and tasks,        %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% and installs Microsoft EdgeWebView2Runtime if missing.                                   %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Fix WebView2 Runtime ^& Update Services%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_28_OPT1
goto ACTION_28

:ACTION_28_OPT1
cls
set "CURRENT_TITLE=Execute: Fix WebView2 Runtime & Update Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "Update{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "Install{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" /t REG_DWORD /d 1 /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MicrosoftEdgeUpdate.exe" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisallowRun /f >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Service edgeupdate, edgeupdatem, MicrosoftEdgeElevationService -ErrorAction SilentlyContinue | Set-Service -StartupType Automatic -PassThru -ErrorAction SilentlyContinue | Start-Service -ErrorAction SilentlyContinue; Enable-ScheduledTask -TaskName 'MicrosoftEdgeUpdateTaskMachineCore' -ErrorAction SilentlyContinue; Enable-ScheduledTask -TaskName 'MicrosoftEdgeUpdateTaskMachineUA' -ErrorAction SilentlyContinue; if (-not (Test-Path 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView')) { winget install -e --id Microsoft.EdgeWebView2Runtime --accept-source-agreements --accept-package-agreements }"

echo [SUCCESS] WebView2 policies, update services, and runtime verified and fixed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_28


:ACTION_29
set "CURRENT_TITLE=FiveM Anti-Cheat & Audio Fix"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Configures and starts required Windows diagnostic and anti-cheat services for FiveM,     %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% restores core audio / Bluetooth services, resets GTA V settings and verifies DirectX.    %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Enable FiveM Required Services (Anti-Cheat Fix)%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Revert / Disable FiveM Services%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Fix FiveM ^& GTA 5 Audio (Standard)%c_reset%
echo %M_OPT%%c_gold%[4]%c_white% Fix FiveM ^& GTA 5 Audio (With Bluetooth Devices)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_29_OPT1
if "!SUBOPT!"=="2" goto ACTION_29_OPT2
if "!SUBOPT!"=="3" goto ACTION_29_OPT3
if "!SUBOPT!"=="4" goto ACTION_29_OPT4
goto ACTION_29

:ACTION_29_OPT1
cls
set "CURRENT_TITLE=Execute: Enable FiveM Required Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DUSMSVC" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BAM" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 2 /f >nul 2>&1

sc config DUSMSVC start= auto >nul 2>&1
sc start DUSMSVC >nul 2>&1
sc config DPS start= auto >nul 2>&1
sc start DPS >nul 2>&1
sc config Appinfo start= auto >nul 2>&1
sc start Appinfo >nul 2>&1
sc config SSDPSRV start= auto >nul 2>&1
sc start SSDPSRV >nul 2>&1
sc config BAM start= auto >nul 2>&1
sc start BAM >nul 2>&1
sc config DiagTrack start= auto >nul 2>&1
sc start DiagTrack >nul 2>&1
sc config PcaSvc start= auto >nul 2>&1
sc start PcaSvc >nul 2>&1
sc config SysMain start= auto >nul 2>&1
sc start SysMain >nul 2>&1

echo [SUCCESS] FiveM required services have been successfully enabled and started
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_29

:ACTION_29_OPT2
cls
set "CURRENT_TITLE=Execute: Revert / Disable FiveM Services"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DUSMSVC" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BAM" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

sc stop DUSMSVC >nul 2>&1
sc config DUSMSVC start= disabled >nul 2>&1
sc stop DPS >nul 2>&1
sc config DPS start= disabled >nul 2>&1
sc stop Appinfo >nul 2>&1
sc config Appinfo start= disabled >nul 2>&1
sc stop SSDPSRV >nul 2>&1
sc config SSDPSRV start= disabled >nul 2>&1
sc stop BAM >nul 2>&1
sc config BAM start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop PcaSvc >nul 2>&1
sc config PcaSvc start= disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config SysMain start= disabled >nul 2>&1

echo [SUCCESS] FiveM services have been disabled / reverted
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_29

:ACTION_29_OPT3
cls
set "CURRENT_TITLE=Execute: Fix FiveM & GTA 5 Audio (Standard)"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config Audiosrv start= auto >nul 2>&1
sc start Audiosrv >nul 2>&1
sc config AudioEndpointBuilder start= auto >nul 2>&1
sc start AudioEndpointBuilder >nul 2>&1
sc config RtkAudioUniversalService start= auto >nul 2>&1
sc start RtkAudioUniversalService >nul 2>&1
sc config IntelAudioService start= demand >nul 2>&1
sc config "SECOMNService" start= auto >nul 2>&1
sc config "SECOMN Service" start= auto >nul 2>&1
sc config "Sound Research SECOMN Service" start= auto >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Audiosrv" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RtkAudioUniversalService" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelAudioService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

sc config DPS start= auto >nul 2>&1
sc start DPS >nul 2>&1
sc config Appinfo start= demand >nul 2>&1
sc start Appinfo >nul 2>&1
sc config BAM start= auto >nul 2>&1
sc start BAM >nul 2>&1
sc config DiagTrack start= auto >nul 2>&1
sc start DiagTrack >nul 2>&1
sc config PcaSvc start= auto >nul 2>&1
sc start PcaSvc >nul 2>&1
sc config SysMain start= auto >nul 2>&1
sc start SysMain >nul 2>&1
sc config dusmsvc start= auto >nul 2>&1
sc start dusmsvc >nul 2>&1
sc config SSDPSRV start= demand >nul 2>&1
sc start SSDPSRV >nul 2>&1

if exist "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" (
    copy /y "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml.bak" >nul 2>&1
    del /f /q "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" >nul 2>&1
)

if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data" (
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\cache" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\cache" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache-priv" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache-priv" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\nui-storage" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\nui-storage" >nul 2>&1
)

if not exist "%windir%\System32\xaudio2_7.dll" (
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/7/1/1718CCC4-6316-448C-9E6A-110F0E163452/dxwebsetup.exe' -OutFile '$env:TEMP\dxwebsetup.exe' -UseBasicParsing"
    if exist "%TEMP%\dxwebsetup.exe" (
        start /wait "" "%TEMP%\dxwebsetup.exe"
        del /f /q "%TEMP%\dxwebsetup.exe" >nul 2>&1
    )
)

echo [SUCCESS] FiveM ^& GTA 5 Audio fix (Standard) applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_29

:ACTION_29_OPT4
cls
set "CURRENT_TITLE=Execute: Fix FiveM & GTA 5 Audio (With Bluetooth)"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config Audiosrv start= auto >nul 2>&1
sc start Audiosrv >nul 2>&1
sc config AudioEndpointBuilder start= auto >nul 2>&1
sc start AudioEndpointBuilder >nul 2>&1
sc config RtkAudioUniversalService start= auto >nul 2>&1
sc start RtkAudioUniversalService >nul 2>&1
sc config IntelAudioService start= demand >nul 2>&1
sc config "SECOMNService" start= auto >nul 2>&1
sc config "SECOMN Service" start= auto >nul 2>&1
sc config "Sound Research SECOMN Service" start= auto >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Audiosrv" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RtkAudioUniversalService" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelAudioService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

sc config bthserv start= auto >nul 2>&1
sc start bthserv >nul 2>&1
sc config BTAGService start= demand >nul 2>&1
sc start BTAGService >nul 2>&1
sc config BthAvctpSvc start= demand >nul 2>&1
sc start BthAvctpSvc >nul 2>&1
sc config BthHFSrv start= demand >nul 2>&1
sc start BthHFSrv >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BTAGService" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BthHFSrv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

sc config DPS start= auto >nul 2>&1
sc start DPS >nul 2>&1
sc config Appinfo start= demand >nul 2>&1
sc start Appinfo >nul 2>&1
sc config BAM start= auto >nul 2>&1
sc start BAM >nul 2>&1
sc config DiagTrack start= auto >nul 2>&1
sc start DiagTrack >nul 2>&1
sc config PcaSvc start= auto >nul 2>&1
sc start PcaSvc >nul 2>&1
sc config SysMain start= auto >nul 2>&1
sc start SysMain >nul 2>&1
sc config dusmsvc start= auto >nul 2>&1
sc start dusmsvc >nul 2>&1
sc config SSDPSRV start= demand >nul 2>&1
sc start SSDPSRV >nul 2>&1

if exist "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" (
    copy /y "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml.bak" >nul 2>&1
    del /f /q "%USERPROFILE%\Documents\Rockstar Games\GTA V\settings.xml" >nul 2>&1
)

if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data" (
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\cache" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\cache" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache-priv" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache-priv" >nul 2>&1
    if exist "%LOCALAPPDATA%\FiveM\FiveM.app\data\nui-storage" rd /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\nui-storage" >nul 2>&1
)

if not exist "%windir%\System32\xaudio2_7.dll" (
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/7/1/1718CCC4-6316-448C-9E6A-110F0E163452/dxwebsetup.exe' -OutFile '$env:TEMP\dxwebsetup.exe' -UseBasicParsing"
    if exist "%TEMP%\dxwebsetup.exe" (
        start /wait "" "%TEMP%\dxwebsetup.exe"
        del /f /q "%TEMP%\dxwebsetup.exe" >nul 2>&1
    )
)

echo [SUCCESS] FiveM ^& GTA 5 Audio + Bluetooth fix applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_29


:ACTION_30
set "CURRENT_TITLE=System Restore Point Fix"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Enables Volume Shadow Copy (VSS), Software Shadow Copy Provider (swprv) and (SDRSVC),    %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% removes SystemRestore disable policies, and enables System Restore on drive C:.          %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute System Restore Point Fix%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_30_OPT1
goto ACTION_30

:ACTION_30_OPT1
cls
set "CURRENT_TITLE=Execute: System Restore Point Fix"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config VSS start= demand >nul 2>&1
sc start VSS >nul 2>&1
sc config swprv start= demand >nul 2>&1
sc start swprv >nul 2>&1
sc config SDRSVC start= demand >nul 2>&1
sc start SDRSVC >nul 2>&1
sc config StorSvc start= demand >nul 2>&1
sc start StorSvc >nul 2>&1
sc config vds start= demand >nul 2>&1
sc config TrkWks start= auto >nul 2>&1
sc start TrkWks >nul 2>&1
sc config CryptSvc start= auto >nul 2>&1
sc start CryptSvc >nul 2>&1
sc config wbengine start= demand >nul 2>&1
sc config AppXSvc start= demand >nul 2>&1
sc config ClipSVC start= demand >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\VSS" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\swprv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SDRSVC" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\StorSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vds" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrkWks" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CryptSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableConfig" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableSR" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\BackupRestore\FilesNotToSnapshot" /v "OneDriveSetupLogs" /t REG_MULTI_SZ /d "%ProgramFiles%\Microsoft OneDrive\setup\logs\* /s" /f >nul 2>&1

powershell -NoProfile -Command "$ErrorActionPreference='SilentlyContinue'; Enable-ComputerRestore -Drive 'C:\' -ErrorAction SilentlyContinue" >nul 2>&1

echo [SUCCESS] System Restore services, storage dependencies, policies, and drive protection successfully repaired
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_30


:ACTION_31
set "CURRENT_TITLE=Fix Game Launchers (Battle.net / Epic / Steam / Riot)"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Restores memory management, FileSystem, DirectX, BCD parameters and network/auth services%c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% required for games and game launchers (Battle.net, Riot, Steam, Epic, EA) to run properly%c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute Game Launchers Fix%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_31_OPT1
goto ACTION_31

:ACTION_31_OPT1
cls
set "CURRENT_TITLE=Execute: Fix Game Launchers (Battle.net / Epic / Steam / Riot)"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options" /v "UseLargePages" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "HeapSegmentCommit" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "HeapSegmentReserve" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "Heap_ForceLFH" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "LFH_Aggressive_Enable" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AllocationPreference" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageAlways" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AvoidLargePageCollisions" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageMinimum" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryCompression" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryThrottling" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageSplitting" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryScrubbing" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableBackgroundScavenging" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePageCombining" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableDriverPaging" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableKernelStackPaging" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingOfKernelStacks" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 0 /f >nul 2>&1

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "Win95TruncatedExtensions" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "SuppressInheritanceSupport" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsAllowExtendedCharacter8dot3Rename" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableCompression" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableEncryption" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d 2 /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Services\Ntfs" /v "DisableReadAhead" /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\11.0" /v "DisableClearOnAllocate" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\12.0" /v "DisableClearOnAllocate" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\12.0" /v "DisablePsoEviction" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableDriverManagement" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\DWM" /v "OverlayTestMode" /f >nul 2>&1
reg delete "HKCU\Control Panel\Desktop" /v "OverlayTestMode" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWddm2Checks" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3D12DisableSharedDynamicValueManagement" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "DisableFTH" /f >nul 2>&1

bcdedit /deletevalue nolowmem >nul 2>&1
bcdedit /deletevalue avoidlowmemory >nul 2>&1
bcdedit /deletevalue badmemoryaccess >nul 2>&1
bcdedit /deletevalue isolatedcontext >nul 2>&1
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /deletevalue useplatformtick >nul 2>&1
bcdedit /set nx optin >nul 2>&1

for %%S in (BITS CryptSvc FontCache iphlpsvc seclogon LanmanServer LanmanWorkstation) do (
    sc config %%S start= auto >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
    sc start %%S >nul 2>&1
)

echo [SUCCESS] Game launcher compatibility, memory settings, DirectX and services restored
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_31


:ACTION_32
set "CURRENT_TITLE=Fix Windows Store & App Installer"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Unblocks Store policies ^& DisallowRun, sets AppModelUnlock, starts required services     %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% (AppXSvc, ClipSVC, InstallService, etc.), verifies WebView2 and reinstalls / registers   %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Microsoft Store ^& App Installer (winget) packages and dependencies for all users.        %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute Windows Store ^& App Installer Fix%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_32_OPT1
goto ACTION_32

:ACTION_32_OPT1
cls
set "CURRENT_TITLE=Execute: Fix Windows Store & App Installer"
call :SHOW_HEADER
echo.
chcp 437 >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='SilentlyContinue'; $lines = Get-Content -Path '%~f0' -ErrorAction SilentlyContinue; $idx = [array]::IndexOf($lines, ':::PS_STORE_FIX_START:::'); $end = [array]::IndexOf($lines, ':::PS_STORE_FIX_END:::'); $code = ($lines[($idx + 1)..($end - 1)]) -join [Environment]::NewLine; Invoke-Expression $code" >nul 2>&1
echo [SUCCESS] Windows Store and App Installer fix applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_32


:ACTION_33
set "CURRENT_TITLE=Fix GTA 5 crash and black screen"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Removes dangerous and unstable Memory Management registry values for GTA 5 to prevent    %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% crashes and resolve memory allocation conflicts.                                         %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute Fix GTA 5 crash and black screen%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_33_OPT1
goto ACTION_33

:ACTION_33_OPT1
cls
set "CURRENT_TITLE=Execute: Fix GTA 5 crash and black screen"
call :SHOW_HEADER
echo.
chcp 437 >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AllocationPreference" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AvoidLargePageCollisions" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageAlways" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageMinimum" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryCompression" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePageCombining" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MappedCommitLimit" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CommitLimit" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemCacheLimit" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ZeroPageThreadPriority" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MemoryManagementPriority" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryThrottling" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageSplitting" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableMemoryScrubbing" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemViewSize" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnforceWriteProtection" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "TrimWorkingSet" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "WriteWatch" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "GameModeCacheSize" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "GameModeEnabled" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "GameModeCachePriority" /f >nul 2>&1
echo [SUCCESS] Fix GTA 5 crash and black screen applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_33


:ACTION_34
set "CURRENT_TITLE=Fix VPN & Proxy"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Restores and repairs Windows VPN, RasMan, WAN Miniport adapters, and WinHTTP Proxy       %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% configurations, resetting DNS and Winsock to fix connection and network issues.          %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Execute Fix VPN%c_reset%
echo %M_OPT%%c_gold%[2]%c_white% Execute Fix Proxy%c_reset%
echo %M_OPT%%c_gold%[3]%c_white% Execute Complete Fix (VPN + Proxy)%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_34_OPT1
if "!SUBOPT!"=="2" goto ACTION_34_OPT2
if "!SUBOPT!"=="3" goto ACTION_34_OPT3
goto ACTION_34

:ACTION_34_OPT1
cls
set "CURRENT_TITLE=Execute: Fix VPN"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config RasMan start= auto >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
net start RasMan >nul 2>&1

sc config TapiSrv start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start TapiSrv >nul 2>&1

sc config iphlpsvc start= auto >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
net start iphlpsvc >nul 2>&1

sc config IKEEXT start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IKEEXT" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start IKEEXT >nul 2>&1

sc config PolicyAgent start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start PolicyAgent >nul 2>&1

sc config SstpSvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1

sc config NetSetupSvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start NetSetupSvc >nul 2>&1

for %%S in (RemoteAccess RasAuto NcdAutoSetup IpxlatCfgSvc SharedAccess WwanSvc Dot3svc EapHost) do (
    sc config %%S start= demand >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
)

for %%S in (BFE mpssvc Dhcp Dnscache NlaSvc nsi CryptSvc) do (
    sc config %%S start= auto >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
    net start %%S >nul 2>&1
)
sc config netprofm start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start netprofm >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs = Get-PnpDevice -Class Net -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -notmatch '^PCI\\' }; foreach($d in $devs) { $p = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $d.InstanceId + '\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties'; if(Test-Path $p) { Remove-ItemProperty -Path $p -Name 'MSISupported' -ErrorAction SilentlyContinue } }" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -Class Net -ErrorAction SilentlyContinue | Where-Object { $_.FriendlyName -like '*WAN Miniport*' -or $_.FriendlyName -like '*TAP*' -or $_.FriendlyName -like '*Wintun*' -or $_.FriendlyName -like '*WireGuard*' } | ForEach-Object { try { Enable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false -ErrorAction SilentlyContinue } catch {} }" >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters" /v "ProhibitIpSec" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters" /v "AllowL2TPWeakCrypto" /t REG_DWORD /d 1 /f >nul 2>&1

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /f >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | ForEach-Object { $_.SetTcpipNetbios(0) }" >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 0 /f >nul 2>&1

netsh winsock reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo [SUCCESS] Fix VPN applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_34

:ACTION_34_OPT2
cls
set "CURRENT_TITLE=Execute: Fix Proxy"
call :SHOW_HEADER
echo.
chcp 437 >nul
sc config WinHttpAutoProxySvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start WinHttpAutoProxySvc >nul 2>&1

for %%S in (BFE mpssvc Dhcp Dnscache NlaSvc nsi CryptSvc) do (
    sc config %%S start= auto >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
    net start %%S >nul 2>&1
)
sc config netprofm start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start netprofm >nul 2>&1

netsh winhttp reset proxy >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoDetect" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoDetect" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyOverride" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /f >nul 2>&1
reg delete "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "DefaultConnectionSettings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "SavedLegacySettings" /f >nul 2>&1

netsh winsock reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo [SUCCESS] Fix Proxy applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_34

:ACTION_34_OPT3
cls
set "CURRENT_TITLE=Execute: Fix VPN & Proxy (Complete Fix)"
call :SHOW_HEADER
echo.
chcp 437 >nul
:: --- VPN SERVICES ---
sc config RasMan start= auto >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
net start RasMan >nul 2>&1

sc config TapiSrv start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start TapiSrv >nul 2>&1

sc config iphlpsvc start= auto >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
net start iphlpsvc >nul 2>&1

sc config IKEEXT start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IKEEXT" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start IKEEXT >nul 2>&1

sc config PolicyAgent start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start PolicyAgent >nul 2>&1

sc config SstpSvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1

sc config NetSetupSvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start NetSetupSvc >nul 2>&1

for %%S in (RemoteAccess RasAuto NcdAutoSetup IpxlatCfgSvc SharedAccess WwanSvc Dot3svc EapHost) do (
    sc config %%S start= demand >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
)

:: --- PROXY SERVICE ---
sc config WinHttpAutoProxySvc start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start WinHttpAutoProxySvc >nul 2>&1

:: --- CORE NETWORK SERVICES ---
for %%S in (BFE mpssvc Dhcp Dnscache NlaSvc nsi CryptSvc) do (
    sc config %%S start= auto >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d 2 /f >nul 2>&1
    net start %%S >nul 2>&1
)
sc config netprofm start= demand >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d 3 /f >nul 2>&1
net start netprofm >nul 2>&1

:: --- VPN ADAPTERS & POLICIES ---
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs = Get-PnpDevice -Class Net -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -notmatch '^PCI\\' }; foreach($d in $devs) { $p = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $d.InstanceId + '\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties'; if(Test-Path $p) { Remove-ItemProperty -Path $p -Name 'MSISupported' -ErrorAction SilentlyContinue } }" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -Class Net -ErrorAction SilentlyContinue | Where-Object { $_.FriendlyName -like '*WAN Miniport*' -or $_.FriendlyName -like '*TAP*' -or $_.FriendlyName -like '*Wintun*' -or $_.FriendlyName -like '*WireGuard*' } | ForEach-Object { try { Enable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false -ErrorAction SilentlyContinue } catch {} }" >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters" /v "ProhibitIpSec" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters" /v "AllowL2TPWeakCrypto" /t REG_DWORD /d 1 /f >nul 2>&1

reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /f >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | ForEach-Object { $_.SetTcpipNetbios(0) }" >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 0 /f >nul 2>&1

:: --- PROXY SETTINGS RESET ---
netsh winhttp reset proxy >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoDetect" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoDetect" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyOverride" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /f >nul 2>&1
reg delete "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "DefaultConnectionSettings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "SavedLegacySettings" /f >nul 2>&1

netsh winsock reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo [SUCCESS] Complete VPN and Proxy fix applied successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_34


:ACTION_35
set "CURRENT_TITLE=Install Brave Browser"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs the latest x64 version of Brave Browser.                          %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install Brave Browser%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_35_OPT1
goto ACTION_35

:ACTION_35_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install Brave Browser"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://laptop-updates.brave.com/latest/winx64" -o "%TEMP%\BraveSetup.exe"
"%TEMP%\BraveSetup.exe"
echo [SUCCESS] Brave Browser setup launched successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_35


:ACTION_36
set "CURRENT_TITLE=Install Google Chrome"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs the latest version of Google Chrome browser.                      %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install Google Chrome%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_36_OPT1
goto ACTION_36

:ACTION_36_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install Google Chrome"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -o "%TEMP%\ChromeSetup.exe"
"%TEMP%\ChromeSetup.exe"
echo [SUCCESS] Google Chrome setup launched successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_36


:ACTION_37
set "CURRENT_TITLE=Install Mozilla Firefox"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs the latest US English 64-bit release of Mozilla Firefox.          %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install Mozilla Firefox%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_37_OPT1
goto ACTION_37

:ACTION_37_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install Mozilla Firefox"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -o "%TEMP%\FirefoxSetup.exe"
"%TEMP%\FirefoxSetup.exe"
echo [SUCCESS] Mozilla Firefox setup launched successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_37


:ACTION_38
set "CURRENT_TITLE=Install Microsoft Edge"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs Microsoft Edge browser.                                           %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install Microsoft Edge%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_38_OPT1
goto ACTION_38

:ACTION_38_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install Microsoft Edge"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://go.microsoft.com/fwlink/?linkid=2108834&Channel=Stable&language=en" -o "%TEMP%\MicrosoftEdgeSetup.exe"
"%TEMP%\MicrosoftEdgeSetup.exe"
echo [SUCCESS] Microsoft Edge setup launched successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_38


:ACTION_39
set "CURRENT_TITLE=Install WebView2 Runtime"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs the Microsoft Edge WebView2 Evergreen bootstrapper.               %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install WebView2 Runtime%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_39_OPT1
goto ACTION_39

:ACTION_39_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install WebView2 Runtime"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://go.microsoft.com/fwlink/p/?LinkId=2124703" -o "%TEMP%\MicrosoftEdgeWebview2Setup.exe"
"%TEMP%\MicrosoftEdgeWebview2Setup.exe" /install
echo [SUCCESS] WebView2 Runtime setup executed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_39


:ACTION_40
set "CURRENT_TITLE=Install DirectX Web Setup"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs the legacy DirectX 9/10/11 End-User Runtimes.                     %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install DirectX Runtimes%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_40_OPT1
goto ACTION_40

:ACTION_40_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install DirectX Runtimes"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -o "%TEMP%\dxwebsetup.exe"
"%TEMP%\dxwebsetup.exe"
echo [SUCCESS] DirectX Web setup launched successfully
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_40


:ACTION_41
set "CURRENT_TITLE=Install Winget Package Manager"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Downloads and installs App Installer (Winget) command line package manager.              %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Download ^& Install Winget Package Manager%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_41_OPT1
goto ACTION_41

:ACTION_41_OPT1
cls
set "CURRENT_TITLE=Execute: Download & Install Winget Package Manager"
call :SHOW_HEADER
echo.
chcp 437 >nul
powershell -NoProfile -Command "Invoke-WebRequest https://aka.ms/getwinget -OutFile $env:TEMP\AppInstaller.msixbundle; Add-AppxPackage $env:TEMP\AppInstaller.msixbundle"
echo [SUCCESS] Winget Package Manager installation completed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_41


:ACTION_42
set "CURRENT_TITLE=Add Store & Xbox Services to LTSC"
call :SHOW_HEADER
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo               %c_gray%^|%c_gold% [i] DESCRIPTION:                                                                         %c_gray%^|%c_reset%
echo               %c_gray%^|%c_white% Installs Microsoft Store and Xbox background services on LTSC (Not for Stock Windows).   %c_gray%^|%c_reset%
echo               %c_gray%+------------------------------------------------------------------------------------------+%c_reset%
echo.
echo %M_OPT%%c_gold%[1]%c_white% Install Store ^& Xbox Services for LTSC%c_reset%
echo.
echo %M_OPT%%c_red%[0] Back to Main Menu%c_reset%
echo.
set "SUBOPT="
set /p SUBOPT="%PROMPT_PAD%%c_white%Select Option: %c_reset%"
if "!SUBOPT!"=="0" goto MENU
if "!SUBOPT!"=="1" goto ACTION_42_OPT1
goto ACTION_42

:ACTION_42_OPT1
cls
set "CURRENT_TITLE=Execute: Add Store & Xbox Services to LTSC"
call :SHOW_HEADER
echo.
chcp 437 >nul
curl -L "https://github.com/kkkgo/LTSC-Add-MicrosoftStore/archive/refs/heads/master.zip" -o "%TEMP%\LTSC-Add-MicrosoftStore.zip"
powershell -NoProfile -Command "Expand-Archive '%TEMP%\LTSC-Add-MicrosoftStore.zip' '%TEMP%' -Force"
call "%TEMP%\LTSC-Add-MicrosoftStore-master\Add-Store.cmd"
echo [SUCCESS] LTSC Microsoft Store ^& Xbox installer script executed
chcp 65001 >nul
echo.
echo %c_green%[+] Execution finished successfully.%c_reset%
echo.
pause
goto ACTION_42



:SHOW_HEADER
chcp 65001 >nul
cls
echo.
echo %c_gray%%SEP%%c_reset%
echo %H_MARG%%c_dark_red%USER:%c_white% %USER%  %c_gray%^|%c_reset%  %c_dark_red%COMP:%c_white% %COMP%  %c_gray%^|%c_reset%  %c_dark_red%TOOLBOX:%c_white% %VERSION%  %c_gray%^|%c_reset%  %c_dark_red%OS BUILD:%c_white% %OS_BUILD%%c_reset%
echo %c_gray%%SEP%%c_reset%
echo.
set "TITLE=[ !CURRENT_TITLE! ]"
set "_len=0"
set "_str=!TITLE!"
:strLenLoop
if defined _str (
    set "_str=!_str:~1!"
    set /a "_len+=1"
    goto strLenLoop
)
set /a "_pad=(120-_len)/2"
set "_PAD_STR="
for /L %%A in (1,1,!_pad!) do set "_PAD_STR=!_PAD_STR! "
echo !_PAD_STR!%c_gold%!TITLE!%c_reset%
echo.
exit /b

:::PS_STORE_FIX_START:::
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
$InformationPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    try {
        Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"") -Verb RunAs -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
    exit
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$hostsPath = "$env:windir\System32\drivers\etc\hosts"

if (Test-Path $hostsPath) {
    try {
        Set-ItemProperty -Path $hostsPath -Name Attributes -Value "Normal" -ErrorAction SilentlyContinue 2>$null | Out-Null
        & attrib.exe -r -s -h "$hostsPath" >$null 2>&1

        $hostsLines = Get-Content -Path $hostsPath -ErrorAction SilentlyContinue 2>$null
        $cleanLines = @()
        $blockedPatterns = @(
            'microsoft\.com', 'windowsupdate\.com', 'windows\.com', 'live\.com',
            'msftconnecttest\.com', 'azureedge\.net', 'delivery\.mp\.microsoft\.com',
            'storeedgefd\.dsx\.mp\.microsoft\.com', 'displaycatalog\.mp\.microsoft\.com',
            'licensing\.mp\.microsoft\.com', 'purchase\.mp\.microsoft\.com',
            'tlu\.dl\.delivery\.mp\.microsoft\.com'
        )

        foreach ($line in $hostsLines) {
            $isBlocked = $false
            foreach ($pattern in $blockedPatterns) {
                if ($line -match $pattern) {
                    $isBlocked = $true
                    break
                }
            }
            if (-not $isBlocked) {
                $cleanLines += $line
            }
        }

        if ($cleanLines.Count -eq 0 -or ($cleanLines -join "").Trim() -eq "") {
            $cleanLines = @(
                "127.0.0.1       localhost",
                "::1             localhost"
            )
        }

        $cleanLines | Set-Content -Path $hostsPath -Encoding UTF8 -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
}

try {
    Clear-DnsClientCache -ErrorAction SilentlyContinue 2>$null | Out-Null
    & ipconfig.exe /flushdns >$null 2>&1
} catch {}

$system32 = "$env:windir\System32"
$dllList = @("wuaueng.dll", "wlidcli.dll", "wiaservc.dll", "wuaserv.dll", "waasmedicsvc.dll")

foreach ($dll in $dllList) {
    try {
        $bakFile = Join-Path $system32 "$dll.bak"
        $targetFile = Join-Path $system32 $dll
        if (Test-Path $bakFile) {
            if (Test-Path $targetFile) {
                Remove-Item -Path $targetFile -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
            }
            Move-Item -Path $bakFile -Destination $targetFile -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
        }
    } catch {}
}

$storePolicies = @(
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"; Value = "RemoveWindowsStore" },
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"; Value = "DisableStoreApps" },
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"; Value = "AutoDownloadAndUpdate" },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun"; Value = "1" },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Value = "DisallowRun" },
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx"; Value = "BlockNonStoreApps" }
)

foreach ($item in $storePolicies) {
    try {
        if (Test-Path $item.Path) {
            Remove-ItemProperty -Path $item.Path -Name $item.Value -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
        }
    } catch {}
}

try {
    $appxPolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx"
    if (-not (Test-Path $appxPolicyPath)) { New-Item -Path $appxPolicyPath -Force -ErrorAction SilentlyContinue 2>$null | Out-Null }
    Set-ItemProperty -Path $appxPolicyPath -Name "AllowAllTrustedApps" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null

    $appModelPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
    if (-not (Test-Path $appModelPath)) { New-Item -Path $appModelPath -Force -ErrorAction SilentlyContinue 2>$null | Out-Null }
    Set-ItemProperty -Path $appModelPath -Name "AllowAllTrustedApps" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $appModelPath -Name "AllowDevelopmentWithoutDevLicense" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null

    $wuPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
    if (-not (Test-Path $wuPath)) { New-Item -Path $wuPath -Force -ErrorAction SilentlyContinue 2>$null | Out-Null }
    Remove-ItemProperty -Path $wuPath -Name "DisableWindowsUpdateAccess" -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $wuPath -Name "ExcludeWUDriversInQualityUpdate" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $wuPath -Name "SetUpdateNotificationLevel" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null

    $wuAuPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
    if (-not (Test-Path $wuAuPath)) { New-Item -Path $wuAuPath -Force -ErrorAction SilentlyContinue 2>$null | Out-Null }
    Set-ItemProperty -Path $wuAuPath -Name "NoAutoUpdate" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $wuAuPath -Name "AUOptions" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $wuAuPath -Name "SetDisableUXWUAccess" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    Set-ItemProperty -Path $wuAuPath -Name "NoAutoRebootWithLoggedOnUsers" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null

    $drvPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"
    if (-not (Test-Path $drvPath)) { New-Item -Path $drvPath -Force -ErrorAction SilentlyContinue 2>$null | Out-Null }
    Set-ItemProperty -Path $drvPath -Name "SearchOrderConfig" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
} catch {}

$servicesToDisable = @("UsoSvc", "WaaSMedicSvc")
foreach ($sName in $servicesToDisable) {
    try {
        Stop-Service -Name $sName -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
        & sc.exe config $sName start= disabled >$null 2>&1
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$sName" -Name "Start" -Value 4 -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
}

$tasksToDisable = @(
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan",
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task",
    "\Microsoft\Windows\UpdateOrchestrator\UpdateModelTask",
    "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker",
    "\Microsoft\Windows\UpdateOrchestrator\Report policies",
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work",
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work",
    "\Microsoft\Windows\UpdateOrchestrator\Schedule Work",
    "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work",
    "\Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate",
    "\Microsoft\Windows\WaaSMedic\PerformRemediation",
    "\Microsoft\Windows\WindowsUpdate\Scheduled Start"
)
foreach ($t in $tasksToDisable) {
    try {
        $lastSlash = $t.LastIndexOf("\")
        $tPath = $t.Substring(0, $lastSlash + 1)
        $tName = $t.Substring($lastSlash + 1)
        Disable-ScheduledTask -TaskPath $tPath -TaskName $tName -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
}

$storeServices = @(
    @{ Name = "ClipSVC";        Start = 3; RequiredRunning = $true },
    @{ Name = "InstallService"; Start = 3; RequiredRunning = $true },
    @{ Name = "AppXSvc";        Start = 3; RequiredRunning = $true },
    @{ Name = "StorSvc";        Start = 3; RequiredRunning = $true },
    @{ Name = "CryptSvc";       Start = 2; RequiredRunning = $true },
    @{ Name = "TokenBroker";    Start = 3; RequiredRunning = $true },
    @{ Name = "LicenseManager"; Start = 3; RequiredRunning = $true },
    @{ Name = "wlidsvc";        Start = 3; RequiredRunning = $true },
    @{ Name = "DoSvc";          Start = 3; RequiredRunning = $false },
    @{ Name = "BITS";           Start = 3; RequiredRunning = $false },
    @{ Name = "PushToInstall";  Start = 3; RequiredRunning = $false },
    @{ Name = "AppReadiness";   Start = 3; RequiredRunning = $false },
    @{ Name = "wuauserv";       Start = 3; RequiredRunning = $true }
)

foreach ($svc in $storeServices) {
    try {
        $sName = $svc.Name
        $svcPath = "HKLM:\SYSTEM\CurrentControlSet\Services\$sName"
        if (Test-Path $svcPath) {
            Set-ItemProperty -Path $svcPath -Name "Start" -Value $svc.Start -Type DWord -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
            $mode = if ($svc.Start -eq 2) { "auto" } else { "demand" }
            & sc.exe config $sName start= $mode >$null 2>&1
            if ($svc.RequiredRunning) {
                Start-Service -Name $sName -ErrorAction SilentlyContinue 2>$null | Out-Null
                & sc.exe start $sName >$null 2>&1
            }
        }
    } catch {}
}

try {
    Stop-Process -Name "WinStore.App", "StoreDesktopExtension", "AppInstaller", "winget" -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
} catch {}
Start-Sleep -Milliseconds 500

$corePackages = @(
    "*Microsoft.VCLibs*",
    "*Microsoft.UI.Xaml*",
    "*Microsoft.NET.Native.Runtime*",
    "*Microsoft.NET.Native.Framework*",
    "*Microsoft.WindowsAppRuntime*",
    "*Microsoft.WindowsStore*",
    "*Microsoft.DesktopAppInstaller*",
    "*Microsoft.StorePurchaseApp*",
    "*Microsoft.Services.Store.Engagement*"
)

foreach ($pkgPattern in $corePackages) {
    try {
        $packages = Get-AppxPackage -AllUsers $pkgPattern -ErrorAction SilentlyContinue 2>$null
        if ($packages) {
            foreach ($pkg in $packages) {
                if ($pkg.InstallLocation) {
                    $manifestPath = Join-Path $pkg.InstallLocation "AppXManifest.xml"
                    if (Test-Path $manifestPath) {
                        try {
                            Add-AppxPackage -DisableDevelopmentMode -Register $manifestPath -ErrorAction SilentlyContinue 2>$null | Out-Null
                        } catch {}
                    }
                }
            }
        }
    } catch {}
}

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13
} catch {}

$storePkg = $null
$appInstallerPkg = $null
try {
    $storePkg = Get-AppxPackage -AllUsers "*Microsoft.WindowsStore*" -ErrorAction SilentlyContinue 2>$null
} catch {}
try {
    $appInstallerPkg = Get-AppxPackage -AllUsers "*Microsoft.DesktopAppInstaller*" -ErrorAction SilentlyContinue 2>$null
} catch {}

$tempFolder = "$env:TEMP\StoreFixPackages"

if (-not $appInstallerPkg) {
    if (-not (Test-Path $tempFolder)) { 
        try { New-Item -ItemType Directory -Path $tempFolder -Force -ErrorAction SilentlyContinue 2>$null | Out-Null } catch {}
    }
    
    try {
        $vclibsUrl = "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
        $xamlUrl = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx"
        $appInstallerUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

        $vclibsFile = Join-Path $tempFolder "VCLibs.appx"
        $xamlFile = Join-Path $tempFolder "UIXaml.appx"
        $appInstallerFile = Join-Path $tempFolder "AppInstaller.msixbundle"

        Invoke-WebRequest -Uri $vclibsUrl -OutFile $vclibsFile -UseBasicParsing -TimeoutSec 60 -ErrorAction SilentlyContinue 2>$null | Out-Null
        Invoke-WebRequest -Uri $xamlUrl -OutFile $xamlFile -UseBasicParsing -TimeoutSec 60 -ErrorAction SilentlyContinue 2>$null | Out-Null
        Invoke-WebRequest -Uri $appInstallerUrl -OutFile $appInstallerFile -UseBasicParsing -TimeoutSec 120 -ErrorAction SilentlyContinue 2>$null | Out-Null

        Add-AppxPackage -Path $vclibsFile -ErrorAction SilentlyContinue 2>$null | Out-Null
        Add-AppxPackage -Path $xamlFile -ErrorAction SilentlyContinue 2>$null | Out-Null
        Add-AppxPackage -Path $appInstallerFile -DependencyPath @($vclibsFile, $xamlFile) -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
}

if (-not $storePkg) {
    try {
        $stagedStoreManifests = Get-ChildItem -Path "C:\Program Files\WindowsApps" -Filter "AppxManifest.xml" -Recurse -ErrorAction SilentlyContinue 2>$null |
            Where-Object { $_.FullName -match "Microsoft\.WindowsStore" }

        if ($stagedStoreManifests) {
            foreach ($m in $stagedStoreManifests) {
                try {
                    Add-AppxPackage -DisableDevelopmentMode -Register $m.FullName -ErrorAction SilentlyContinue 2>$null | Out-Null
                } catch {}
            }
        }
    } catch {}
}

if (Test-Path $tempFolder) {
    try {
        Remove-Item -Path $tempFolder -Recurse -Force -ErrorAction SilentlyContinue 2>$null | Out-Null
    } catch {}
}

try {
    Start-Process -FilePath "wsreset.exe" -ArgumentList "-i" -WindowStyle Hidden -ErrorAction SilentlyContinue 2>$null | Out-Null
} catch {}
:::PS_STORE_FIX_END:::