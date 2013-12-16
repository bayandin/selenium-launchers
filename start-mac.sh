#!/usr/bin/env bash

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
java -jar bin/selenium-server-standalone-2.39.0.jar\
 -port 4455\
 -Dwebdriver.chrome.driver="bin/mac/x86-64/chromedriver"\
 -Dwebdriver.chrome.logfile="chromedriver.log"\
 -Dphantomjs.binary.path="bin/mac/x86-64/phantomjs"
else
java -jar bin/selenium-server-standalone-2.39.0.jar\
 -port 4455\
 -Dwebdriver.chrome.driver="bin/mac/x86/chromedriver"\
 -Dwebdriver.chrome.logfile="chromedriver.log"\
 -Dphantomjs.binary.path="bin/mac/x86/phantomjs"
fi
