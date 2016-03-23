
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

webappdir=$1
webapp=$2

if [ -z "$webapp" ] || [ -z "$webappdir" ]; then 
    error "missing parameters"
else

    webappdir=/everteam/softs/$1
    webapp=/everteam/deploy/et-webapp/$2
    
    echo
    info "Deploy $webapp to $webappdir"
    echo

    ./stop.sh

    if [ -d "$(readlink -f /everteam/et-webapp/)" ]; then 
        rm -rf $(readlink -f /everteam/et-webapp/)
    fi
    rm -rf /everteam/et-webapp > /dev/null

    
    
    mkdir $webappdir
    unzip -q $webapp -d $webappdir
    ln -s $webappdir /everteam/et-webapp
    
    ./deploy/et-webapp/config.js  $ip

    #rm $webapp
    cp ./deploy/et-webapp/c9.menus.* /everteam/home/c9.menus/
    ./deploy/tomcat/instance.sh et-tomcat 8080 8180 8280 8380

    mkdir -p /everteam/et-tomcat/conf/Catalina/localhost
    cp ./deploy/et-webapp/everteam.xml /everteam/et-tomcat/conf/Catalina/localhost/

    ./start.sh

fi

