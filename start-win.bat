@echo off

set CURRENT_DIR=%~dp0
set /p VERSION=<%CURRENT_DIR%selenium_version
set ARCH=%processor_architecture%

set CHROMEDRIVER=%CURRENT_DIR%bin\win\chromedriver.exe
if not exist "%CHROMEDRIVER%" (
    set CHROMEDRIVER=%CURRENT_DIR%bin\win\%ARCH%\chromedriver.exe
)

set PHANTOMJS=%CURRENT_DIR%bin\win\phantomjs.exe
if not exist "%PHANTOMJS%" (
    set PHANTOMJS=%CURRENT_DIR%bin\win\%ARCH%\phantomjs.exe
)

set IEDRIVER=%CURRENT_DIR%bin\win\IEDriverServer.exe
if not exist "%IEDRIVER%" (
    set IEDRIVER=%CURRENT_DIR%bin\win\%ARCH%\IEDriverServer.exe
)

start java ^
 -Dos.name=WINDOWS^
 -Dwebdriver.chrome.driver="%CHROMEDRIVER%"^
 -Dwebdriver.chrome.logfile="%CURRENT_DIR%chromedriver.log"^
 -Dwebdriver.ie.driver="%IEDRIVER%"^
 -Dphantomjs.binary.path="%PHANTOMJS%"^
 -jar %CURRENT_DIR%bin\selenium-server-standalone-%VERSION%.jar^
 -port 4455
)
