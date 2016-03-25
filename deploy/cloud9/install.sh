#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

c9sdk=/everteam/softs/c9sdk

logfile=/everteam/tmp/downloadCloud9.log
info "Download Cloud9 (see $logfile)"
git clone git://github.com/c9/core.git $c9sdk > $logfile 2>&1

  logfile=/everteam/tmp/installCloud9.log
  info "Install Cloud9 (see $logfile)"

if [ "$os" == "tinycore" ]; then 
  sudo $c9sdk/scripts/install-sdk.sh > $logfile 2>&1
else

  if [ "$os" == "centos" ]; then 
    v7=$(cat /etc/redhat-release | grep  -F " 7.")
    v6=$(cat /etc/redhat-release | grep  -F " 6.")
    if [ ! -z "$v6" ]; then
      export logfile
      scl enable python27 bash -c "$c9sdk/scripts/install-sdk.sh > $logfile 2>&1"
    else
      $c9sdk/scripts/install-sdk.sh > $logfile 2>&
    fi
  else
    $c9sdk/scripts/install-sdk.sh > $logfile 2>&1
  fi
fi

cp -R ./deploy/cloud9/c9.ide.everteam $c9sdk/plugins
cp ./deploy/cloud9/client-workspace-everteam.js $c9sdk/configs

cp ./deploy/cloud9/c9.menus.* /everteam/home/c9.menus

success "Cloud9 deployed to $c9sdk"


