//data "hcp_packer_image" "Golden-Image" {
//  bucket_name     = "Golden-Image"
//  channel         = "latest"
//  cloud_provider  = "aws"
//  region          = "eu-west-1"
//}
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
          value       = "ec2_pki"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "env" = {
          value       = "vault_demo"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
        "vpc_name" = {
          value       = "public"
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
          //value       = data.hcp_packer_image.Golden-Image.cloud_image_id
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
        "key_name" = {
          value       = "AWS S3 Bucket for storing Terraform CE Statefiles"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        },
      },

    }
  }
}