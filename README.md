### Resource Group Deployment using Terraform

---

#### Project Overview

This project demonstrates the deployment of an Azure Resource Group using Terraform. It includes a PowerShell script to run terraform deployment process and a GNU General Public License.

#### Prerequisites

Before using the Terraform configuration, ensure you have the following installed:

1. **Terraform**: Download and install from [terraform.io](https://www.terraform.io/downloads.html).
2. **Azure CLI**: Download and install from [docs.microsoft.com](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Git**: Download and install from [git-scm.com](https://git-scm.com/).
4. **PowerShell**: Available by default on Windows; for other operating systems, download from [Microsoft](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell).

---

### Project Structure

```
azure-deployment-terraform/
│
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── Script.ps1
├── license.md
└── .gitignore
```

---

### Terraform Configurations

#### `variables.tf`

This file defines the input variables used in the Terraform configuration.

```hcl
variable "azurerm_resource_group" {
  description = "The name of the resource group"
  type        = string
  default     = "RGDeployment-Test"
}

variable "azurerm_location" {
  description = "The Azure region in which resources will be provisioned"
  type        = string
  default     = "eastus"
}
```

#### `main.tf`

This file defines the provider and the resources to be created.

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

resource "azurerm_resource_group" "RGDeployment-Test" {
  name     = var.azurerm_resource_group
  location = var.azurerm_location
}
```

##### Explanation
- **terraform block**: Specifies the required provider (AzureRM) and its version.
- **provider "azurerm"**: Configures the AzureRM provider.
- **resource "azurerm_resource_group" "RGDeployment-Test"**: Defines the Azure Resource Group resource with its name and location.

#### `outputs.tf`

This file defines the outputs for the Terraform configuration.

```hcl
output "resource_group_name" {
  value = "The name of the provisioned resource group is: ${azurerm_resource_group.RGDeployment-Test.name}"
}
```

---

### Steps to Deploy

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/your-username/resource-group-deployment.git
   cd resource-group-deployment
   ```

2. **Configure Azure CLI**:
   Ensure you are logged in to Azure CLI and set the appropriate subscription:
   ```sh
   az login
   az account set --subscription "your-subscription-id"
   ```

3. **Run the commands from PowerShell Script (using F8 shourcut)**:
   The provided `Script.ps1` provides the Terraform commands in sequential process. Open PowerShell and navigate to the project directory, then run each one by one:
   ```sh
   .\Script.ps1
   ```

   The script will:
   - Initialize the Terraform working directory.
   - Validate the configuration.
   - Create a plan for the deployment.
   - Apply the plan (provisioning the resources).
   - Validate the output by showing the resource group details.
   - Optionally, destroy the resources to clean up.

---

### Cleanup

To destroy the resources and clean up your environment, you can use the `terraform destroy` command. The `Script.ps1` also includes this step at the end:

```sh
terraform destroy
```

---

### Potential Enhancements [Update 06-Jun-2024]

Following projected enhancements completed - Please visit my [terraform-azure-vm-automation](https://github.com/RScrafted/terraform-azure-vm-automation) repository.

This project can be enhanced by automating the addition of more resources into the deployment. Future enhancements may include:

- Adding virtual networks, subnets, and network interfaces.
- Provisioning virtual machines with specified configurations.
- Implementing advanced networking features such as network security groups and load balancers.
- Integrating monitoring and logging solutions like Azure Monitor and Log Analytics.

I am in the process of automating this script to include a Azure Virtual Machine and other related resources in a spearate project. [to be published soon]

(~~) I am working on automating this script including a VM and other related resoueces. (~~) [Updated](https://github.com/RScrafted/terraform-azure-vm-automation)
---

### Contributing

Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change. I have started a discussion, and everyone can bring ideas there.

---

## Acknowledgements
- [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/)
- [Azure Documentation](https://docs.microsoft.com/en-us/azure/)
- **PowerShell**: Scripting language used for automation.
- **GitHub**: Platform for version control and collaboration.

---
