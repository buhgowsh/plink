#Run as administrator by going into admin powershell and using the following command:
#Start-Process *script path* (script path is where the file is stored)

#Can also run from ISE as long as ISE was started as administrator

#Disable the firewall (if it already isnt)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#Disable all inbound rules
Disable-NetFirewallRule -Direction Inbound

#Add rules to allow FTP, SSH, HTTP, MySQL, and RDP through the firewall (inbound), blocking everything else
New-NetFirewallRule -DisplayName "Allow FTP" -Direction Inbound -LocalPort 20-21 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow SSH" -Direction Inbound -LocalPort 22 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow HTTP" -Direction Inbound -LocalPort 80 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow MySQL" -Direction Inbound -LocalPort 3306 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Allow
Enable-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4)"

#Repeat the same process for outbound connections


#Enable firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
