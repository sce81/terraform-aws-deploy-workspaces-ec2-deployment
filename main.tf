resource "tfe_project" "deploy_ec2" {
  organization = "HashiCorp_TFC_Automation_Demo"
  name         = "deploy_ec2"
}
module "TFC_Workspace_EC2_Deployments" {
  for_each                      = local.workspace_vars.ec2_vars
  source                        = "app.terraform.io/HashiCorp_TFC_Automation_Demo/workspace-management/tfe"
  version                       = "2.0.10"
  name                          = "aws_workspace_ec2_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.ec2_instance
  tfe_variables                 = each.value
  project_id                    = tfe_project.deploy_ec2.id
  structured_run_output_enabled = "false"
  workspace_tags                = [each.key, "aws", "ec2", "deployment", "platform", "vault_demo"]
  variable_set                  = flatten([var.variable_sets])
  sentinel_policy               = flatten(["Require-Resources-from-PMR", "Enforce-Tagging-Policy", var.sentinel_policies])
  auto_apply                    = true
  terraform_version             = var.terraform_version
  depends_on = [
    tfe_project.deploy_ec2
  ]
}