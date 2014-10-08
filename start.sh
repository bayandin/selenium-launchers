#!/usr/bin/env bash

MACHINE_OS=`uname`
MACHINE_TYPE=`uname -m`
BASEDIR=$(dirname $0)
VERSION=$(cat ${BASEDIR}/selenium_version)

if [ ${MACHINE_OS} == 'Linux' ]; then
  DRIVER_PATH="bin/linux"
elif [ ${MACHINE_OS} == 'Darwin' ]; then
  DRIVER_PATH="bin/mac"
else
  echo >&2 "Unknown *nix OS. Aborting..."
  exit 1
fi

CHROMEDRIVER="$BASEDIR/$DRIVER_PATH/chromedriver"
if [[ ! -f $CHROMEDRIVER ]]; then
    CHROMEDRIVER="$BASEDIR/$DRIVER_PATH/$MACHINE_TYPE/chromedriver"
fi

PHANTOMJS="$BASEDIR/$DRIVER_PATH/phantomjs"
if [[ ! -f $PHANTOMJS ]]; then
    PHANTOMJS="$BASEDIR/$DRIVER_PATH/$MACHINE_TYPE/phantomjs"
fi

java -jar $BASEDIR/bin/selenium-server-standalone-$VERSION.jar \
  -port 4455\
  -Dwebdriver.chrome.driver="$CHROMEDRIVER" \
  -Dwebdriver.chrome.logfile="chromedriver.log" \
  -Dphantomjs.binary.path="$PHANTOMJS" \
  -Dphantomjs.cli.args="--webdriver-logfile=phantomjs.log"
