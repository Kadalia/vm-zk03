#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

info "Deploy Java $1"

if [ -d "$(readlink -f /everteam/java)" ]; then 
    rm -rf $(readlink -f /everteam/java)
fi

rm -rf /everteam/java > /dev/null

log=/everteam/tmp/log.txt
cd /everteam/softs

tar zxvf $1 > $log
rm $1

java=$(sed -n '1p' $log | sed -e 's@/.*@@')
javaDir=/everteam/softs/$java

rm $log

ln -s  $javaDir /everteam/java

JAVA_HOME=$javaDir
export JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/lib
export PATH

success "java deployed to $javaDir"
#$javaDir/bin/java -version

