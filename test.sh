# !/bin/bash
# Sets up compute infrastructure in customer account

STACK_NAME=cmpt0
AZ_0=us-east-1a
AZ_1=us-east-1d
DB_PASSWORD=
MODEL_BUCKET=test-model-bucket
BUILD_ACCOUNT_ID=
DEPLOYMENT_ID=my-test
SEED_IMAGE=
ENV=dev
TEMPLATE_BUCKET_NAME=yogi-poc-cfn

aws --region us-east-1 cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-url https://s3.amazonaws.com/$TEMPLATE_BUCKET_NAME/compute.cfn.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters \
  ParameterKey=TemplateBucketName,ParameterValue=$TEMPLATE_BUCKET_NAME \
  ParameterKey=ModelBucketName,ParameterValue=$MODEL_BUCKET \
  ParameterKey=AvailabilityZone0,ParameterValue=$AZ_0 \
  ParameterKey=AvailabilityZone1,ParameterValue=$AZ_1 \
  ParameterKey=BuildAccountId,ParameterValue=$BUILD_ACCOUNT_ID \
  ParameterKey=EnvironmentName,ParameterValue=$ENV \
  ParameterKey=DeploymentId,ParameterValue=$DEPLOYMENT_ID \
  ParameterKey=SeedDockerImage,ParameterValue=$SEED_IMAGE \
  ParameterKey=DatabasePassword,ParameterValue=$DB_PASSWORD

