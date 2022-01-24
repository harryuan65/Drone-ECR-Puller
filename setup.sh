#!/bin/sh
aws --version

aws configure set aws_access_key_id $AWS_ACCESS_KEY --profile default
aws configure set aws_secret_access_key $AWS_SECRET_KEY --profile default
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin $AWS_ECR_REGISTRY
