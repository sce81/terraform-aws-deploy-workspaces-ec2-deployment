variable "organization" {
  default     = "Direct-Line-Group"
  type        = string
  description = "workspace to deploy to"
}

variable "github_installation_id" {
  type        = string
  description = "VCS installation ID to access repo"
  default     = null
}

variable "automation_git_branch" {
  type        = string
  description = "branch of repo to pull from VCS"
  default     = "main"
}

variable "sentinel_policies" {
  type        = list(string)
  description = "Additional Sentinel Policies to be added to environment"
  default     = []
}
variable "variable_sets" {
  type        = list(string)
  description = "Workspace Variable Sets to be added to environment"
  default     = []
}

variable "terraform_version" {
  type        = string
  default     = "~>1.9.0"
  description = "Optional override for workspace Terraform Version"
}

variable "oauth_token_id" {
  type        = string
  default     = null
  description = "oauth_token_id for integration"
}