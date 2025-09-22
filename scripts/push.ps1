param(
    [string]$ImageTag = "latest"
)

# Get AWS account ID and region
$AWS_ACCOUNT_ID = (aws sts get-caller-identity --query Account --output text)
$AWS_REGION = if ($env:AWS_REGION) { $env:AWS_REGION } else { "us-east-1" }
$REPOSITORY_NAME = "containerized-app"

# ECR repository URL
$ECR_REPOSITORY_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}"

Write-Host "Building Docker image..."
docker build -t "${REPOSITORY_NAME}:${ImageTag}" ./app

Write-Host "Tagging image for ECR..."
docker tag "${REPOSITORY_NAME}:${ImageTag}" "${ECR_REPOSITORY_URL}:${ImageTag}"

Write-Host "Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY_URL

Write-Host "Pushing image to ECR..."
docker push "${ECR_REPOSITORY_URL}:${ImageTag}"

Write-Host "Image pushed successfully: ${ECR_REPOSITORY_URL}:${ImageTag}"