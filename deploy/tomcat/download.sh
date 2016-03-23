#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logfile=/everteam/tmp/downloadTomcat.log
info "Download Tomcat 7.0.68 (see $logfile)"

cd /everteam/softs
wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.68/bin/apache-tomcat-7.0.68.tar.gz > $logfile 2>&1
mv /everteam/softs/apache-tomcat-7.0.68.tar.gz $1
