#!/bin/bash

ubuntu=$(uname -v | grep "Ubuntu")
debian=$(uname -v | grep "Debian")
tinycore=$(uname -r | grep "3.16.6-tinycore")

if [ ! -z "$ubuntu" ]; then 
  os="ubuntu"
fi

if [ ! -z "$debian" ]; then 
  os="debian"
fi

if [ ! -z "$tinycore" ]; then 
  os="tinycore"
fi

if [ -f /etc/redhat-release ]; then 
  os="centos"
fi

if [ -z "$os" ]; then 
	exit_failure "OS not supported !"
fi




