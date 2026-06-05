ST. ANNE MISSION HOSPITAL — ICT COMMAND CENTRE
PORTABLE EXE BUILDER
================================================

HOW TO BUILD THE PORTABLE EXE
------------------------------
You only need to build ONCE on any Windows machine that has Python.
The output is a single .exe that runs on ANY Windows PC — no Python,
no pip, no dependencies required on target machines.

Steps:
1. Make sure Python is installed (python.org — tick "Add Python to PATH")
2. Double-click BUILD.bat
3. Wait 1-3 minutes while PyInstaller bundles everything
4. The finished exe appears at:   dist\ICT_CommandCentre.exe

That's it. Copy dist\ICT_CommandCentre.exe to any Windows computer
and double-click it. Nothing else needed.


HOW THE PORTABLE EXE WORKS
---------------------------
- On first launch, it seeds ICT_MASTER.xlsx and auth.json next to the .exe
- All data (inventory, ink, history, reports, backups) is stored in that
  same folder — bring the whole folder when moving to a new PC
- The app starts its own internal web server and opens your default browser
- The browser window is your interface — do not close the browser tab
- When done, close the browser tab then the ICT_CommandCentre process
  (via Task Manager or the system tray if you add that later)


MOVING TO A NEW PC
------------------
1. Copy ICT_CommandCentre.exe to the new PC
2. Copy ICT_MASTER.xlsx, auth.json, and config.json alongside it
3. Double-click the exe — all your data is there


DATA FILES (keep these with the exe)
--------------------------------------
ICT_MASTER.xlsx   — Main inventory database (KEEP THIS SAFE — back it up!)
auth.json         — PIN/login data
config.json       — Custom departments, types, conditions (auto-created)
backups/          — Automatic backups created before destructive operations
reports/          — Generated PDF reports


TROUBLESHOOTING
---------------
Browser does not open:
  Wait 5 seconds and try manually opening:  http://127.0.0.1:<port>
  (the port number is shown in Task Manager > ICT_CommandCentre process details)

App won't start (antivirus blocks it):
  This is common with PyInstaller exes on first run.
  Right-click the exe → Properties → Unblock, or add an exclusion in
  Windows Security → Virus & threat protection → Exclusions.

Cannot save / permission denied:
  Close ICT_MASTER.xlsx if it is open in Excel, then try again.

To reset PIN: delete auth.json next to the exe, then restart the app.


BUILD REQUIREMENTS (only on the build machine, not target PCs)
---------------------------------------------------------------
- Python 3.10 or newer
- pip (comes with Python)
- Internet access for first build (to download PyInstaller/openpyxl/reportlab)
- BUILD.bat handles all of this automatically
