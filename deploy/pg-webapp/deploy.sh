
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
    
    if [ -d "$(readlink -f /everteam/pg-webapp/)" ]; then 
         ./stop-pg-tomcat.sh
        rm -rf $(readlink -f /everteam/pg-webapp/)
    fi
    rm -rf /everteam/pg-webapp > /dev/null


    ./deploy/tomcat/instance.sh pg-tomcat 8081 8181 8281 8381
    
    mkdir $webappdir
    unzip -q $webapp -d $webappdir
    ln -s $webappdir /everteam/pg-webapp
    
    #rm $webapp
    cp ./deploy/pg-webapp/c9.menus.* /everteam/home/c9.menus/
    mkdir -p /everteam/pg-tomcat/conf/Catalina/localhost
    cp ./deploy/pg-webapp/pgstudio.xml /everteam/pg-tomcat/conf/Catalina/localhost

    ./start-pg-tomcat.sh

fi

