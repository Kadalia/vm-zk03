#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

c9sdk=/everteam/softs/c9sdk

logfile=/everteam/tmp/downloadCloud9.log
info "Download Cloud9 (see $logfile)"
git clone git://github.com/c9/core.git $c9sdk > $logfile 2>&1

if [ "$os" == "tinycore" ]; then 
  logfile=/everteam/tmp/installCloud9.log
  info "Install Cloud9 (see $logfile)"
  sudo $c9sdk/scripts/install-sdk.sh > $logfile 2>&1
else
  logfile=/everteam/tmp/installCloud9.log
  info "Install Cloud9 (see $logfile)"
  $c9sdk/scripts/install-sdk.sh > $logfile 2>&1
fi

cp -R ./deploy/cloud9/c9.ide.everteam $c9sdk/plugins
cp ./deploy/cloud9/client-workspace-everteam.js $c9sdk/configs

cp ./deploy/cloud9/c9.menus.* /everteam/home/c9.menus

success "Cloud9 deployed to $c9sdk"


