
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh
    
webapp=/everteam$1
webappdir=${webapp%.war}
webappdir=${webappdir##*/}
    
if [ -z "$webappdir" ] ; then 
    error "missing parameter"
else

    webappdir=/everteam/softs/$webappdir
    
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

    if [ ! -d /everteam/home/docs ]; then 
        mkdir /everteam/home/docs/
    else
        rm -rf /everteam/home/docs/
    fi
    

    ./start.sh

fi

