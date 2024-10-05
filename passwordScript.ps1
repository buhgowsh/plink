#This one only seems to work if it is run within ISE (ISE neds to be run as admin)
$SecurePassword = Read-Host -Prompt "Enter password for all users" -AsSecureString
Get-LocalUser | Set-LocalUser -Password $SecurePassword
