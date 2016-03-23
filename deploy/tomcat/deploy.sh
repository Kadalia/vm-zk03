#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

info "Deploy Tomcat $1"

if [ -d "$(readlink -f /everteam/tomcat/)" ]; then 
    rm -rf $(readlink -f /everteam/tomcat/)
fi

if [ -f "/everteam/tomcat" ]; then 
    rm -rf /everteam/tomcat
fi

log=/everteam/tmp/log.txt


cp ./deploy/tomcat/c9.menus.* /everteam/home/c9.menus

cd /everteam/softs

tar zxvf $1 > $log
rm -rf $1

tomcat=$(sed -n '1p' $log | sed -e 's@/.*@@')
tomcatDir=/everteam/softs/$tomcat

rm $log

ln -s  $tomcatDir /everteam/tomcat

success "Tomcat deployed to $tomcatDir"

