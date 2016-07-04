
set H=R:\KSP_1.1.3_dev
echo %H%

set d=%H%
if exist %d% goto one
mkdir %d%
:one
set d=%H%\Gamedata
if exist %d% goto two
mkdir %d%
:two
set d=%H%\Gamedata\ContractFilterContinued
if exist %d% goto three
mkdir %d%
:three
set d=%H%\Gamedata\ContractFilterContinued\Plugins
if exist %d% goto four
mkdir %d%
:four
set d=%H%\Gamedata\ContractFilterContinued\Textures
if exist %d% goto five
mkdir %d%
:five
set d=%H%\Gamedata\ContractFilterContinued\PluginData
if exist %d% goto six
mkdir %d%
:six



xcopy ..\GameData\ContractFilterContinued\Textures\*.png   %H%\GameData\ContractFilterContinued\Textures /Y
copy ..\GameData\ContractfilterContinued\Plugins\MiniAVC.dll %H%\Gamedata\ContractFilterContinued
copy bin\Debug\ContractfilterContinued.dll %H%\Gamedata\ContractFilterContinued\Plugins
copy  ContractFilter.version %H%\Gamedata\ContractFilterContinued\ContractFilterContinued.version
rem copy settings.cfg %H%\Gamedata\ContractFilterContinued\PluginData

