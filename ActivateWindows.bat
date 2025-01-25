@echo off
title Windows License Management Script

:actionmenu
echo ========================================
echo Choose an operation:
echo 1. Activate Windows
echo 2. Unactivate Windows
echo 3. Reactivate Windows / Change Windows Version.
echo 4. Check Activation Expiration Date
echo ========================================
set /p choice=Enter choice (1-4): 

if "%choice%"=="1" goto chooseversion
if "%choice%"=="2" goto unactivate
if "%choice%"=="3" goto chooseversion
if "%choice%"=="4" goto checkexpiration

echo Invalid selection, please try again.
goto actionmenu

:chooseversion
echo ========================================
echo Please choose your Windows version:
echo 1. Home
echo 2. Home N
echo 3. Home Single Language
echo 4. Home Country Specific
echo 5. Professional
echo 6. Professional N
echo 7. Education
echo 8. Education N
echo 9. Enterprise
echo 10. Enterprise N
echo Windows Enterprise are reccommended. N version are not reccomended since they don't have multimedia service. Of course, you can download it back.
echo ========================================
set /p version=Enter number (1-10): 

set key=

if "%version%"=="1" set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
if "%version%"=="2" set key=3KHY7-WNT83-DGQKR-F7HPR-844BM
if "%version%"=="3" set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
if "%version%"=="4" set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
if "%version%"=="5" set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
if "%version%"=="6" set key=MH37W-N47XK-V7XM9-C7227-GCQG9
if "%version%"=="7" set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
if "%version%"=="8" set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
if "%version%"=="9" set key=NPPR9-FWDCX-D2C8J-H872K-2YT43
if "%version%"=="10" set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4

if "%key%"=="" (
    echo Invalid selection, please try again.
    goto chooseversion
)

if "%choice%"=="1" goto activate
if "%choice%"=="3" goto reactivate

:activate
echo Activating Windows. Stay online and wait.
slmgr /ipk %key%
slmgr /skms kms8.msguides.com
slmgr /ato
goto actionmenu

:unactivate
echo Unactivating Windows...
slmgr /upk
goto actionmenu

:reactivate
echo Reactivating Windows...
slmgr /ipk %key%
slmgr /skms kms8.msguides.com
slmgr /ato
goto actionmenu

:checkexpiration
echo Checking the license expiration date...
slmgr /xpr
pause
goto actionmenu

exit
