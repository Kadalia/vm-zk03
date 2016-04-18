#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/startSolr.log

echo
info "Start Solr (see $logFile)"
echo

export CATALINA_HOME=/everteam/tomcat
export JAVA_HOME=/everteam/java

if [ -d "$(readlink -f /everteam/et-solr/)" ]; then 

    /everteam/et-zookeeper/bin/zkServer.sh start > $logFile 2>&1
    sleep 20
    
    cd /everteam/et-solr/bin

    if [ ! -f  /everteam/et-zookeeper/secured ]; then 
        echo put security stufs to solr
        ../server/scripts/cloud-scripts/zkcli.sh -zkhost localhost:2181 -cmd putfile /security.json ../server/solr/security.json
        ../server/scripts/cloud-scripts/zkcli.sh -zkhost localhost:2181 -cmd putfile /solr.xml ../server/solr/solr.xml
        echo secured > /everteam/et-zookeeper/secured
    fi
    

    cd /everteam/et-solr

    ./bin/solr start -c -p 8983 -z $ip:2181 >> $logFile 2>&1
fi
