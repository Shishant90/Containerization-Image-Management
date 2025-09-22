#!/bin/bash

# Get AWS account ID and region
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=${AWS_REGION:-eu-north-1}
REPOSITORY_NAME="containerized-app"
IMAGE_TAG=${1:-latest}

# ECR repository URL
ECR_REPOSITORY_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}"

echo "Building Docker image..."
docker build -t ${REPOSITORY_NAME}:${IMAGE_TAG} ./app

echo "Tagging image for ECR..."
docker tag ${REPOSITORY_NAME}:${IMAGE_TAG} ${ECR_REPOSITORY_URL}:${IMAGE_TAG}

echo "Logging into ECR..."
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPOSITORY_URL}

echo "Pushing image to ECR..."
docker push ${ECR_REPOSITORY_URL}:${IMAGE_TAG}

echo "Image pushed successfully: ${ECR_REPOSITORY_URL}:${IMAGE_TAG}"