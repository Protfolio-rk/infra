resource "aws_ecr_repository" "cms" {
  name = "cms-repo"
}

resource "aws_ecr_repository" "frontend" {
  name = "frontend-repo"
}
