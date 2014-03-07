#!/usr/bin/env bash

MACHINE_OS=`uname`
MACHINE_TYPE=`uname -m`
BASEDIR=$(dirname $0)

if [ ${MACHINE_OS} == 'Linux' ]; then
 DRIVER_PATH="bin/linux"
elif [ ${MACHINE_OS} == 'Darwin' ]; then
 DRIVER_PATH="bin/mac"
else
 echo >&2 "Unknown *unix OS.  Aborting."; exit 1;
fi

# Add machine type to path
DRIVER_PATH="$BASEDIR/$DRIVER_PATH/$MACHINE_TYPE"

java -jar $BASEDIR/bin/selenium-server-standalone-2.40.0.jar\
 -port 4455\
 -Dwebdriver.chrome.driver="$DRIVER_PATH/chromedriver"\
 -Dwebdriver.chrome.logfile="chromedriver.log"\
 -Dphantomjs.binary.path="$DRIVER_PATH/phantomjs"
