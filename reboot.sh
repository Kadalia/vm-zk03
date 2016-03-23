#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

echo
success "---------------------------------------------------------"
info "Reboot"
success "---------------------------------------------------------"
echo

./stop.sh
sudo reboot
