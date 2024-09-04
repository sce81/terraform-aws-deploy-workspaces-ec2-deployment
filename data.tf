data "tfe_organization" "main" {
  name = var.organization
}

locals {
  vpc_lite_instance = [
    {
      identifier                 = "Direct-Line-Group/engprod-awscp-custom-vpc-lite"
      oauth_token_id             = var.oauth_token_id
      branch                     = "feature/awscp-5054"
    }
  ]

  workspace_vars = {
    vpc_lite_vars = {
      # "awsdlgctplatengdev" = {
      #   "project_name" = {
      #     value       = "awsdlgctplatengdev"
      #     description = "S3 Bucket for TFCE to TFC Migration Demos"
      #     category    = "terraform"
      #   },
      #   "account_id" = {
      #     value       = "411880710928"
      #     description = "Descriptive tag for tagging purpose"
      #     category    = "terraform"
      #   },
      #   "vpc_id_networking_account" = {
      #     value       = "vpc-069f5bb5c643bb815"
      #     description = "S3 Bucket for TFCE to TFC Migration Demos"
      #     category    = "terraform"
      #   },
      #   "subnet_cidrs" = {
      #     value       = join(", ", ["10.34.1.0/26","10.34.2.0/26","10.34.3.0/26"])
      #     description = "Descriptive tag for tagging purpose"
      #     category    = "terraform"
      #   },
      #   "vpc_cidr" = {
      #     value       = "10.34.0.0/20"
      #     description = "Descriptive tag for tagging purpose"
      #     category    = "terraform"
      #   },
      #   "availability_zones" = {
      #     value       = join(", ", ["eu-west-1a","eu-west-1b","eu-west-1c"])
      #     description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
      #     category    = "terraform"
      #   },
      #   "private_domain" = {
      #     value       = null
      #     description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
      #     category    = "terraform"
      #   },
      #   "public_domain" = {
      #     value       = null
      #     description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
      #     category    = "terraform"
      #   },
      #   "bucket_name" = {
      #     value       = "plat-dlgct-route53-hostedzone-bucket-381261984216"
      #     description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
      #     category    = "terraform"
      #   },
      #   "aws_region" = {
      #     value       = "eu-west-1"
      #     description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
      #     category    = "terraform"
      #   },
      # }
    #   "awsdlgctplatengprod" = {
    #     "project_name" = {
    #       value       = "awsdlgctplatengprod"
    #       description = "S3 Bucket for TFCE to TFC Migration Demos"
    #       category    = "terraform"
    #     },
    #     "account_id" = {
    #       value       = "037056631187"
    #       description = "Descriptive tag for tagging purpose"
    #       category    = "terraform"
    #     },
    #     "vpc_id_networking_account" = {
    #       value       = "vpc-069f5bb5c643bb815"
    #       description = "S3 Bucket for TFCE to TFC Migration Demos"
    #       category    = "terraform"
    #     },
    #     "subnet_cidrs" = {
    #       value       = join(", ", ["10.35.1.0/26","10.35.2.0/26","10.35.3.0/26"])
    #       description = "Descriptive tag for tagging purpose"
    #       category    = "terraform"
    #     },
    #     "vpc_cidr" = {
    #       value       = "10.35.0.0/20"
    #       description = "Descriptive tag for tagging purpose"
    #       category    = "terraform"
    #     },
    #     "availability_zones" = {
    #       value       = join(", ", ["eu-west-1a","eu-west-1b","eu-west-1c"])
    #       description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
    #       category    = "terraform"
    #     },
    #     "private_domain" = {
    #       value       = null
    #       description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
    #       category    = "terraform"
    #     },
    #     "public_domain" = {
    #       value       = null
    #       description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
    #       category    = "terraform"
    #     },
    #     "bucket_name" = {
    #       value       = "plat-dlgct-route53-hostedzone-bucket-381261984216"
    #       description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
    #       category    = "terraform"
    #     },
    #     "aws_region" = {
    #       value       = "eu-west-1"
    #       description = "Descriptive tag for tagging purpose. Pulls from HCP Packer"
    #       category    = "terraform"
    #     },
    #   }
    }
  }
}


# locals {
#   iam_role_instance = [
#     {
#       identifier                 = "Direct-Line-Group/engprod-awscp-tfc-iam"
#       oauth_token_id             = var.oauth_token_id
#       branch                     = "main"
#     }
#   ]

#   workspace_vars_iam = {
#     iam_role_vars = {
#       "awsdlgctplatengdev" = {
#         "role_name" = {
#           value       = "bxis_test_role"
#           category    = "terraform"
#         },
#         "account_id" = {
#           value       = "411880710928"
#           description = "Descriptive tag for tagging purpose"
#           category    = "terraform"
#         }
#       }
#     }
#   }
# }