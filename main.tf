resource "tfe_project" "deploy_vpc_lite" {
  organization = "Direct-Line-Group"
  name         = "deploy_vpc_lite"
}

module "TFC_Workspace_vpc_lite_Deployments" {
  for_each                      = local.workspace_vars.vpc_lite_vars
  source                        = "app.terraform.io/Direct-Line-Group/engprod-awscp-workspace-mangement/tfe"
  version                       = "1.0.0"
  name                          = "awscp_workspace_vpc_lite_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.vpc_lite_instance
  tfe_variables                 = each.value
  project_id                    = tfe_project.deploy_vpc_lite.id
  structured_run_output_enabled = "false"
  workspace_tags                = [each.key, "aws", "vpc_lite", "deployment", "platform"]
  variable_set                  = flatten([var.variable_sets])
  # sentinel_policy               = flatten(["Require-Resources-from-PMR", "Enforce-Tagging-Policy", var.sentinel_policies])
  auto_apply                    = false
  terraform_version             = var.terraform_version
  depends_on = [
    tfe_project.deploy_vpc_lite
  ]
}