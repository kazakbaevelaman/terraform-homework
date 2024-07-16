**Terraform HW4: **

# Using tfvars Files with Terraform
   This documentation will guide you through the process of using a .tfvars file in your Terraform configuration. The .tfvars file allows you to define variable values in a separate file, making your Terraform code cleaner and more modular. Additionally using tfvars files you can deploy and manage aws resources in different regions using single configuration file. 

1. ## Create a variables.tf File
Define the variables you will use in your Terraform configuration in a variables.tf file. This file should contain the variable declarations, including any default values if applicable.

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
}

2. ## Create a terraform.tfvars File (e.g ohio.tfvars)
Create a terraform.tfvars file to specify the values for the variables defined in variables.tf. This file should be placed in the same directory as your Terraform configuration files.

    region            = "us-east-2"
    key_name          = "my-key"

3. ## Modify the main.tf File
Ensure that your main.tf file uses the variables defined in variables.tf. Here is the provided configuration with variable references:

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

4. ## Initialize Terraform
Run terraform init to initialize the Terraform working directory. This command downloads the necessary provider plugins and prepares the directory for use.

    terraform init

5. ## Apply the Configuration
Run terraform apply to apply the configuration. Terraform will automatically load the variable values from the ohio.tfvars file.

    terraform apply -var-file ohio.tfvars 

6. ## Verify the Configuration
After running terraform apply, verify that the resources have been created in your AWS account as expected.

7. ## Destroy the Configuration
Run terraform destroy to destroy the resources created by your Terraform configuration. This command reads the current state and destroys all the resources defined in your configuration.

  terraform destroy -var-file ohio.tfvars 

8. ## Additionaly you can use terraform validate command to check the syntax and validity of your Terraform files

  terraform validate

# Conclusion
By using a terraform.tfvars file, you can separate variable values from your main configuration file, making your Terraform code cleaner and easier to manage. This approach also simplifies managing different resources in different regions by simply changing the terraform.tfvars file in the apply command.