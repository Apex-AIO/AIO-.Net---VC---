# Apexs-AIO – .NET + VC++ All-in-One Installer

One script to silently install every major **.NET** runtime (1.0 → 10.x) and **Visual C++ Redistributable** (2005 → 2026) — x86 + x64.

## How to Download

1. Click the green **<> Code** button at the top right of this repository page  
2. Click **Download ZIP**  
3. Extract the ZIP file to any location on your computer  
4. Continue with the **How to Use** instructions below

## How to Use

### Do **not** rename or move the subfolders — the script looks for them by **exact name**.

### Method 1 – Easiest (if available)

1. Extract the ZIP file ("AIO-.Net---VC----main.zip")  
2. Right-click **Install-AllRuntimes-(RunAdmin!).ps1**  
3. Choose **Run with PowerShell as administrator**  
   *(or **Run as administrator** if that's the only option you see)*  
4. Let it run — It'll **tell** you when it's finished with green text  
5. When finished you'll see a confirmation message  
   → A log file (`Install-Log-*.txt`) is created in the same folder — check it if anything looks wrong
6. Confirm everything installed correctly; Windows key + S > Installed Apps > Sort by date > Confirm

### Method 2 – When right-click "Run as admin" is missing or doesn't work

1. Press **Win + S** → type **PowerShell**  
2. Right-click **Windows PowerShell** → **Run as administrator**  
3. In the blue window, paste this command (change the path if you put the folder somewhere else):

   ```powershell
   & "C:\Users\YourUsername\Desktop\Apexs-AIO\Install-AllRuntimes-(RunAdmin!).ps1"

4. Confirm everything installed correctly; Windows key + S > Installed Apps > Sort by date > Confirm
