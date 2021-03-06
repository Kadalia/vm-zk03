#!/bin/bash
source ./deploy/tools.sh
source ./env.sh

deployModule=$1
deployGoogleFileId=$2

echo
success "---------------------------------------------------------"
info "Deploy $1 from Google ($2)"
success "---------------------------------------------------------"
echo

./deploy/google-authorize.js
deployFile=$(./deploy/google-download.js $deployModule $deployGoogleFileId)
./deploy/$deployModule/deploy.sh $deployFile
