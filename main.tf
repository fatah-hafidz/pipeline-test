module "ecr" {
  source = "./modules/ecr"

  name   = var.ecr_name
  region = var.ecr_region
}

module "codebuild" {
  depends_on = [module.ecr]
  source     = "./modules/codebuild"

  name           = var.codebuild_name
  region         = "ap-southeast-1"
  repo_url       = module.ecr.image_repo_url
  container_name = var.container_name

}
module "pipeline" {
  source = "./modules/codepipeline"

  repo_owner       = var.repo_owner
  repo_name        = var.repo_name
  repo_branch      = var.repo_branch
  github_token     = var.github_token
  pipeline_name    = "lalala"
  codebuild_name   = module.codebuild.codebuild_name
  ecs_cluster_name = var.cluster_name
  ecs_service_name = var.container_name
}

module "fargate" {
  source = "./modules/fargate"

  cluster_name   = var.cluster_name
  container_name = var.container_name
  container_port = var.container_port
  image_repo_url = module.ecr.image_repo_url
}
