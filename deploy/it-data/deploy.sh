
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh


echo
info "Deploy data $deployFile"
echo

if [ ! -d "$(readlink -f /everteam/it-tomcat/)" ]; then 

    rm $deployFile
    error "Can't deploy data: No intalio webapp deployed !"

else
    deployFile=/everteam/it-tomcat/databases/Postgres/BPMS.sql

    if [ ! -d "$(readlink -f /everteam/pg-data/)" ]; then 
       ./deploy/pg-data/init.sh 
    fi
    

    logFile="/everteam/tmp/createdb.log"
    info "createdb (see $logFile)"

    sudo -u postgres $psqlDir/createdb intalio > $logFile 2>&1
    
    logFile="/everteam/tmp/loaddb.log"
    info "loaddb (see $logFile)"

    # MOUAIS ....
    sudo chmod -R 777 /everteam/it-tomcat/databases/   
    
    sudo -u postgres psql -d intalio -f $deployFile > $logFile 2>&1
 
    sudo -u postgres psql -d intalio -c "ALTER USER everteam WITH PASSWORD 'everteam';" >> $logFile 2>&1
    sudo -u postgres psql -d intalio -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO everteam;" >> $logFile 2>&1
    sudo -u postgres psql -d intalio -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public to everteam;" >> $logFile 2>&1
 
    cp ./deploy/it-data/c9.menus.* /everteam/home/c9.menus/
    
    if [ -d "$(readlink -f /everteam/pg-webapp/)" ]; then 
        cp ./deploy/it-data/it-data.jsp /everteam/pg-webapp/
    fi    


    
fi
