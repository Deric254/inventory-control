@echo off
title St. Anne ICT Command Centre — EXE Builder
color 0A

echo ============================================================
echo   ST. ANNE MISSION HOSPITAL — ICT Command Centre
echo   Building Portable EXE ...
echo ============================================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found. Install from https://python.org and tick "Add to PATH"
    pause
    exit /b 1
)
echo [OK] Python found.

:: Install/upgrade PyInstaller and dependencies
echo.
echo Installing build dependencies (one-time only)...
pip install --quiet --upgrade pyinstaller openpyxl reportlab
if errorlevel 1 (
    echo [ERROR] pip failed. Check your internet connection.
    pause
    exit /b 1
)
echo [OK] Dependencies ready.

:: Run PyInstaller
echo.
echo Building ICT_CommandCentre.exe — this takes 1-3 minutes...
echo.
pyinstaller ICTCommandCentre.spec --clean --noconfirm
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed. See messages above.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   BUILD COMPLETE!
echo.
echo   Your portable exe is at:
echo   dist\ICT_CommandCentre.exe
echo.
echo   Copy ONLY that one file to any Windows PC and run it.
echo   No Python needed on the target machine.
echo   Data files (ICT_MASTER.xlsx etc.) are created next to
echo   the exe on first launch and persist across runs.
echo ============================================================
echo.
pause
