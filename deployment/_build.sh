#!/usr/bin/env bash

source ~/.bash_profile #loads npm properly

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SITE_ID="$1"

if [ -z $SITE_ID ]; then
    echo 'Error. usage: ./_build.sh <site_id>'
    exit 1
fi


#set up environment variables and replace global site stuff with gulp

source "$DIR"/env_"$SITE_ID".sh
npm run replace #this creates the config.yaml file
mv /tmp/gulp/config.template.yaml ../site/config.yaml

#build hugo to /tmp
cd "$DIR"/../site
hugo -d /tmp/$SITE_ID

echo "build hugo to /tmp/$SITE_ID"