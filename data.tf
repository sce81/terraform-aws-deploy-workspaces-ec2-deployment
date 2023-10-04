data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
locals {

  ec2_instance = [
    {
      identifier                 = "sce81/terraform-aws-ec2-root-module"
      github_app_installation_id = data.tfe_github_app_installation.github.id
      branch                     = "main"
    }
  ]


  workspace_vars = {
    ec2_vars = {
      "pki_demo" = {
        "name" = {
          value       = "ec2-pki"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "env" = {
          value       = "vault-demo"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
        "vpc_name" = {
          value       = "demo-public-vpc"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "subnet_name" = {
          value       = "private"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
        "instance_type" = {
          value       = "t3.small"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
        "ami_name" = {
          value       = "Golden-Image"
          description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
          category    = "terraform"
        },
      },
    }
  }
}