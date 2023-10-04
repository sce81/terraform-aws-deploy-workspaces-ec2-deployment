//provider "hcp" {
//}

terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "deploy-workspaces-deploy-ec2"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.48.0"
      source  = "hashicorp/tfe"
    }
//    hcp = {
//      source  = "hashicorp/hcp"
//      version = "~> 0.72.1"
//    }
  }
}