//provider "hcp" {
//}

terraform {
  cloud {

    organization = "Direct-Line-Group"

    workspaces {
      name = "terraform-aws-deploy-workspaces-vpc-lite-deployment"
    }
  }
}