output "ecr_cms_url" {
  description = "URL of the ECR CMS repository"
  value       = aws_ecr_repository.cms.repository_url
}

output "ecr_front_url" {
  description = "URL of the ECR Front repository"
  value       = aws_ecr_repository.frontend.repository_url
}
