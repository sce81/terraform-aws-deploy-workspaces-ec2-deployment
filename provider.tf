terraform {
  cloud {

    organization = "Direct-Line-Group"

    workspaces {
      name = "terraform-aws-deploy-workspaces-iam-role-deployment"
    }
  }
}