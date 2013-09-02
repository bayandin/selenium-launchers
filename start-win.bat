@echo off
IF %processor_architecture% == AMD64 (
start java -jar bin\selenium-server-standalone-2.35.0.jar^
 -port 4455^
 -Dwebdriver.chrome.driver="bin\win\x86-64\chromedriver.exe"^
 -Dwebdriver.chrome.logfile="chromedriver.log"^
 -Dwebdriver.ie.driver="bin\win\x86-64\IEDriverServer.exe"^
 -Dphantomjs.binary.path="bin\win\x86-64\phantomjs.exe"
)
IF %processor_architecture% == x86 (
start java -jar bin\selenium-server-standalone-2.35.0.jar^
 -port 4455^
 -Dwebdriver.chrome.driver="bin\win\x86\chromedriver.exe"^
 -Dwebdriver.chrome.logfile="chromedriver.log"^
 -Dwebdriver.ie.driver="bin\win\x86\IEDriverServer.exe"^
 -Dphantomjs.binary.path="bin\win\x86\phantomjs.exe"
)
