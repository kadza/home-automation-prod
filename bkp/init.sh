#!/bin/bash
# NOTE !!! aws cli must be installed

cd "$(dirname "$0")"

set -o allexport; source ../.env; set +o allexport

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
FILE="$(aws s3 ls $AWS_S3_BUCKET_NAME --recursive | sort | tail -n 1 | awk '{print $4}')"
aws s3 cp s3://$AWS_S3_BUCKET_NAME/$FILE ./data/backup.tar.gz

mkdir tmp
tar -C ./tmp -xvf ./data/backup.tar.gz