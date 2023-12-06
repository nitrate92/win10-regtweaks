# winget installation script. Mainly intended for LTSC, since that doesn't come with it preinstalled OOTB.

$elevated = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match 'S-1-5-32-544'
if (-not $elevated) {
	Write-Host "This script requires administrative privileges. Please run it again in an elevated command prompt." -ForegroundColor Red
	exit
}

$progressPreference = 'silentlyContinue'
Write-Information "Downloading and installing winget and its dependencies..."
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.6.2771/27abf0d1afe340e7a64fb696056b2672_License1.xml -OutFile 27abf0d1afe340e7a64fb696056b2672_License1.xml
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxProvisionedPackage -Online -PackagePath Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -LicensePath .\27abf0d1afe340e7a64fb696056b2672_License1.xml -Verbose
