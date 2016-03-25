#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

info "Create workspace"

user=$(whoami)
if [ "$os" == "ubuntu" ] || [ "$os" == "debian" ] || [ "$os" == "centos" ];  then 
  sudo rm -rf $workspaceDir > /dev/null
  sudo mkdir $workspaceDir
  sudo chown $user $workspaceDir

  if [ ! "$workspaceDir" == "/everteam" ];  then 
    sudo ln -s $workspaceDir /everteam
  fi
  sudo chown $user /everteam
fi


if [ "$os" == "tinycore" ]; then 
  sudo ln -s $workspaceDir /everteam
  sudo chown $user /everteam
  sudo rm -rf /everteam/* > /dev/null

fi

ln -s /home/$(whoami)/ /everteam/home

cd /everteam
mkdir /everteam/softs
mkdir /everteam/tmp

# for postgres
chmod 777 /everteam/tmp

mkdir /everteam/deploy
mkdir /everteam/deploy/et-webapp
mkdir /everteam/deploy/et-solr
mkdir /everteam/deploy/et-zookeeper
mkdir /everteam/deploy/et-data
mkdir /everteam/deploy/et-licence
mkdir /everteam/deploy/et-deploy
mkdir /everteam/deploy/pg-webapp
mkdir /everteam/deploy/it-tomcat

mkdir /everteam/home/c9.menus
