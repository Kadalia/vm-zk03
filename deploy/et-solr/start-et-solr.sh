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
    
    cd /everteam/et-solr/bin
    
    ../server/scripts/cloud-scripts/zkcli.sh -zkhost localhost:2181 -cmd putfile /security.json ../server/solr/security.json
    ../server/scripts/cloud-scripts/zkcli.sh -zkhost localhost:2181 -cmd putfile /solr.xml ../server/solr/solr.xml  
    #../server/scripts/cloud-scripts/zkcli.sh -z localhost:2181 -cmd upconfig -d ../server/solr/configsets/et_testcorpus_config/conf -n ettestconf

    cd /everteam/et-solr

    ./bin/solr start -c -p 8983 -z $ip:2181 >> $logFile 2>&1
fi

    

