#!/usr/bin/env bash

MACHINE_OS=`uname`
MACHINE_TYPE=`uname -m`
BASEDIR=$(dirname $0)
VERSION=$(cat ${BASEDIR}/selenium_version)
JAVA_SWITCHES=""
# By default java on linux uses /dev/random that can't provide enough entropy for ssd disks or virtual machines.
# https://code.google.com/p/selenium/wiki/FrequentlyAskedQuestions#Q:_Selenium_server_sometimes_takes_a_long_time_to_start_a_new_se
# https://code.google.com/p/selenium/issues/detail?id=1301
JAVA_SWITCHES="$JAVA_SWITCHES -Djava.security.egd=file:///dev/urandom"

if [ ${MACHINE_OS} == 'Linux' ]; then
  DRIVER_PATH="bin/linux"
elif [ ${MACHINE_OS} == 'Darwin' ]; then
  DRIVER_PATH="bin/mac"
else
  echo >&2 "Unknown *unix OS.  Aborting."; exit 1;
fi

# Add machine type to path
DRIVER_PATH="$BASEDIR/$DRIVER_PATH/$MACHINE_TYPE"

java $JAVA_SWITCHES -jar $BASEDIR/bin/selenium-server-standalone-$VERSION.jar\
  -port 4455\
  -Dwebdriver.chrome.driver="$DRIVER_PATH/chromedriver"\
  -Dwebdriver.chrome.logfile="chromedriver.log"\
  -Dphantomjs.binary.path="$DRIVER_PATH/phantomjs"\
  -Dphantomjs.cli.args="--webdriver-logfile=phantomjs.log"
