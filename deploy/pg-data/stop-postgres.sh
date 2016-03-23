#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

logFile=/everteam/tmp/stopPostgres.log

echo
info "Stop Postgres (see $logFile)"
echo

if [ -d "$(readlink -f /everteam/pg-data/)" ]; then 

    sudo -u postgres $psqlDir/pg_ctl stop -D /everteam/pg-data/ > $logFile 2>&1
else

    error "No data in /everteam/pg-data/"

fi