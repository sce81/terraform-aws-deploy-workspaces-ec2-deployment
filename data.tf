data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
//resource "null_resource" "branch" {
//    for_each = local.workspace_vars.es2_vars
//    vcs_branch = contains(each.key, "production") == true ? "main" : (contains(each.key, "staging") ? "staging" : "develop") 
//}
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
      "php_demo" = {
        "name" = {
          value       = "ec2-php"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "env" = {
          value       = "demo"
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
          value       = "AWS-php"
          description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
          category    = "terraform"
        },
        "VAULT_ADDR" = {
          value       = "https://vault-cluster-public-vault-485f7257.cbb919d0.z1.hashicorp.cloud:8200"
          description = "terraform variable for vault address"
          category    = "terraform"
        },
        "cross_account_role" = {
          value       = "public_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "datacenter" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "consul_cluster" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
      "nginx_demo" = {
        "name" = {
          value       = "ec2-nginx"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "env" = {
          value       = "production"
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
          value       = "Nginx"
          description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
          category    = "terraform"
        },
        "VAULT_ADDR" = {
          value       = "https://vault-cluster-public-vault-485f7257.cbb919d0.z1.hashicorp.cloud:8200"
          description = "terraform variable for vault address"
          category    = "terraform"
        },
        "cross_account_role" = {
          value       = "public_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "datacenter" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "consul_cluster" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
      "radar_demo" = {
        "name" = {
          value       = "ec2-vault-radar"
          description = "S3 Bucket for TFCE to TFC Migration Demos"
          category    = "terraform"
        },
        "env" = {
          value       = "demo"
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
          value       = "Nginx"
          description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
          category    = "terraform"
        },
        "VAULT_ADDR" = {
          value       = "https://vault-cluster-public-vault-485f7257.cbb919d0.z1.hashicorp.cloud:8200"
          description = "terraform variable for vault address"
          category    = "terraform"
        },
        "cross_account_role" = {
          value       = "public_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "datacenter" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "consul_cluster" = {
          value       = "consul-blue-demo"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
    }
  }
}