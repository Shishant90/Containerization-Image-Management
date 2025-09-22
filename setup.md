# Containerized Application with Docker and ECR

A simple Flask application containerized with Docker and deployed to AWS ECR.

## Setup

1. **Initialize Terraform:**
   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

2. **Build and Push to ECR:**
   ```bash
   chmod +x scripts/push.sh
   ./scripts/push.sh [tag]
   ```

3. **Run Locally:**
   ```bash
   cd app
   docker build -t my-app .
   docker run -p 8080:8080 my-app
   ```

## Endpoints

- `GET /` - Hello message
- `GET /health` - Health check