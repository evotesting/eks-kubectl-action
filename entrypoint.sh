#!/bin/sh

set -e

export AWS_ACCESS_KEY_ID="$INPUT_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$INPUT_AWS_SECRET_ACCESS_KEY"

echo "aws version"

aws --version

echo "Attempting to update kubeconfig for aws"

aws eks --region "$INPUT_AWS_REGION" update-kubeconfig --name "$INPUT_CLUSTER_NAME"

echo "Attempting to run provided command"
echo '' >> ~/script.sh
echo '# Commands:' >> ~/script.sh
echo "${INPUT_COMMAND}" >> ~/script.sh

sh ~/script.sh


kubectl "$@"
