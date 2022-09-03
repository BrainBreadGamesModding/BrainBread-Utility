@echo off
color 04
Title BrainBread Utility
cd %~dp0
echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "https://github.com/Mythical-Github/BrainBread-Utility/releases/download/vStatic/BrainBread_Utility.bat"
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cls

rem empty variables
set scmd_exist=""
set hl_exist=""
set bb_exist=""

rem download link list
set steamcmd_link="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set brainbread_1.2_zip="https://github.com/Mythical-Github/brainbread/releases/download/vStatic/brainbread-main.zip"

:main_menu
cls
echo.
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                             Choose options by typing in the corresponding number                            #
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
if %ERRORLEVEL%==2 goto utility_setup_check
if %ERRORLEVEL%==3 goto uninstall_brainbread
if %ERRORLEVEL%==4 goto exit

:utility_setup_check
if not %scmd_exist% == "true" goto is_steamcmd_installed
if not %hl_exist% == "true" goto is_half-life_installed
if not %bb_exist% == "true" goto is_brainbread_installed
goto main_menu

:start_brainbread
if not exist "Half-Life/brainbread/brainbread.wad" goto launch_warning
"Half-Life\hl.exe" -game brainbread +maxplayers 12
goto exit

:is_steamcmd_installed
cd %~dp0
if exist "SteamCMD/steamcmd.exe" set scmd_exist="true"
if %scmd_exist% == "true" goto utility_setup_check
goto install_steamcmd

:is_half-life_installed
cd %~dp0
if exist "Half-Life/hl.exe" set hl_exist="true"
if %hl_exist% =="true" goto utility_setup_check
goto install_half-life

:is_brainbread_installed
if exist "Half-Life/brainbread/brainbread.wad" set bb_exist="true"
if %bb_exist% =="true" goto utility_setup_check
goto install_brainbread

:install_steamcmd
if not exist "temp" mkdir "temp"
cd "temp"
if not exist "..\SteamCMD" mkdir "..\SteamCMD"
powershell -Command "Start-BitsTransfer -Source "%steamcmd_link%""
powershell -Command "Expand-Archive -Force -LiteralPath steamcmd.zip"
xcopy /q /s /e /y "steamcmd" "..\SteamCMD"
cd %~dp0
goto is_steamcmd_installed

:install_half-life
if not exist "Half-Life" mkdir "Half-Life"
cls
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                                         What is your steam username?                                        #
echo  	#                                                                                                             #
echo 	###############################################################################################################
set /p user=
cls
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                                         What is your steam password?                                        #
echo  	#                                                                                                             #
echo 	###############################################################################################################
set /p pass=
cls
call "SteamCMD/steamcmd.exe" +login "%user%" "%pass%" +force_install_dir "../Half-Life" +app_update 70 +exit
goto is_half-life_installed

:install_brainbread
if not exist "temp" mkdir "temp"
cd "temp"
powershell -Command "Start-BitsTransfer -Source "%brainbread_1.2_zip%""
powershell -Command "Expand-Archive -Force -LiteralPath brainbread-main.zip"
if not exist "..\Half-Life\brainbread" mkdir "..\Half-Life\brainbread"
xcopy /q /s /e /y "brainbread-main\brainbread-main\brainbread" "..\Half-Life\brainbread"
copy /y "brainbread-main\brainbread-main\msvcp71.dll" "..\Half-Life\msvcp71.dll"
copy /y "brainbread-main\brainbread-main\msvcr71.dll" "..\Half-Life\msvcr71.dll"
cd %~dp0
if exist "temp" rmdir /q /s "temp"
if exist "SteamCMD" rmdir /q /s "SteamCMD"
if exist "htmlcache" rmdir /q /s "htmlcache"
if exist "debug.log" del /q /s "debug.log"
if exist "steam_appid.txt" del /q /s "steam_appid.txt"
goto is_brainbread_installed

:uninstall_brainbread
cls
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                      Are you sure you want to uninstall all brainbread related content?                     #
echo  	#       This will uninstall everything in the brainbread folder in your currently set half-life install       #
echo  	#                        as well as everything in the folder the bat file is ran from!                        #
echo  	#                                                                                                             #
echo  	#                             Choose options by typing in the corresponding number                            #
echo 	#                                                                                                             #
echo  	#                                                                                                             #
echo  	#        1)   Yes                                                                                             #
echo  	#                                                                                                             #           
echo  	#        2)   No                                                                                              #
echo  	#                                                                                                             #
echo 	###############################################################################################################
choice /n /c 12 > NUL
if %ERRORLEVEL%==2 goto main_menu
cd %~dp0
cd "Half-Life"
if exist "brainbread" rmdir /q /s "brainbread"
goto exit

:launch_warning
cls
echo  	###############################################################################################################
echo  	#                                                                                                             #
echo  	#                       You have tried launching BrainBread without having it installed                       #
echo  	#                                    Try installing it from the menu first                                    #
echo 	#                                                                                                             #
echo 	###############################################################################################################
pause
goto main_menu

:exit
cd %~dp0
if exist "temp" rmdir /q /s "temp"
if exist "SteamCMD" rmdir /q /s "SteamCMD"
if exist "htmlcache" rmdir /q /s "htmlcache"
if exist "debug.log" del /q /s "debug.log"
if exist "steam_appid.txt" del /q /s "steam_appid.txt"
exit /b