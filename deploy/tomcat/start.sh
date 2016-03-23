#!/bin/bash

source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/start-INSTANCE.log

echo
info "Start INSTANCE (see $logFile)"

export CATALINA_HOME=/everteam/INSTANCE
export JAVA_HOME=/everteam/java

export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx2000m"

rm -rf $CATALINA_HOME/logs/*

$CATALINA_HOME/bin/startup.sh > $logFile 2>&1
