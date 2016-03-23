#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logFile="/everteam/tmp/startPostgres.log"

echo
info "Start Postgres (see $logFile)"
echo

if [ -d "$(readlink -f /everteam/pg-data/)" ]; then 

    sudo -u postgres $psqlDir/pg_ctl start -D /everteam/pg-data/ -l $logFile > $logFile 2>&1

else

    error "No data in /everteam/pg-data/"

fi