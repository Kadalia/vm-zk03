#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
success "---------------------------------------------------------"
info "Everteam reset"
success "---------------------------------------------------------"
echo

read -p "Are you sure ? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

  if [ -d "$(readlink -f /everteam)" ]; then 
    rm -rf "$(readlink -f /everteam)"
    sudo rm -rf /everteam
  fi

fi

