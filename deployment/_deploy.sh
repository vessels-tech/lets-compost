#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SITE_ID="$1"

if [ -z $SITE_ID ]; then
    echo 'Error. usage: ./_deploy.sh <site_id>'
    exit 1
fi


#set up environment variables and replace global site stuff with gulp
source "$DIR"/env_"$SITE_ID".sh
npm run replace #this creates the /tmp/prebuild folder

#build hugo to /tmp
cd /tmp/prebuild
hugo -d /tmp/$SITE_ID

#cleanup
rm -rf /tmp/prebuild
rm -rf /tmp/$SITE_ID

#deploy cloudformation

#upload to s3