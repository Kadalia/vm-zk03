
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam/$1

echo
info "Deploy et-deploy $deployFile"
echo

if [ ! -d "$(readlink -f /everteam/et-webapp/)" ]; then 

    #rm $deployFile
    error "Can't deploy licence: No webapp deployed !"

else

    deployDir=/everteam/tmp/et-deply
    unzip -q $deployFile -d $deployDir    

fi
