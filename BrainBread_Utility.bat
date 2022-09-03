@echo off
color 0A
Title BrainBread Utility
echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "https://github.com/Mythical-Github/BrainBread-Utility/releases/download/vStatic/BrainBread_Utility.bat"
cls
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cd %~dp0
cls






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