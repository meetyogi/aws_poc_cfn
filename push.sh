#!/bin/bash

TEMPLATE_BUCKET_NAME=yogi-poc-cfn

aws s3 cp --exclude ".*swp" compute/ s3://$TEMPLATE_BUCKET_NAME/compute --recursive --only-show-errors --no-progress

aws s3 cp compute.cfn.yml s3://$TEMPLATE_BUCKET_NAME --only-show-errors --no-progress

aws s3 cp cicd.cfn.yml s3://$TEMPLATE_BUCKET_NAME --only-show-errors --no-progress

