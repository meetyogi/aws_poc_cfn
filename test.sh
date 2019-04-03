#!/bin/bash

STACK_NAME=cmpt0
AZ_0=us-east-1a
AZ_1=us-east-1d
DB_PASSWORD=k2EadfJs23aaH4da3w
MODEL_BUCKET=TEST
BUILD_ACCOUNT_ID=
DEPLOYMENT_ID=my-test
SEED_IMAGE=CHANGE_SEED_IMAGE_IN_YOUR_ACCOUNT
ENV=dev
TEMPLATE_BUCKET_NAME=poc-compute-example-cfn

aws cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-url https://s3.amazonaws.com/$TEMPLATE_BUCKET_NAME/compute.cfn.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters \
  ParameterKey=ModelBucketName,ParameterValue=$MODEL_BUCKET \
  ParameterKey=AvailabilityZone0,ParameterValue=$AZ_0 \
  ParameterKey=AvailabilityZone1,ParameterValue=$AZ_1 \
  ParameterKey=BuildAccountId,ParameterValue=$BUILD_ACCOUNT_ID \
  ParameterKey=EnvironmentName,ParameterValue=$ENV \
  ParameterKey=DeploymentId,ParameterValue=$DEPLOYMENT_ID \
  ParameterKey=BuildAccountId,ParameterValue=$BUILD_ACCOUNT_ID \
  ParameterKey=SeedDockerImage,ParameterValue=$SEED_IMAGE \
  ParameterKey=DatabasePassword,ParameterValue=$DB_PASSWORD

