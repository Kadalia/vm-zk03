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
  workspaceDir=/home/local/everteam
  workspaceIsMounted=no
  ip=`/sbin/ifconfig eth0 | awk '/inet /{print substr($2,1)}'`
  psqlDir=/usr/pgsql-9.4/bin
fi

