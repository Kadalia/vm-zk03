#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam$1

echo
info "Deploy Zookeeper $deployFile"
echo

if [ ! -d "$(readlink -f /everteam/et-webapp/)" ]; then 

    #rm $deployFile
    error "Can't deploy Zookeeper: No webapp deployed !"

else
  
  if [ -d "$(readlink -f /everteam/et-zookeeper/)" ]; then 
    rm -rf $(readlink -f /everteam/et-zookeeper/)
  fi
  if [ -f "/everteam/et-zookeeper/" ]; then 
    rm /everteam/et-zookeeper/
  fi
  
  log=/everteam/tmp/log.txt
  
  cd /everteam/softs
  
  tar zxvf $deployFile > $log

  
  zookeeper=$(sed -n '1p' $log | sed -e 's@/.*@@')
  cd

  if [ ! -z "$zookeeper" ]; then 

    cp ./deploy/et-solr/c9.menus.* /everteam/home/c9.menus/
    ./deploy/et-zookeeper/config.js $ip

    zookeeperDir=/everteam/softs/$zookeeper

    rm $log
    rm $deployFile
  
    ln -s  $zookeeperDir /everteam/et-zookeeper
  
    success "zookeeper deployed to $zookeeperDir"
    info "Everteam platform needs to be restarted "
  
    else

      success "Unable to untar $deployFile"
    
    fi
fi
