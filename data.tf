data "tfe_organization" "main" {
  name = var.organization
}

locals {
  iam_role_instance = [
    {
      identifier                 = "Direct-Line-Group/engprod-awscp-tfc-iam"
      oauth_token_id             = var.oauth_token_id
      branch                     = "main"
    }
  ]

  workspace_vars = {
    iam_role_vars = {
      "awsdlgctplatengdev" = {
        "role_name" = {
          value       = "bxis_test_role"
          category    = "terraform"
        },
        "account_id" = {
          value       = "411880710928"
          description = "Descriptive tag for tagging purpose"
          category    = "terraform"
        }
      }
    }
  }
}