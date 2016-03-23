#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
success "---------------------------------------------------------"
info "Shutdown"
success "---------------------------------------------------------"
echo

./stop.sh
sudo poweroff
