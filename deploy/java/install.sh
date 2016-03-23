#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

./deploy/java/download.sh /everteam/softs/jdk.tar.gz
./deploy/java/deploy.sh /everteam/softs/jdk.tar.gz
