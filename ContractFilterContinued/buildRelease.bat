
rem @echo off

set DEFHOMEDRIVE=d:
set DEFHOMEDIR=%DEFHOMEDRIVE%%HOMEPATH%
set HOMEDIR=
set HOMEDRIVE=%CD:~0,2%

set RELEASEDIR=d:\Users\jbb\release
set ZIP="c:\Program Files\7-zip\7z.exe"
echo Default homedir: %DEFHOMEDIR%

set /p HOMEDIR= "Enter Home directory, or <CR> for default: "

if "%HOMEDIR%" == "" (
set HOMEDIR=%DEFHOMEDIR%
)
echo %HOMEDIR%

SET _test=%HOMEDIR:~1,1%
if "%_test%" == ":" (
set HOMEDRIVE=%HOMEDIR:~0,2%
)

d:
cd D:\Users\jbb\github\ContractFilterContinued\ContractFilterContinued

type ContractFilterContinued.version
set /p VERSION= "Enter version: "


mkdir %HOMEDIR%\install\GameData\ContractFilterContinued
mkdir %HOMEDIR%\install\GameData\ContractFilterContinued\Textures
mkdir %HOMEDIR%\install\GameData\ContractFilterContinued\Plugins
mkdir %HOMEDIR%\install\GameData\ContractFilterContinued\PluginData


del /Y %HOMEDIR%\install\GameData\ContractFilterContinued
del /Y %HOMEDIR%\install\GameData\ContractFilterContinued\Textures


copy /Y bin\Release\ContractFilterContinued.dll "%HOMEDIR%\install\GameData\ContractFilterContinued\Plugins"
copy /Y ..\GameData\ContractFilterContinued\Textures\*.png    "%HOMEDIR%\install\GameData\ContractFilterContinued\Textures"
copy /Y "ContractFilterContinued.version" "%HOMEDIR%\install\GameData\ContractFilterContinued"
copy /Y "License.txt" "%HOMEDIR%\install\GameData\ContractFilterContinued"

copy /Y "..\GameData\ContractFilterContinued\License.txt" "%HOMEDIR%\install\GameData\ContractFilterContinued"
copy /Y "README.md" "%HOMEDIR%\install\GameData\ContractFilterContinued"
copy /Y ..\GameData\ContractFilterContinued\Plugins\MiniAVC.dll  "%HOMEDIR%\install\GameData\ContractFilterContinued"






%HOMEDRIVE%
cd %HOMEDIR%\install

set FILE="%RELEASEDIR%\ContractFilterContinued-%VERSION%.zip"
IF EXIST %FILE% del /F %FILE%
%ZIP% a -tzip %FILE% Gamedata\ContractFilterContinued
