#!/bin/bash

app_name=$1

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

if [[ "$app_name" != "api" ]] && [[ "$app_name" != "web" ]]; then
    echo "Illegal parameters"
    exit 1
fi

cd /www/vm

if [[ "$app_name" == "api" ]]; then
    PORT=5000 pm2 restart api
fi

if [[ "$app_name" == "web" ]]; then
    PORT=8080 API_HOST="https://api.wireapps.com" pm2 restart web
fi
