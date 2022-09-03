@echo off
color 04
Title BrainBread Utility
cd %~dp0

:testing_cleanup
if exist "temp" rmdir /q /s "temp"
if exist "SteamCMD" rmdir /q /s "SteamCMD"
if exist "Half-Life" rmdir /q /s "Half-Life"

echo Checking for updates...
rem powershell -Command "Start-BitsTransfer -Source "https://github.com/Mythical-Github/BrainBread-Utility/releases/download/vStatic/BrainBread_Utility.bat"
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
rem cls

rem empty variables
set scmd_exist=""
set hl_exist=""
set bb_exist=""

rem download link list
set steamcmd_link="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set brainbread_1.2_zip="https://github.com/Mythical-Github/brainbread/releases/download/v1.0/brainbread-main.zip"

:utility_setup_check
if not %scmd_exist% == "true" goto is_steamcmd_installed
if not %hl_exist% == "true" goto is_half-life_installed
if not %bb_exist% == "true" goto is_brainbread_installed

rem Check Disk Space Before Installing Anything
rem Tell Them Aprroximate Space To Be Taken Up Before Installing

:main_menu
rem cls
echo.
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                           Choose options by typing in the corresponding number                              #
echo  	#                                                                                                             #
echo  	#        1)   Launch BrainBread                                                                               #
echo  	#                                                                                                             #           
echo  	#        2)   Install BrainBread (BrainBread, Fixes, Mods, etc...)                                            #
echo  	#                                                                                                             #
echo  	#        3)   Uninstall All BreadBread Content                                                                #
echo 	#                                                                                                             #
echo 	#        4)   Exit                                                                                            #
echo 	#                                                                                                             #
echo 	###############################################################################################################
echo.

choice /n /c 1234 > NUL
if %ERRORLEVEL%==1 goto start_brainbread
if %ERRORLEVEL%==2 goto install_brainbread
if %ERRORLEVEL%==3 goto uninstall_brainbread
if %ERRORLEVEL%==4 goto exit

:start_brainbread
copy "Half-Life\brainbread\cl_dlls\client.dll" "Half-Life\brainbread\cl_dlls\client.dll.bak"
del /q "Half-Life\brainbread\cl_dlls\client.dll"
set hl_exe="Half-Life\hl.exe"
%hl_exe% -game brainbread
copy "Half-Life\brainbread\cl_dlls\client.dll.bak" "Half-Life\brainbread\cl_dlls\client.dll"
del /q "Half-Life\brainbread\cl_dlls\client.dll.bak"
goto exit

:is_steamcmd_installed
if exist "SteamCMD/steamcmd.exe" set scmd_exist="true"
if %scmd_exist% = "true" goto utility_setup_check
if %scmd_exist% == "false" goto install_steamcmd

:is_half-life_installed
if exist "Half-Life/hl.exe" set hl_exist="true"
if %hl_exist% =="true" goto utility_setup_check
if %hl_exist% =="false" goto install_half-life

:is_brainbread_installed
if exist "Half-Life/brainbread/brainbread.wad" set bb_exist="true"
if %bb_exist% =="true" goto utility_setup_check
if %bb_exist% =="false" goto install_brainbread

:install_steamcmd
if not exist "temp" mkdir "temp"
cd "temp"
if not exist "..\SteamCMD" mkdir "..\SteamCMD"
powershell -Command "Start-BitsTransfer -Source "%steamcmd_link%""
powershell -Command "Expand-Archive -Force -LiteralPath steamcmd.zip"
xcopy /q /s /e /y "steamcmd" "..\SteamCMD"
cd ..
goto is_steamcmd_installed

:install_half-life
rem cls
set /p user="What is your steam username?":
set /p pass="What is your steam password?":
call "SteamCMD/steamcmd.exe" +login "%user%" "%pass%" +force_install_dir "../Half-Life" +app_update 70 verify +exit
goto is_half-life_installed

:install_brainbread
if not exist "temp" mkdir "temp"
cd "temp"
powershell -Command "Start-BitsTransfer -Source "%brainbread_1.2_zip%"
goto is_brainbread_installed

:uninstall_brainbread
rem cls
echo Are you sure you want to uninstall all brainbread related content?
echo This will uninstall everything in the brainbread folder in your currently set half-life install
echo as well as everything in the folder the bat file is ran from!
echo
cd %half-life_install%
if exist "brainbread" del /s /q "brainbread"

:credits






























rem credits list
people who made brainbread
steamcmd
Zpin for brainbreadsteamicon fix
to do: options for installing and launch mod tools

exit /b











