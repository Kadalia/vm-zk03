#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

./deploy/tomcat/download.sh /everteam/softs/tomcat.tar.gz
./deploy/tomcat/deploy.sh /everteam/softs/tomcat.tar.gz



