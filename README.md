# Containerization Image Management

A Flask application containerized with Docker and deployed to AWS ECR, showcasing modern DevOps practices.

## 🚀 Features

- **Flask Web Application** - Personal profile API
- **Docker Containerization** - Multi-stage build optimization
- **AWS ECR Integration** - Automated image registry
- **Terraform Infrastructure** - Infrastructure as Code
- **PowerShell Automation** - Windows-compatible deployment scripts

## 📋 Prerequisites

- Docker Desktop
- AWS CLI configured
- Terraform installed
- PowerShell (Windows)

## 🛠️ Setup

### 1. Create ECR Repository
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 2. Build and Push to ECR
```powershell
.\scripts\push.ps1 v1.0
```

### 3. Run Locally
```powershell
cd app
docker build -t my-app .
docker run -p 8080:8080 my-app
```

## 🌐 API Endpoints

- `GET /` - Personal profile information
- `GET /health` - Health check endpoint

## 📁 Project Structure

```
├── app/
│   ├── main.py           # Flask application
│   ├── requirements.txt  # Python dependencies
│   └── Dockerfile        # Container configuration
├── terraform/
│   ├── main.tf          # ECR repository
│   ├── provider.tf      # AWS provider
│   ├── variables.tf     # Input variables
│   └── outputs.tf       # Output values
├── scripts/
│   └── push.ps1         # Build and push script
└── README.md
```

## 👨💻 Author

**Shishant Kanojia**
- Location: New Delhi, India
- Focus: Containerization and Cloud Technologies

## 📄 License

This project is open source and available under the MIT License.