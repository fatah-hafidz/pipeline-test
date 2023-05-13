# create variables with type string for ecr_name, ecr_region, codebuild_name, repo_owner, repo_branch, repo_name, github_token
variable "ecr_name" {
  type = string
}

variable "ecr_region" {
  type = string
}

variable "codebuild_name" {
  type = string
}

variable "repo_owner" {
  type = string
}

variable "repo_branch" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "github_token" {
  type = string
}

variable "cluster_name" {
  type = string
}
variable "container_name" {
  type = string
}
variable "container_port" {
  type = string
}
