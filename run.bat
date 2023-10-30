@ECHO OFF

REM Get the directory of the batch file
set "batch_dir=%~dp0"

REM Define the HTML file name
set "html_file=index.html"

@REM ------------------------- CHECKING BROWSERS INSTALLED ----------------------
REM Checking if Google Chrome is installed
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>&1
set CHROME_FOUND=%errorlevel%

REM Checking if Microsoft Edge is installed
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" >nul 2>&1
set EDGE_FOUND=%errorlevel%

REM Checking if Mozilla Firefox is installed
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla Firefox" >nul 2>&1
set FIREFOX_FOUND=%errorlevel%



REM Opening the browser in a minimized window without the URL bar
if %CHROME_FOUND% EQU 0 (
    start /min chrome --app="%batch_dir%%html_file%" --window-size=1700,1000


) else if %EDGE_FOUND% EQU 0 (
    start /min msedge --app="%batch_dir%%html_file%" --window-size=1700,1000


    
) else if %FIREFOX_FOUND% EQU 0 (
    start /min firefox -new-window --app="%batch_dir%%html_file%" --height=1000 --width=1700

) else (
    REM Neither Chrome nor Edge is installed, open the URL in the default browser
    start "%batch_dir%%html_file%"
)

exit