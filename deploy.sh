#!/usr/bin/env bash

set -Eeuo pipefail

DEBUG=${DEBUG:-}

if [[ -n $DEBUG ]]; then
  set -x
fi

aws s3 cp ~/Documents/Mr.Robot/ s3://mr-robot.jamesgrow.dev/ --recursive 
