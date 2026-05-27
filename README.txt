ST. ANNE MISSION HOSPITAL — ICT COMMAND CENTRE v2.0
====================================================

WHAT'S NEW IN v2
-----------------
✔ PIN-protected login — only you (ICT Manager) can access the system
✔ Custom departments, equipment types, and status values — add anything
✔ Asset transfers between departments — full transfer log with history
✔ Repair tracking — log repairs, upgrades, reassignments, disposals
✔ Condition auto-update — repaired items auto-set to "Good"
✔ Portable app builder — generates installer scripts for any device
✔ Transfer history column — every item tracks where it has been
✔ Full audit log — every action stamped with time and details


SECURITY
---------
On first launch you will set a PIN. Only someone with that PIN can
open the system. Change your PIN at any time from the Security tab.

DO NOT share auth.json if you want to keep access restricted.
To reset the PIN: delete auth.json and restart the app.


ADDING CUSTOM DEPARTMENTS / TYPES
-----------------------------------
Go to the Customise tab (⚙️) and add new departments, equipment types,
or status values. They immediately appear in all dropdowns — no restart needed.


TRANSFERRING AN ASSET
----------------------
1. Select the asset in Inventory
2. Click the 🔄 Transfer button
3. Choose the destination department and enter a reason
4. Confirm — the system updates the department, logs the transfer,
   and adds the movement to the asset's Transfer History field


LOGGING A REPAIR / EVENT
--------------------------
1. Select the asset in Inventory
2. Click 📝 Log Event
3. Choose event type: Repaired, Upgraded, Serviced, etc.
4. Enter description and save
If the event is "Repaired" and condition was "Needs Repair" → auto-set to "Good"


PORTABLE USE ON A NEW DEVICE
------------------------------
Option A (Windows):
  1. Copy this entire folder to the new PC
  2. Double-click start.bat — it installs packages and launches

Option B — generate installer scripts:
  1. In the app, go to Security tab
  2. Click "Generate Installer Files"
  3. Copy folder + INSTALL_ON_NEW_PC.bat to the new PC
  4. Double-click the installer on the new PC

Your data is always in ICT_MASTER.xlsx — copy the folder and your data moves with it.


EXCEL SHEETS
-------------
Inventory      — All active assets (includes Transfer History column)
History        — Every event: transfers, repairs, replacements
Replacements   — Full replacement records
Ink            — Ink usage and restocking
Audit Log      — Every single action with timestamp
Config         — (auto-managed by app)


TROUBLESHOOTING
---------------
"Python not found"     → Install Python 3.11+ from python.org, check "Add to PATH"
"Permission denied"    → Close ICT_MASTER.xlsx in Excel, then retry
"Blank window"         → Run start.bat as Administrator
App crashes on start   → Open Command Prompt in folder, run: python main.py
                         Read the error and contact ICT support


SUPPORT
-------
Managed by: ICT Department, St. Anne Mission Hospital
Master file: ICT_MASTER.xlsx (keep this file safe — it is everything)
Config file: config.json (stores your custom departments/types)
Auth file:   auth.json (stores your PIN hash — keep private)
