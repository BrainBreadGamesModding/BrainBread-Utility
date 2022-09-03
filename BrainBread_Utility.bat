@echo off
color 0A
Title BrainBread Utility
echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "https://github.com/Mythical-Github/BrainBread-Utility/releases/download/vStatic/BrainBread_Utility.bat"
cls
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cd %~dp0
cls

:utility_setup_check
cd %~dp0
if not %hl_exist% == "true" goto is_half-life_installed
if not %bb_exist% == "true" goto is_brainbread_installed
if not %scmd_exist% == "true" goto is_steamcmd_installed

see if brainbread is installed if not see if half life is installed if not see if steamcmd is installed
check disk space and install anything missing

:main_menu
cls
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

:install_brainbread

goto is_brainbread_installed

:uninstall_brainbread
cls
echo Are you sure you want to uninstall all brainbread related content?
echo This will uninstall everything in the brainbread folder in your currently set half-life install
echo as well as everything in the folder the bat file is ran from
echo
cd %half-life_install%
if exist "brainbread" del "brainbread"


:is_brainbread_installed
if exist "Half-Life/brainbread/brainbread.wad" set bb_exist="true"
if %bb_exist% =="true" goto utility_setup_check

:is_half-life_installed
if exist "Half-Life/hl.exe" set hl_exist="true"
if %hl_exist% =="true" goto utility_setup_check

:is_steamcmd_installed
if exist "SteamCMD/steamcmd.exe" set scmd_exist="true"
if %scmd_exist% == "true" goto utility_setup_check

:install_steamcmd

goto is_steamcmd_installed

:install_half-life

goto is_half-life_installed


























rem add settings loading and creation
rem for now that is install location

menu

menu options
open brainbread
install brainbread + mods/maps (includes reinstall option)
uninstall brainbread + mods/maps
exit

rem download link list
set steamcmd_link="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set brainbread_1.2_zip="https://github.com/Mythical-Github/brainbread/releases/download/v1.0/brainbread-main.zip"

rem credits list
people who made brainbread
steamcmd
Zpin for brainbreadsteamicon fix
to do: options for installing and launch mod tools


exit /b