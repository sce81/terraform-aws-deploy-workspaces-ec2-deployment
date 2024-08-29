resource "tfe_project" "deploy_iam_role" {
  organization = "Direct-Line-Group"
  name         = "deploy_iam_role"
}

module "TFC_Workspace_iam_role_Deployments" {
  for_each                      = local.workspace_vars.iam_role_vars
  source                        = "app.terraform.io/Direct-Line-Group/engprod-awscp-tfc-iam/tfe"
  version                       = "1.0.0"
  name                          = "awscp_workspace_iam_role_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.iam_role_instance
  tfe_variables                 = each.value
  project_id                    = tfe_project.deploy_iam_role.id
  structured_run_output_enabled = "false"
  workspace_tags                = [each.key, "aws", "iam_role", "deployment", "platform"]
  variable_set                  = flatten([var.variable_sets])
  # sentinel_policy               = flatten(["Require-Resources-from-PMR", "Enforce-Tagging-Policy", var.sentinel_policies])
  auto_apply                    = false
  terraform_version             = var.terraform_version
  depends_on = [
    tfe_project.deploy_iam_role
  ]
}