#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
success "Start Platform"

if [ -d "$(readlink -f /everteam/pg-data)" ]; then 
  ./start-postgres.sh
fi


if [ -d "$(readlink -f /everteam/et-solr)" ] && [ -d "$(readlink -f /everteam/et-zookeeper)" ]; then 
   ./deploy/et-solr/start.js $ip    
   ./start-et-solr.sh
fi

    
if [ -d "$(readlink -f /everteam/et-webapp/)" ]; then 
  ./deploy/et-webapp/start.js $ip    
  ./start-et-tomcat.sh
  debug "wait for everteam  ..."

  until $(curl --output /dev/null --silent --head --fail http://$ip:8080/everteam/start); do
    printf '.'
    sleep 2
  done

fi

if [ -d "$(readlink -f /everteam/it-webapp/)" ]; then 
  ./start-it-tomcat.sh
  debug "wait for postgres studio  ..."
fi


if [ -d "$(readlink -f /everteam/pg-webapp/)" ]; then 
  ./start-pg-tomcat.sh
  debug "wait for postgres studio  ..."
fi

./message.sh http://$ip
