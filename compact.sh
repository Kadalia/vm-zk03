#!/bin/bash
source ~/deploy/tools.sh
source ~/env.sh


echo
success "---------------------------------------------------------"
echo
info "Wait ..."
info "Wait ... until box automatically stop"
info "Run compact.cmd in host box (if windows OS )"
info "Launch vbox and wait for IDE to reconnect" 
echo
success "---------------------------------------------------------"


sudo dd if=/dev/zero of=/everteam/zerofillfile bs=1024k
sudo rm -rf /everteam/zerofillfile
sudo poweroff
