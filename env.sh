#!/bin/bash

source ./os.sh

if [ "$os" == "ubuntu" ]; then 
  workspaceDir=/everteam
  workspaceIsMounted=no
  ip=`/sbin/ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
  psqlDir=/usr/lib/postgresql/9.4/bin
fi

if [ "$os" == "debian" ]; then 
  workspaceDir=/everteam
  workspaceIsMounted=no
  ip=`/sbin/ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
  psqlDir=/usr/lib/postgresql/9.4/bin
fi


if [ "$os" == "tinycore" ]; then 
  workspaceDir=/mnt/sda
  workspaceIsMounted=yes
  ip=`ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
fi

if [ "$os" == "centos" ]; then 
  workspaceDir=/everteam
  workspaceIsMounted=no
  
  v7=$(cat /etc/redhat-release | grep  -F " 7.")
  v6=$(cat /etc/redhat-release | grep  -F " 6.")

  if [ ! -z "$v7"]; then 
    ip=`/sbin/ifconfig eth0 | awk '/inet /{print substr($2,1)}'`
  fi
  if [ ! -z "$v6"]; then 
    ip=`ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`
  fi
  
  psqlDir=/usr/pgsql-9.4/bin
fi


