#nitrate92's winget script. This applies to a less broad amount of people, but can be good for you if you want somewhere to start from if you are creating a small set of automation scripts like I am.
#Note: I don't know if I have to append "--accept-package-agreements" to everything but I will because it shouldn't hurt anything.
Write-Host "This installs a lot of stuff. Read the code before running, and use at your own risk."
Read-Host -Prompt "Press any key to continue"
winget install Microsoft.PowerToys --source winget
winget install 9p7knl5rwt25 --accept-package-agreements #sysinternals
winget install 7zip.7zip --accept-package-agreements
winget install 9N0DX20HK701 --accept-package-agreements #windows terminal
winget install VSCodium.VSCodium --accept-package-agreements
winget install Mozilla.Firefox --accept-package-agreements
winget install Valve.Steam --accept-package-agreements
winget install Discord.Discord --accept-package-agreements
winget install CrystalDewWorld.CrystalDiskInfo --accept-package-agreements
winget install VideoLAN.VLC --accept-package-agreements
winget install RealVNC.VNCViewer --accept-package-agreements
winget install WiresharkFoundation.Wireshark --accept-package-agreements
winget install Git.Git --accept-package-agreements
winget install GitHub.GitHubDesktop --accept-package-agreements
winget install AngusJohnson.ResourceHacker --accept-package-agreements
winget install BleachBit.BleachBit --accept-package-agreements
winget install KeePassXCTeam.KeePassXC --accept-package-agreements
winget install RaspberryPiFoundation.RaspberryPiImager --accept-package-agreements
#more shit will be added as i see fit i guess lol
[console]::beep(500,500)        #it does what it says, it beeps (just as a self reminder)
[console]::beep(500,500)
Read-Host -Prompt "Done, press any key to exit"