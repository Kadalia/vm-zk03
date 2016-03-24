#!/bin/bash

chmod 777 -R ./ZK/*
cp -R ./ZK/* .
rm -rf ./ZK

source ./os.sh

# for ifconfig ...
if [ "$os" == "centos" ]; then 
  sudo yum -y install net-tools
fi

source ./deploy/tools.sh
source ./env.sh

echo
success "---------------------------------------------------------"
info "Everteam init"
success "---------------------------------------------------------"
echo

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

  ./deploy/createWorkspace.sh
  ./deploy/installEssentials.sh

  ./deploy/cloud9/install.sh
  ./deploy/java/install.sh
  ./deploy/tomcat/install.sh

fi
