resource "aws_ecr_repository" "repo" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
}

output "image_repo_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "image_repo_arn" {
  value = aws_ecr_repository.repo.arn
}
