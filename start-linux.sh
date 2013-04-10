#!/usr/bin/env bash

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	java -jar bin/selenium-server-standalone-2.32.0.jar -port 4455 -Dwebdriver.chrome.driver="bin/linux/x86-64/chromedriver" -Dphantomjs.binary.path="bin/linux/x86-64/phantomjs"
else
	java -jar bin/selenium-server-standalone-2.32.0.jar -port 4455 -Dwebdriver.chrome.driver="bin/linux/x86/chromedriver" -Dphantomjs.binary.path="bin/linux/x86/phantomjs"
fi
