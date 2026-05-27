@echo off
title St. Anne ICT Command Centre v2
cd /d "%~dp0"
echo ================================================
echo  St. Anne Mission Hospital -- ICT Command Centre
echo  Version 2.0 -- Transfers, Repairs, Classified
echo ================================================
echo.

set PYTHON_CMD=
py -3.12 --version >nul 2>&1 && set PYTHON_CMD=py -3.12
if "%PYTHON_CMD%"=="" py -3.11 --version >nul 2>&1 && set PYTHON_CMD=py -3.11
if "%PYTHON_CMD%"=="" py -3.10 --version >nul 2>&1 && set PYTHON_CMD=py -3.10
if "%PYTHON_CMD%"=="" python --version >nul 2>&1 && set PYTHON_CMD=python
if "%PYTHON_CMD%"=="" python3 --version >nul 2>&1 && set PYTHON_CMD=python3
if "%PYTHON_CMD%"=="" py --version >nul 2>&1 && set PYTHON_CMD=py

if "%PYTHON_CMD%"=="" (
    echo ERROR: Python not found.
    echo Please install Python 3.11 or 3.12 from https://www.python.org/downloads/
    echo During install, check "Add Python to PATH"
    pause
    exit /b 1
)

echo Python: %PYTHON_CMD%
echo Installing/updating packages...
%PYTHON_CMD% -m pip install "pywebview==4.4.1" openpyxl --quiet --disable-pip-version-check

echo.
echo Starting ICT Command Centre v2...
echo.
%PYTHON_CMD% main.py

if errorlevel 1 (
    echo.
    echo === Application error. Try running as Administrator. ===
    pause
)
