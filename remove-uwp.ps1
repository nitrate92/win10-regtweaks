Write-Host "This is gonna uninstall a lot of (not much but it could be important to you) UWP crap. Run at your own risk."
Read-Host -Prompt "Press any key to continue"
Write-Host "Backing up list of all installed UWP applications. File will be placed under the current directory for this PowerShell instance."
Get-AppxPackage -AllUsers > InstalledBefore.txt #i never realized this before but apparently i was using character U+2013 which can be confused with U+002d and caused me a few headaches
Write-Host "Removing applications"
Get-AppxPackage Microsoft.WindowsCamera -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.Xbox.TCUI -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGameOverlay -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGamingOverlay -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxSpeechToTextOverlay -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.People -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.549981C3F5F10 -AllUsers | Remove-AppxPackage      #just to clarify, this is in fact the Cortana app
Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage
[console]::beep(500,500)        #it does what it says, it beeps (just as a self reminder)
[console]::beep(500,500)
Read-Host -Prompt "Done, press any key to exit"