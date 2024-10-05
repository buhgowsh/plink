#Run as administrator by going into admin powershell and using the following command:
#Start-Process *script path* (script path is where the file is stored)

#Can also run from ISE as long as ISE was started as administrator

#Disable the firewall (if it already isnt)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#Disable all inbound rules
Disable-NetFirewallRule -Direction Inbound

#Add rules to allow FTP, SSH, HTTP, MySQL, and RDP through the firewall (inbound), blocking everything else
New-NetFirewallRule -Name "Allow FTP" -DisplayName "Allow FTP" -Direction Inbound -LocalPort 20-21 -Protocol TCP -Action Allow
New-NetFirewallRule -Name "Allow SSH" -DisplayName "Allow SSH" -Direction Inbound -LocalPort 22 -Protocol TCP -Action Allow
New-NetFirewallRule -Name "Allow HTTP" -DisplayName "Allow HTTP" -Direction Inbound -LocalPort 80 -Protocol TCP -Action Allow
New-NetFirewallRule -Name "Allow MySQL" -DisplayName "Allow MySQL" -Direction Inbound -LocalPort 3306 -Protocol TCP -Action Allow
New-NetFirewallRule -Name "Allow RDP" -DisplayName "Allow RDP" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Allow
Enable-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4)"
New-NetFirewallRule -Name "Block Port 4444" -DisplayName "Block Port 4444" -Direction Outbound -LocalPort 4444 -Protocol TCP -Action Block

#Make some rules for the outbound side
New-NetFirewallRule -Name "Block Port 444" -DisplayName "Block Port 444" -Direction Outbound -LocalPort 444 -Protocol TCP -Action Block
New-NetFirewallRule -Name "Block Port 4444" -DisplayName "Block Port 4444" -Direction Outbound -LocalPort 4444 -Protocol TCP -Action Block

#Enable firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

#Disable SMBv1
Set-SmbServerConfiguration –EnableSMB1Protocol $false

#Download useful stuff
Start-BitsTransfer -Source "https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIG_GPO_Package_April_2024.zip" -Destination "C:\"
Start-BitsTransfer -Source "https://download.sysinternals.com/files/SysinternalsSuite.zip" -Destination "C:\"
Start-BitsTransfer -Source "https://www.voidtools.com/Everything-1.4.1.1026.x64-Setup.exe" -Destination "C:\"
Start-Process "msedge" "https://www.malwarebytes.com/mwb-download/thankyou"
Start-Process "msedge" "https://www.microsoft.com/en-us/download/details.aspx?id=55319#:~:text=This%20set%20of%20tools%20allows%20enterprise%20security%20administrators%20to%20download,&msockid=2de510ea7e636380238505ed7f31622e"
