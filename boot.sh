#!/bin/bash

if [ -d "$(readlink -f /everteam/et-data)" ]; then 
  sudo chown -R everteam /var/run/postgresql 
fi


if [ -d "$(readlink -f /everteam)" ]; then 

  source ./deploy/tools.sh
  source ./env.sh
  echo
  success "Everteam boot"

  ./start-cloud9.sh &
  ./start.sh
else
  bash ./ZK/deploy/init.sh
  ./start-cloud9.sh &
  ./start.sh
fi



