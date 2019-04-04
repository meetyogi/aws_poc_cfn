# !/bin/bash
# Pushes customer compute and Yogi cicd templates to S3 in Yogi account

TEMPLATE_BUCKET_NAME=yogi-poc-cfn

aws s3 cp --exclude ".*swp" compute/ s3://$TEMPLATE_BUCKET_NAME/compute --recursive --only-show-errors --no-progress

aws s3 cp compute.cfn.yml s3://$TEMPLATE_BUCKET_NAME --only-show-errors --no-progress

aws s3 cp cicd.cfn.yml s3://$TEMPLATE_BUCKET_NAME --only-show-errors --no-progress

