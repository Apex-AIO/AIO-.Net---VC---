# Apex's-AIO – .NET + VC++ All-in-One Installer

One script to silently install every major **.NET** runtime (1.0 → 10.x) and **Visual C++ Redistributable** (2005 → 2026) — x86 + x64.

## How to Download

1. Click the green **[<> Code]** button at the top right of this repository page  
2. Click **Download ZIP**  
3. Extract the ".Net-and-VC-All-In-One-Silent-Installer" Folder from the downloaded ZIP Folder.
4. Continue with the **How to Use** instructions below ↓

## How to Use

### Do **not** rename or move the subfolders — the script looks for them by **exact name**.

1. Press **Win + S** → type **PowerShell**  
2. Right-click **Windows PowerShell** → **Run as administrator**  
3. In the **Powershell**, Follow Below ↓ 

(you **WILL** need to change the path to match where you're storing it, the below commands are just an example):

Change this to match your path  ↓
   ```
   & "C:\Users\YourUsername\Desktop
   ```
Add this to the end of your path ↓
   ```
   \.Net-and-VC-All-In-One-Silent-Installer\Install-AllRuntimes-(RunAdmin!).ps1
   ```
Your Path Should look like this now ↓
   ```
   & "C:\Users\YourUsername\Desktop\.Net-and-VC-All-In-One-Silent-Installer\Install-AllRuntimes-(RunAdmin!).ps1"
   ```
4. Press Enter and the script will run if you entered it correctly! You'll be notified in green text once the script is finished installing everything.
   
5. Confirm everything installed correctly; Windows key + S > Installed Apps > Sort by date > A bunch of VC++ and .Net should be installed if executed correctly.
