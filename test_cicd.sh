#!/bin/bash

DEPLOYMENT_STACK_NAME=cmpt0
STACK_NAME=$DEPLOYMENT_STACK_NAME-cicd
MODEL_BUCKET=TEST
DEPLOYMENT_ACCOUNT_ID=
BASE_ECR_IMAGE_ACCOUNT_ID=
DEPLOYMENT_ID=my-test
PROFILE=burner
ENV=dev

GITHUB_USER=
GITHUB_TOKEN=

GIT_REPO_API=compute-example-api
GIT_REPO_WORKER=compute-example-worker
GIT_BRANCH_API=master
GIT_BRANCH_WORKER=master

TEMPLATE_BUCKET_NAME=poc-compute-example-cfn

aws cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-url https://s3.amazonaws.com/$TEMPLATE_BUCKET_NAME/cicd.cfn.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --profile $PROFILE \
  --parameters \
  ParameterKey=EnvironmentName,ParameterValue=$ENV \
  ParameterKey=DeploymentId,ParameterValue=$DEPLOYMENT_ID \
  ParameterKey=DeploymentAccountId,ParameterValue=$DEPLOYMENT_ACCOUNT_ID \
  ParameterKey=DeploymentStackName,ParameterValue=$DEPLOYMENT_STACK_NAME \
  ParameterKey=ModelBucketName,ParameterValue=$MODEL_BUCKET \
  ParameterKey=GitSourceRepoApi,ParameterValue=$GIT_REPO_API \
  ParameterKey=GitSourceRepoWorker,ParameterValue=$GIT_REPO_WORKER \
  ParameterKey=GitBranchApi,ParameterValue=$GIT_BRANCH_API \
  ParameterKey=GitBranchWorker,ParameterValue=$GIT_BRANCH_WORKER \
  ParameterKey=GitHubToken,ParameterValue=$GITHUB_TOKEN \
  ParameterKey=GitHubUser,ParameterValue=$GITHUB_USER \
  ParameterKey=BaseEcrImageAccountId,ParameterValue=$BASE_ECR_IMAGE_ACCOUNT_ID



