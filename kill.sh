#!/bin/bash
source ./deploy/tools.sh
source ./env.sh



if [ -z "$1" ]; then 

    error "No process to kill"

else
    
    process=/[e]verteam/$1

    id=$(ps -ef | grep $process | grep -v grep | awk '{print $2}') 

    if [ ! -z "$id" ]; then 
    
        info "kill process $1 pid=$id"
        echo $id | xargs kill -9
    fi
    
fi