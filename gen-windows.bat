@echo off

echo Please choose your preferred Visual Studio version.
choice /c 79 /n /t 3 /d 7 /m "Press '7' for VS 2017 or '9' for VS 2019: "
if errorlevel 1 set vs_version=Visual Studio 15 2017 Win64
if errorlevel 2 set vs_version=Visual Studio 16 2019

REM Create build folder
mkdir build-windows
pushd build-windows

REM Generate project files
IF "%CI%"=="" (
	cmake -G "%vs_version%" ..
) ELSE (
	cmake -G "%vs_version%" -DCI:BOOL=ON -DCMAKE_CONFIGURATION_TYPES=%CONFIGURATION% ..
)
popd
