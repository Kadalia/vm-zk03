
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam$1

echo
info "Deploy data $deployFile"
echo

if [ ! -d "$(readlink -f /everteam/et-webapp/)" ]; then 

    rm $deployFile
    error "Can't deploy data: No webapp deployed !"

else

    ./stop-et-tomcat.sh

    if [ ! -d "$(readlink -f /everteam/pg-data/)" ]; then 
        ./deploy/pg-data/init.sh 
        ./start-postgres.sh
    fi
    

    logFile="/everteam/tmp/createdb.log"
    info "createdb (see $logFile)"

    sleep 10
    sudo sudo -u postgres $psqlDir/createdb everteam > $logFile 2>&1
    
    logFile="/everteam/tmp/loaddb.log"
    info "loaddb (see $logFile)"

    sudo sudo -u postgres psql -d everteam -f $deployFile > $logFile 2>&1
 
    sudo sudo -u postgres $psqlDir/createuser everteam -d >> $logFile 2>&1
    sudo sudo -u postgres psql -d everteam -c "ALTER USER everteam WITH PASSWORD 'everteam';" >> $logFile 2>&1
    sudo sudo -u postgres psql -d everteam -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO everteam;" >> $logFile 2>&1
    sudo sudo -u postgres psql -d everteam -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public to everteam;" >> $logFile 2>&1
 
    
    rm $deployFile

    cp ./deploy/et-data/params.xml /everteam/et-webapp/
    cp ./deploy/et-data/c9.menus.* /everteam/home/c9.menus/

    if [ -d "$(readlink -f /everteam/pg-webapp/)" ]; then 
        cp ./deploy/et-data/et-data.jsp /everteam/pg-webapp/
    fi    

    ./start-et-tomcat.sh
    
fi
