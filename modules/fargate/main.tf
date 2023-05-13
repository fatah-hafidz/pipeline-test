resource "aws_ecs_cluster" "ecs-cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "task" {
  family                   = "HTTPserver"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecs-task.arn

  container_definitions = jsonencode([
    {
      name   = var.container_name
      image  = "${var.image_repo_url}:latest" #URI
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "svc" {
  name            = "${var.container_name}-Service"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task.id
  desired_count   = 1
  launch_type     = "FARGATE"
}

data "aws_iam_role" "ecs-task" {
  name = "ecsTaskExecutionRole"
}
