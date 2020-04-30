#!/bin/bash -e

#
# Create the required DynamoDB table, it is used for locking to prevent multiple people from
# running terraform at the same time.
#
aws dynamodb create-table \
         --region us-east-1 \
         --table-name tf-global-lock \
         --attribute-definitions AttributeName=LockID,AttributeType=S \
         --key-schema AttributeName=LockID,KeyType=HASH \
         --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --profile=$1

#
# Create the required S3 bucket to store state.
#
aws s3api create-bucket \
	--region us-east-1 \
	--create-bucket-configuration LocationConstraint=us-east-2 \
	--bucket "smbaligh-tf-global-state" --profile=$1