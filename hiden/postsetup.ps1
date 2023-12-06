# HIDEN's Windows 10 post-install script.

# 9p7knl5rwt25 = sysinternals, 9N0DX20HK701 = windows terminal
$wingetPackages = "Microsoft.PowerToys", "9p7knl5rwt25", "7zip.7zip", "9N0DX20HK701", "VSCodium.VSCodium", "Librewolf.Librewolf", "eloston.ungoogled-chromium", "Valve.Steam", "Discord.Discord", "CrystalDewWorld.CrystalDiskInfo", "RealVNC.VNCViewer", "WiresharkFoundation.Wireshark", "Git.Git", "GitHub.GitHubDesktop", "AngusJohnson.ResourceHacker", "BleachBit.BleachBit", "Bitwarden.Bitwarden", "Notepad++.Notepad++", "Python.Python.3.11", "Microsoft.DotNet.SDK.8", "Element.Element", "Telerik.Fiddler.Classic", "Telegram.TelegramDesktop", "VMware.WorkstationPro", "EpicGames.EpicGamesLauncher", "dotPDNLLC.paintdotnet", "DuongDieuPhap.ImageGlass", "ShareX.ShareX", "OBSProject.OBSStudio", "Spotify.Spotify", "Nvidia.GeForceExperience", "qBittorrent.qBittorrent", "Microsoft.PowerShell", "StartIsBack.StartIsBack", "Mojang.MinecraftLauncher", "CodecGuide.KLiteCodecPack.Mega", "yt-dlp.yt-dlp", "cURL.cURL", "GNU.Wget2"
$chocolateyPackages = "tenacity --pre", "photogimp", "handbreak", "inkscape", "blender", "libreoffice-fresh"

# 549981C3F5F10 = Cortana
$appxToRemove = @("Microsoft.549981C3F5F10", "Microsoft.3DBuilder", "Microsoft.Appconnector", "Microsoft.BingFinance", "Microsoft.BingNews", "Microsoft.BingSports", "Microsoft.BingTranslator", "Microsoft.BingWeather", "Microsoft.FreshPaint", "Microsoft.GamingServices", "Microsoft.Microsoft3DViewer", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftPowerBIForWindows", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.MicrosoftStickyNotes", "Microsoft.MinecraftUWP", "Microsoft.NetworkSpeedTest", "Microsoft.Office.OneNote", "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet", "Microsoft.Windows.Photos", "Microsoft.WindowsAlarms", "Microsoft.WindowsCalculator", "Microsoft.WindowsCamera", "microsoft.windowscommunicationsapps", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone", "Microsoft.WindowsSoundRecorder", "Microsoft.WindowsStore", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.YourPhone", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.CommsPhone", "Microsoft.ConnectivityStore", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.Messaging", "Microsoft.Office.Sway", "Microsoft.OneConnect", "Microsoft.WindowsFeedbackHub", "Microsoft.Microsoft3DViewer", "Microsoft.MSPaint", "Microsoft.BingFoodAndDrink", "Microsoft.BingHealthAndFitness", "Microsoft.BingTravel", "Microsoft.WindowsReadingList", "Microsoft.MixedReality.Portal", "Microsoft.ScreenSketch", "Microsoft.XboxGamingOverlay", "Microsoft.XboxIdentityProvider", "Microsoft.YourPhone")

$elevated = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match 'S-1-5-32-544'
if (-not $elevated) {
	Write-Host "This script requires administrative privileges. Please run it again in an elevated command prompt." -ForegroundColor Red
	exit
}

Write-Host "The following packages will be installed:"
foreach ($package in $wingetPackages) {
	Write-Host "Winget: $package" -ForegroundColor Yellow
}
foreach ($package in $chocolateyPackages) {
	Write-Host "Chocolatey: $package" -ForegroundColor Yellow
}

Read-Host -Prompt "Press any key to continue"

Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

foreach ($package in $wingetPackages) {
	winget install $package --accept-package-agreements
}
foreach ($package in $chocolateyPackages) {
	choco install $package -y
}

[console]::beep(500,500)		# Beep when complete; a self reminder
[console]::beep(500,500)

Read-Host "NOTE: This next step will uninstall any pre-installed Appx package that is not essential for Windows to function at all. (i.e: everything but Settings and Security and required libs)"
Read-Host "Go into the script's source code, and remove any app you want to keep from the array."
Read-Host -Prompt "Continue at your own risk; you have been warned. Press any key to continue." -ForegroundColor Red

Write-Host "Backing up list of all currently installed Appx packages. File will be placed under the current directory for this PowerShell instance."
Get-AppxPackage -AllUsers > InstalledBefore.txt
Write-Host "Removing applications"
foreach ($appx in $appxToRemove) {
	Get-AppxPackage -Name $appx -AllUsers | Remove-AppxPackage
	Get-AppXProvisionedPackage -Online | Where-Object DisplayName -eq $appx | Remove-AppxProvisionedPackage -Online
}

[console]::beep(500,500)
[console]::beep(500,500)

Read-Host -Prompt "Done, press any key to exit"