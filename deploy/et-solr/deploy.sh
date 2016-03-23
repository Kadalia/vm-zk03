#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam$1

echo
info "Deploy solr $deployFile"
echo


if [ ! -d "$(readlink -f /everteam/et-webapp/)" ]; then 

    #rm $deployFile
    error "Can't deploy Solr: No webapp deployed !"

else
  
  if [ -d "$(readlink -f /everteam/et-solr/)" ]; then 
    rm -rf $(readlink -f /everteam/et-solr/)
  fi
  if [ -f "/everteam/et-solr" ]; then 
    rm -rf /everteam/et-solr
  fi
  
  log=/everteam/tmp/log.txt
  
  cp ./deploy/et-solr/c9.menus.* /everteam/home/c9.menus/
  ./deploy/et-solr/config.js $ip
    
  cd /everteam/softs
  
  tar zxvf $deployFile > $log
  
  solr=$(sed -n '1p' $log | sed -e 's@/.*@@')
  cd

  if [ ! -z "$solr" ]; then 

      solrDir=/everteam/softs/$solr
      
      rm $log
      rm $deployFile
      
      ln -s  $solrDir /everteam/et-solr
      cp ./deploy/et-solr/start-et-solr.sh /everteam/home
      cp ./deploy/et-solr/stop-et-solr.sh /everteam/home
      
      success "solr deployed to $solrDir"
    else

      success "Unable to untar $deployFile"
    
    fi
fi
