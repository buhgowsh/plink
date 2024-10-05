#Actually allows the script to be run remotely
Set-ExecutionPolicy RemoteSigned

#Change the passwords for all users (DEAR GOD PLEASE RED TEAM DONT ALREADY BE IN)
$SecurePassword = Read-Host -Prompt "Enter password for all users" -AsSecureString
Get-LocalUser | Set-LocalUser -Password $SecurePassword
