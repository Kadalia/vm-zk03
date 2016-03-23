#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam/$1

info "Deploy Intalio $deployFile"

if [ -d "$(readlink -f /everteam/it-tomcat/)" ]; then 
    rm -rf $(readlink -f /everteam/it-tomcat/)
fi

if [ -f "/everteam/it-tomcat" ]; then 
    rm /everteam/it-tomcat
fi

log=/everteam/tmp/log.txt

cp ./deploy/it-tomcat/c9.menus.* /everteam/home/c9.menus/
cp ./deploy/it-tomcat/start-it-tomcat.sh /everteam/home/
cp ./deploy/it-tomcat/stop-it-tomcat.sh /everteam/home/

cd /everteam/softs

tar zxvf $deployFile > $log
#rm -rf $deployFile

tomcat=$(sed -n '1p' $log | sed -e 's@/.*@@')
tomcatDir=/everteam/softs/$tomcat

rm $log

ln -s  $tomcatDir /everteam/it-tomcat

sed -i s/8080/8082/g  $tomcatDir/conf/server.xml
sed -i s/8443/8182/g  $tomcatDir/conf/server.xml
sed -i s/8009/8282/g  $tomcatDir/conf/server.xml
sed -i s/8005/8382/g  $tomcatDir/conf/server.xml

cd
./deploy/it-data/deploy.sh

sed -i s/case_demo_db/localhost/g  $tomcatDir/var/config/resources.properties
sed -i s/bpmsdb/intalio/g  $tomcatDir/var/config/resources.properties
sed -i s/.user=bpmsusr/.user=everteam/g  $tomcatDir/var/config/resources.properties
sed -i s/.password=bpms/.password=everteam/g  $tomcatDir/var/config/resources.properties

success "Intalio deployed to $tomcatDir"

./start-it-tomcat.sh

