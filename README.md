# win10-regtweaks
This repository contains useful Windows 10 registry tweaks. If you consider using the "win10-myprefs.reg" file, **please read the code comments before running it on your system. This script collection comes with no warranty.** It contains contains important tweaks I use on freshly installed copies of Windows to do the following:

* Change OS settings in one click
* Disable components of the operating system that phone home to Microsoft

To see individual tweaks, look under the "registry-extras" directory.
# Usage
Simply double click the .reg files and click OK to apply them. Additionally, there is an optional PowerShell script that can be run from an admin PowerShell console. It's set up to install applications from Winget, and uninstall some of the UWP apps. **Read the contents of the files before proceeding!** You are also encouraged to modify the arrays inside the script to fit your own needs.