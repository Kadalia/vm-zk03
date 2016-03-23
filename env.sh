#!/bin/bash

ubuntu=$(uname -v | grep "Ubuntu")
debian=$(uname -v | grep "Debian")
tinycore=$(uname -r | grep "3.16.6-tinycore")

if [ ! -z "$ubuntu" ]; then 
  workspaceDir=/everteam
  workspaceIsMounted=no
  os="ubuntu"
  ip=`/sbin/ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
  psqlDir=/usr/lib/postgresql/9.4/bin
fi

if [ ! -z "$debian" ]; then 
  workspaceDir=/everteam
  workspaceIsMounted=no
  os="debian"
  ip=`/sbin/ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
  psqlDir=/usr/lib/postgresql/9.4/bin
fi


if [ ! -z "$tinycore" ]; then 
  workspaceDir=/mnt/sda
  workspaceIsMounted=yes
  os="tinycore"
  ip=`ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
fi

if [ -f /etc/redhat-release ]; then 
  workspaceDir=/home/local/everteam
  workspaceIsMounted=no
  os="centos"
  ip=`/sbin/ifconfig eth0 | awk '/inet /{print substr($2,1)}'`
  psqlDir=/usr/pgsql-9.4/bin
fi



if [ -z "$os" ]; then 
	exit_failure "OS not supported !"
fi




