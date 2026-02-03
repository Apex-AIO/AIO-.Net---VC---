# Install-AllRuntimes-(RunAdmin!).ps1
# Run as Administrator

$rootPath = $PSScriptRoot
$logFile = Join-Path $rootPath "Install-Log.txt"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Out-File -FilePath $logFile -Append -Encoding utf8
}

function Get-ProgressColor {
    param([int]$Percent)
    if ($Percent -le 40) { return "Red" }
    elseif ($Percent -le 70) { return "Yellow" }
    else { return "Green" }
}

function Draw-Bar {
    param([int]$Percent, [int]$Width = 30)
    $filled = [math]::Round(($Percent / 100) * $Width)
    ("#" * $filled) + ("-" * ($Width - $filled))
}

# ──────────────────────────────────────────────
# Startup (only once)
# ──────────────────────────────────────────────

Clear-Host
Write-Host ""
Write-Host "  Apex's All In One .NET and VC++ Installer" -ForegroundColor Magenta
Write-Host "  https://github.com/Apex-AIO/.Net-and-VC-All-In-One-Silent-Installer/tree/main" -ForegroundColor White
Write-Host ""
Write-Host "  Starting installation..." -ForegroundColor Yellow
Start-Sleep -Seconds 1

Write-Log "Starting final installation run from: $rootPath"

# ──────────────────────────────────────────────
# .NET section
# ──────────────────────────────────────────────

$netFolder = Join-Path $rootPath ".Net"
if (Test-Path $netFolder) {
    Write-Host "`r  Installing from .NET folder..." -NoNewline -ForegroundColor Cyan
    $files = Get-ChildItem -Path $netFolder -Filter "*.exe"
    $total = $files.Count
    $count = 0

    foreach ($item in $files) {
        $count++
        $percent = [math]::Round(($count / $total) * 100)
        $color = Get-ProgressColor $percent

        $name = $item.Name
        $file = $item.FullName
        $args = "/quiet /norestart"

        if ($name -match "dotnet-win-x(64|86)\.[01]\.[01]") { $args = "/q /norestart" }
        elseif ($name -match "dotnet-runtime-2\.[012]") { $args = "/quiet /norestart" }

        # Task name on one line
        Write-Host "`r  .NET Current task: $name" -NoNewline -ForegroundColor White
        Write-Host ""  # force new line
        # Progress bar directly below
        Write-Host "    $(Draw-Bar $percent) $percent%" -NoNewline -ForegroundColor $color
        Write-Log "Installing .NET: $name → $args"

        try {
            Start-Process -FilePath $file -ArgumentList $args -Wait -NoNewWindow
            Write-Log "Completed .NET: $name"
        } catch {
            Write-Log "Error in .NET ${name}: $_"
        }
    }
    Write-Host ""  # clean new line after section
} else {
    Write-Host "  No .NET folder found" -ForegroundColor Yellow
}

# ──────────────────────────────────────────────
# VC++ section
# ──────────────────────────────────────────────

$vcFolder = Join-Path $rootPath "Visual Studio (VC++)"
if (Test-Path $vcFolder) {
    Write-Host "`r  Installing from VC++ folder..." -NoNewline -ForegroundColor Magenta
    $files = Get-ChildItem -Path $vcFolder -Filter "*.exe"
    $total = $files.Count
    $count = 0

    foreach ($item in $files) {
        $count++
        $percent = [math]::Round(($count / $total) * 100)
        $color = Get-ProgressColor $percent

        $name = $item.Name
        $file = $item.FullName
        $args = "/quiet /norestart"

        if ($name -match "2005") { $args = "/Q" }
        elseif ($name -match "2008|2010|2012|2013") { $args = "/q /norestart" }

        Write-Host "`r  VC++ Current task: $name" -NoNewline -ForegroundColor White
        Write-Host ""  # force new line
        Write-Host "    $(Draw-Bar $percent) $percent%" -NoNewline -ForegroundColor $color
        Write-Log "Installing VC++: $name → $args"

        try {
            Start-Process -FilePath $file -ArgumentList $args -Wait -NoNewWindow
            Write-Log "Completed VC++: $name"
        } catch {
            Write-Log "Error in VC++ ${name}: $_"
        }
    }
    Write-Host ""  # clean new line
} else {
    Write-Host "  No VC++ folder found" -ForegroundColor Yellow
}

# ──────────────────────────────────────────────
# Final prompt only
# ──────────────────────────────────────────────

Write-Host ""
Write-Host "  Status: Completed - Waiting on user prompt" -ForegroundColor Green
Write-Host ""

Write-Host "  Do you wish to restart now or later?" -ForegroundColor White
$choice = Read-Host "  [Y/N]"

if ($choice -eq "y" -or $choice -eq "Y") {
    Write-Host ""
    Write-Host "  Rebooting in 20 seconds..." -ForegroundColor Yellow
    Start-Sleep -Seconds 20
    Restart-Computer -Force
} else {
    Write-Host ""
    Write-Host "  Terminal will close in 2 seconds." -ForegroundColor Green
    Start-Sleep -Seconds 2
    Stop-Process -Id $PID -Force
}