#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export AWS_PROFILE=vessels-lewis.daly
export AWS_REGION=ap-southeast-2

SITE_ID="$1"

if [ -z $SITE_ID ]; then
    echo 'Error. usage: ./_deploy.sh <site_id>'
    exit 1
fi


#set up environment variables and replace global site stuff with gulp
source "$DIR"/env_"$SITE_ID".sh
$DIR/_build.sh $SITE_ID

#deploy cloudformation
cd $DIR
aws cloudformation deploy \
  --template-file ./resources.yml \
  --stack-name "$STACK_NAME" \
  --region "$AWS_REGION" \
  --parameter-overrides \
    HostedZoneName=$BASE_URL. \
    RootDomainName=$BASE_URL \
    AcmCertificateArn=$ACM_CERTIFICATE_ARN


#upload to s3
aws s3 sync /tmp/$SITE_ID s3://$S3_BUCKET_NAME

#invalidate cache?


#cleanup
rm -rf /tmp/$SITE_ID
rm -rf $DIR/../site/config.yaml