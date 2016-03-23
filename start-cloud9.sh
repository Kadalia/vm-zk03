#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
info "Start Cloud9"

logFile=/everteam/tmp/startCloud9.log

node /everteam/softs/c9sdk/server.js --workspacetype everteam -l $ip -p 80 -w /everteam -a : > $logFile 2>&1 &
debug "Cloud9 $ip (see $logFile)"
