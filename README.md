### Resource Group Deployment using Terraform

---

#### Project Overview

This project demonstrates the deployment of an Azure Resource Group using Terraform. It includes a PowerShell script to run terraform deployment and destroy process commands and a GNU General Public License.

#### Prerequisites

Ensure the following are installed:

1. **Terraform**: Download and install from [terraform.io](https://www.terraform.io/downloads.html).
2. **Azure CLI**: Download and install from [docs.microsoft.com](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
3. **Git**: Download and install from [git-scm.com](https://git-scm.com/).
4. **PowerShell**: Available by default on Windows; for other operating systems, download from [Microsoft](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell).

Note: IDE use is Visual Studio Code.

---

### Project Structure

```
azure-deployment-terraform/
│
├── .gitignore
├── LICENSE.md
├── README.md
├── Script.ps1
├── main.tf
├── outputs.tf
├── terraform.tfvars
└── variables.tf
```

---

### Terraform Configurations

#### `variables.tf`

This file defines the input variables used in the Terraform configuration.
The value of the variables are provided from `terraform.tfvars`.

```hcl
variable "azurerm_resource_group" {
  description = "The name of the resource group"
}

variable "azurerm_location" {
  description = "The Azure region in which resources will be provisioned"
}
```

#### `main.tf`

This file defines the provider and the resource group to be created.

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
  tags     = var.tags
}
```

##### Explanation
- **terraform block**: Specifies the required provider `(AzureRM)` and its version.
- **provider "azurerm"**: Configures the AzureRM provider.
- **resource "azurerm_resource_group" "RGDeployment-Test"**: Defines the Azure Resource Group resource with its name, location and tags. The tags are created for easy identification and cost analysis purpose.

#### `outputs.tf`

This file defines the outputs for the Terraform configuration.

```hcl
output "resource_group_name" {
  value = "The name of the provisioned resource group is: ${azurerm_resource_group.RGDeployment-Test.name}"
}
```

---

### Steps to Deploy

1. **Initialize Git Repository**:
Refer to my detailed steps [Guide](https://github.com/RScrafted/guide-how-to-git/tree/main). Alternatively, you may clone my crafted `how-to-git guide`.
   ```sh
   git clone https://github.com/RScrafted/guide-how-to-git.git
   cd guide-how-to-git
   ```

2. **Configure Azure CLI**:
   Ensure you are logged in to Azure CLI and set the appropriate subscription:
   ```sh
   az login
   az account set --subscription "your-subscription-id"
   ```

3. **Run the commands from PowerShell Script (using F8 shourcut)**:
   The provided `Script.ps1` provides the Terraform commands in sequential process. Open PowerShell and navigate to the project directory, then run each one by one:
   

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

### Potential Enhancements [Updated!]

I aim to enhance by adding additional resources into the deployment and automate them. Future enhancements may include:

- Adding `virtual networks`, `subnets`, and `network interfaces`.
- Provisioning `virtual machines` with specified configurations.
- Implementing advanced networking features such as `network security groups` and `load balancers`.
- Implement backup strategy to backup `.tfstate`.

#### Updated from `06-Jun-2024`:
- Potential enhancements In progress - Please visit my [terraform-azure-vm-automation](https://github.com/RScrafted/terraform-azure-vm-automation) repository.
- I am working to optimize and automate the IaC using CI/CD

---

### Contributing

Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change. I have started a discussion, and everyone can bring ideas there.

---

## Acknowledgements
- [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/)
- [Azure Documentation](https://docs.microsoft.com/en-us/azure/)
- **PowerShell**: PowerShell file used to centralize terraform commands related to this project.
- **GitHub**: Platform for version control and collaboration.

---
