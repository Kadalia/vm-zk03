
#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployModule=$1
deployGoogleFileId=$2

./deploy/download-from-google.js $deployModule $deployGoogleFileId
./deploy/$deployModule/deploy.sh $deployModule/$deployGoogleFileId
