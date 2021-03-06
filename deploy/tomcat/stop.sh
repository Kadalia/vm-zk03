#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
info "Stop Tomcat INSTANCE"

export CATALINA_HOME=/everteam/INSTANCE
export JAVA_HOME=/everteam/java
export PATH=$PATH:$JAVA_HOME/bin/

rm -rf $CATALINA_HOME/logs/*

$CATALINA_HOME/bin/shutdown.sh > /dev/null
