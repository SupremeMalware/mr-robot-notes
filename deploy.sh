#!/usr/bin/env bash

set -Eeuo pipefail

. .env

GREEN="\e[38;5;2m"
YELLOW="\e[38;5;226m"
RESET_COLOR="\e[0m"


export WORKINGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEBUG=${DEBUG:-}

if [[ -n $DEBUG ]]; then
  set -x
fi

if [[ -z $(aws s3 ls | grep "$SITE") ]]; then
  echo -e "${SITE} does not exist, creating...${RESET_COLOR}\n"
  aws s3api create-bucket --bucket "$SITE" --region $REGION --create-bucket-configuration LocationConstraint=$REGION
  aws s3api put-bucket-versioning --bucket "$SITE" --versioning-configuration Status=Enabled
fi

aws s3 sync ${WORKINGDIR}/site/ s3://${SITE}/

aws s3 website s3://${SITE}/ --index-document index.html --error-document error.html

aws s3api put-bucket-policy --bucket ${SITE} --policy file://policy.json

exit 0

