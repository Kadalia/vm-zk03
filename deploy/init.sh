#!/bin/bash

source ./ZK/deploy/tools.sh

echo
success "---------------------------------------------------------"
info "Everteam init"
success "---------------------------------------------------------"
echo

./ZK/deploy/installEssentials.sh

source ./ZK/env.sh


debug "os:$os"
debug "ip:$ip"
debug "workspaceDir:$workspaceDir"
debug "workspaceIsMounted:$workspaceIsMounted"

if [ -z "$ip" ]; then 

  echo
  error "No IP ... check network !"
  echo
  
  rm -rf ./ZK

else

  echo
  success "Please be patient !"
  echo
  
  chmod 777 -R ./ZK/*
  
  cp -R ./ZK/* .
  rm -rf ./ZK
  
  ./deploy/createWorkspace.sh
  
  ./deploy/cloud9/install.sh
  ./deploy/java/install.sh
  ./deploy/tomcat/install.sh

fi
