
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh


echo
info "Init data"
echo

if [ -d "$(readlink -f /everteam/pg-data)" ]; then 
    sudo rm -rf $(readlink -f /everteam/pg-data/)
fi

sudo rm -rf /everteam/pg-data >/dev/null

mkdir /everteam/home/pg-data
ln -s /everteam/home/pg-data /everteam/pg-data
cp ./deploy/pg-data/c9.menus.* /everteam/home/c9.menus/

logFile="/everteam/tmp/initdb.log"
info "initdb (see $logFile)"
sudo chown postgres /everteam/home/pg-data
sudo -u postgres $psqlDir/initdb -D /everteam/home/pg-data > $logFile 2>&1

cp ./deploy/pg-data/start-postgres.sh /everteam/home/
cp ./deploy/pg-data/stop-postgres.sh /everteam/home/




