@echo off
set CURRENT_DIR=%~dp0
set /p VERSION=<%CURRENT_DIR%selenium_version

IF %processor_architecture% == AMD64 (
start java -jar %CURRENT_DIR%bin\selenium-server-standalone-%VERSION%.jar^
 -port 4455^
 -Dwebdriver.chrome.driver="%CURRENT_DIR%bin\win\x86_64\chromedriver.exe"^
 -Dwebdriver.chrome.logfile="%CURRENT_DIR%chromedriver.log"^
 -Dwebdriver.ie.driver="%CURRENT_DIR%bin\win\x86-64\IEDriverServer.exe"^
 -Dphantomjs.binary.path="%CURRENT_DIR%bin\win\x86-64\phantomjs.exe"
)
IF %processor_architecture% == x86 (
start java -jar %CURRENT_DIR%bin\selenium-server-%VERSION%.jar^
 -port 4455^
 -Dwebdriver.chrome.driver="%CURRENT_DIR%bin\win\x86\chromedriver.exe"^
 -Dwebdriver.chrome.logfile="%CURRENT_DIR%chromedriver.log"^
 -Dwebdriver.ie.driver="%CURRENT_DIR%bin\win\x86\IEDriverServer.exe"^
 -Dphantomjs.binary.path="%CURRENT_DIR%bin\win\x86\phantomjs.exe"
)
