#!/bin/bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

aws --region "${AWS_DEFAULT_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}-ecr-repositories" \
    --capabilities CAPABILITY_IAM \
    --template-file "${DIR}/ecr-repositories.yaml" \
    --parameter-overrides \
    TellerImageName="${TELLER_IMAGE_NAME}"
