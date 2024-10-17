provider "aws" {
    region = "us-west-2"
}

resource "aws_ecr_repository" "catalogs" {
    name = "catalogs"
}

resource "null_resource" "docker_build_and_push" {
    provisioner "local-exec" {
        command = <<EOT
            docker build -t catalogs ../.
            aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query Account --output text).dkr.ecr.us-west-2.amazonaws.com
            docker tag catalogs:latest $(aws sts get-caller-identity --query Account --output text).dkr.ecr.us-west-2.amazonaws.com/catalogs:latest
            docker push $(aws sts get-caller-identity --query Account --output text).dkr.ecr.us-west-2.amazonaws.com/catalogs:latest
        EOT
    }

    depends_on = [aws_ecr_repository.catalogs]
}


resource "aws_ecs_cluster" "cluster_catalogs" {
    name = "cluster-catalogs"
}

resource "aws_ecs_task_definition" "task_catalogs" {
    family                   = "task-catalogs"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"

    container_definitions = jsonencode([
        {
            name      = "my-container"
            image     = "${aws_ecr_repository.catalogs.repository_url}:latest"
            essential = true
            portMappings = [
                {
                    containerPort = 80
                    hostPort      = 80
                }
            ]
        }
    ])
}

resource "aws_ecs_service" "service_catalogs" {
    name            = "service-catalogs"
    cluster         = aws_ecs_cluster.cluster_catalogs.id
    task_definition = aws_ecs_task_definition.task_catalogs.arn
    desired_count   = 1
    launch_type     = "FARGATE"

    network_configuration {
        subnets         = ["subnet-12345678"]
        security_groups = ["sg-12345678"]
    }

    depends_on = [aws_ecs_task_definition.task_catalogs]
}