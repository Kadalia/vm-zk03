
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployFile=/everteam$1

echo
info "Deploy licence $deployFile"
echo

if [ ! -d "$(readlink -f /everteam/et-webapp/)" ]; then 

    #rm $deployFile
    error "Can't deploy licence: No webapp deployed !"

else
    
    cp $deployFile /everteam/et-webapp/apps/license/conf
    #rm  $deployFile
    info "Everteam webapp needs to be restarted "
    
fi
