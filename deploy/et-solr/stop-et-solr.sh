#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/stopSolr.log

echo
info "Stop Solr (see $logFile)"
echo

export CATALINA_HOME=/everteam/tomcat
export JAVA_HOME=/everteam/java

if [ -d "$(readlink -f /everteam/et-solr/)" ]; then 
        
    /everteam/et-solr/bin/solr stop -all > $logFile
    /everteam/et-zookeeper/bin/zkServer.sh stop >> $logFile
    
    rm -rf /everteam/home/et/zookeeper.out

fi
