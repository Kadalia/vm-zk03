#!/bin/bash

source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/start-it-tomcat.log

echo
info "Start it-tomcat (see $logFile)"

export CATALINA_HOME=/everteam/it-tomcat
export JAVA_HOME=/everteam/java

export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx2000m"

#sudo chmod 777 -R $CATALINA_HOME/temp
#sudo chmod 777 -R $CATALINA_HOME/logs

rm -rf $CATALINA_HOME/logs/*

$CATALINA_HOME/bin/startup.sh > $logFile 2>&1
