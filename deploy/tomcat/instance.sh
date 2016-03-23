#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

info "Instance Tomcat $1 port $2"

if [ ! -d "$(readlink -f /everteam/tomcat/)" ]; then 
    error "No tomcat found !"
    exit
fi

if [  -z "$1" ] || [  -z "$2" ] || [  -z "$3" ] || [  -z "$4" ] || [  -z "$5" ]; then 
    error "Missing parameter !"
    exit
fi

instance=$1
instanceDir=/everteam/softs/tomcat-$instance
p8080=$2
p8443=$3
p8009=$4
p8005=$5

if [ -d "$(readlink -f /everteam/$instance/)" ]; then 
    rm -rf $(readlink -f /everteam/$instance/)
fi

rm -rf /everteam/$instance > /dev/null


cp -R $(readlink -f /everteam/tomcat/) $instanceDir
ln -s $instanceDir /everteam/$instance

start=/everteam/home/start-$instance.sh
stop=/everteam/home/stop-$instance.sh

cp ./deploy/tomcat/start.sh $start
sed -i s/INSTANCE/$instance/g  $start
cp ./deploy/tomcat/stop.sh  $stop
sed -i s/INSTANCE/$instance/g  $stop



sed -i s/8080/$p8080/g  $instanceDir/conf/server.xml
sed -i s/8443/$p8443/g  $instanceDir/conf/server.xml
sed -i s/8009/$p8009/g  $instanceDir/conf/server.xml
sed -i s/8005/$p8005/g  $instanceDir/conf/server.xml


success "Tomcat instance to $instanceDir"

