::@echo off

set UNREAL="C:\Program Files\Epic Games\UE_4.27\Engine"
set UCC=%UNREAL%\Binaries\DotNET\UnrealBuildTool.exe
set UNREAL_PRE=%UNREAL%\Build\BatchFiles\RunUAT
set PROJECT=BuildAutomationTest

set SRC="C:\Users\Public\Repos\C++ Urneal\BuildAutomationTest"

set DEST="H:\UnrealBuilds"

::if not exist %DEST%(
::	mkdir %DEST%
::)

git fetch


 
  git pull


  echo Repository is up to date.
  
	mkdir %DEST%

	set buildconfig=Development

	for /f "tokens=1-7 delims=/:. " %%d in ("%date% %time%") do (
		set "timestamp=%%d-%%e-%%f-%%g-%%h-%%i-%%j"
	)

	set "timestamp=%timestamp: =%"


	echo %timestamp%

	mkdir %DEST%\%timestamp%

	call %UNREAL_PRE% BuildCookRun -project=%SRC%\%PROJECT%.uproject -noP4 -platform=Win64 -clientconfig=%buildconfig% -serverconfig=%buildconfig% -cook -allmaps -build -stage -pak -archive -archivedirectory=%DEST%\%timestamp%
)






