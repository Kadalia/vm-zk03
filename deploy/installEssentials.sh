#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/installEssentials.log

info "Install essentials (see $logFile)"

if [ "$os" == "ubuntu" ] || [ "$os" == "debian" ]; then
  sudo apt-get update  > $logFile 2>&1
  sudo apt-get -y install build-essential >> $logFile 2>&1
  sudo apt-get -y install g++ >> $logFile 2>&1
  sudo apt-get -y install curl >> $logFile 2>&1  
  
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - >> $logFile 2>&1  
  sudo apt-get -y install nodejs >> $logFile 2>&1
  sudo apt-get -y install nodejs-legacy >> $logFile 2>&1
  sudo npm -g install npm@latest >> $logFile 2>&1
  npm install libxmljs >> $logFile 2>&1
  npm install request >> $logFile 2>&1
  npm install request-progress >> $logFile 2>&1
  npm install googleapis >> $logFile 2>&1

  sudo apt-get -y install python >> $logFile 2>&1
  sudo apt-get -y install unzip >> $logFile 2>&1  

  # node will listen on port 80 without elevation
  sudo apt-get -y install libcap2-bin >> $logFile 2>&1
  sudo setcap cap_net_bind_service=+ep `readlink -f \`which node\``
  
  sudo apt-get -y install postgresql >> $logFile 2>&1
  sudo systemctl disable postgresql.service >> $logFile 2>&1
  sudo usermod -G postgres everteam >> $logFile 2>&1
  sudo usermod -G everteam postgres >> $logFile 2>&1
  
  # needed by solr
  sudo apt-get -y install lsof >> $logFile 2>&1
  
fi

if [ "$os" == "centos" ]; then 
  sudo yum groupinstall -y development > $logFile 2>&1
  sudo yum -y install glibc-static >> $logFile 2>&1
  sudo yum -y install g++ >> $logFile 2>&1
  
  # Python ... 2.7 is needed. CentOS 6 comes with 2.6 :-(
  sudo yum -y install python >> $logFile 2>&1
  v7=$(cat /etc/redhat-release | grep  -F " 7.")
  v6=$(cat /etc/redhat-release | grep  -F " 6.")

  if [ ! -z "$v6" ]; then
    sudo yum -y update >> $logFile 2>&1
    sudo yum -y install centos-release-SCL >> $logFile 2>&1
  fi

  sudo yum -y install curl >> $logFile 2>&1  
  sudo yum -y install unzip >> $logFile 2>&1  
  sudo yum -y install wget >> $logFile 2>&1 
  
  curl --silent --location https://rpm.nodesource.com/setup | sudo bash - >> $logFile 2>&1 
  sudo yum -y install nodejs >> $logFile 2>&1
  sudo npm -g install npm@latest >> $logFile 2>&1
  npm install libxmljs >> $logFile 2>&1
  npm install request >> $logFile 2>&1
  npm install request-progress >> $logFile 2>&1
  npm install googleapis >> $logFile 2>&1  

  # node will listen on port 80 without elevation
  sudo yum -y install libcap2-bin >> $logFile 2>&1 
  sudo setcap cap_net_bind_service=+ep `readlink -f \`which node\``
  
  sudo yum -y install postgresql >> $logFile 2>&1
  sudo systemctl disable postgresql.service >> $logFile 2>&1
  sudo useradd -a -G postgres everteam >> $logFile 2>&1

  # needed by solr
  sudo yum -y install lsof >> $logFile 2>&1
  
fi


#if [ "$os" == "tinycore" ]; then 
#  # Nothing to do ... as nothing couldn't be installed
#  echo
#fi




