#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logfile=/everteam/tmp/downloadJava.log
info "Download Java jdk-8u73 (see $logfile)"

cd /everteam/softs

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.tar.gz > $logfile 2>&1
mv /everteam/softs/jdk-8u73-linux-x64.tar.gz $1

#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz > $logfile 2>&1
#mv jdk-7u79-linux-x64.tar.gz $1


