#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
success "Stop Platform"

    #pid=$(ps -ef | awk '/[o]rg.apache.catalina.startup.Bootstrap/{print $2}')

if [ -d "$(readlink -f /everteam/et-solr)" ] && [ -d "$(readlink -f /everteam/et-zookeeper)" ]; then 
    ./stop-et-solr.sh
fi

if [ -d "$(readlink -f /everteam/it-webapp/)" ]; then 
    ./stop-it-tomcat.sh
fi

if [ -d "$(readlink -f /everteam/pg-webapp/)" ]; then 
      ./stop-pg-tomcat.sh
fi

if [ -d "$(readlink -f /everteam/et-webapp/)" ]; then 
      ./stop-et-tomcat.sh
fi

if [ -d "$(readlink -f /everteam/pg-data/)" ]; then 
  ./stop-postgres.sh
fi
