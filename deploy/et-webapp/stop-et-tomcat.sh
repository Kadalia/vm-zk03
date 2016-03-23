#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
info "Stop et-tomcat"

export CATALINA_HOME=/everteam/et-tomcat
export JAVA_HOME=/everteam/java
export PATH=$PATH:$JAVA_HOME/bin/

rm -rf $CATALINA_HOME/logs/*

$CATALINA_HOME/bin/shutdown.sh > /dev/null
