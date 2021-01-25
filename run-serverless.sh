#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo -e "
Usage: run-serverless.sh COMMAND [environment]

Runs serverless with COMMAND to the given environment, assuming JEL_OPS_PATH has the repo managing the requisite terraform resources.
"
  exit 1
fi

if [[ -z "$JEL_OPS_PATH" ]]; then
  echo -e "To use this deploy script, you need to clone out the jel-ops repo

git clone git@github.com:jel-app/jel-ops.git

Then set JEL_OPS_PATH to point to the cloned repo."
  exit 1
fi


COMMAND=$1
ENVIRONMENT=$2
[[ -z "$ENVIRONMENT" ]] && ENVIRONMENT=dev

DIR=$(pwd)
cp serverless.public.yml serverless.yml
sls $COMMAND --stage $ENVIRONMENT
