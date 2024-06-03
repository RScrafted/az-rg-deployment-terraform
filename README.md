# Azure Resource Group Deployment with Terraform

## Overview
This project demonstrates a simple Azure deployment using Terraform. The main objective is to create an Azure Resource Group using Terraform, showcasing the basics of infrastructure as code (IaC) and how to integrate it with Azure.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) (v3.0.0 or higher)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (for authentication)
- [Visual Studio Code](https://code.visualstudio.com/) with the [Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

## Project Structure
```
azure-deployment-terraform/
│
├── README.md
├── main.tf
├── Script.ps1
└── .gitignore
```

## Terraform Configuration

### Providers and Resources
The configuration file `main.tf` contains the necessary code to create an Azure Resource Group. Here’s a breakdown of the code:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example_rg" {
  name     = "example_rg"
  location = "East US" # Instead of the display name, you can use the name "eastus"
}
```

### Explanation
- **terraform block**: Specifies the required provider (AzureRM) and its version.
- **provider "azurerm"**: Configures the AzureRM provider.
- **resource "azurerm_resource_group" "example_rg"**: Defines the Azure Resource Group resource with its name and location.

## Steps to Deploy

### 1. Clone the Repository
```sh
git clone https://github.com/your-username/az-rg-deployment-terraform.git
cd azure-deployment-terraform
```

### 2. Authenticate with Azure
Ensure you are authenticated with Azure CLI:
```sh
az login
```

### 3. Initialize Terraform
Initialize the project directory and download the necessary provider plugins:
```sh
terraform init
```

### 4. Plan the Deployment
Generate and show an execution plan:
```sh
terraform plan
```

### 5. Apply the Configuration
Apply the changes to reach the desired state of the configuration:
```sh
terraform apply
```
Type `yes` when prompted to confirm the deployment.

### 6. Verify the Deployment
You can verify the creation of the Resource Group via the Azure Portal or using Azure CLI:
```sh
az group show --name example_rg
```
or use terraform command to verify most recent deployment:
```sh
terraform show
```

## Cleanup
To remove the resources created by this project:
```sh
terraform destroy
```
Type `yes` when prompted to confirm the destruction.

## Contributing
Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## Acknowledgements
- [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/)
- [Azure Documentation](https://docs.microsoft.com/en-us/azure/)

---
