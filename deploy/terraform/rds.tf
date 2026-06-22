resource "aws_db_subnet_group" "app" {
  name       = "${var.app_name}-db"
  subnet_ids = data.aws_subnets.default.ids
}

resource "aws_db_instance" "app" {
  identifier             = "${var.app_name}-db"
  engine                 = "postgres"
  engine_version         = "16.4"
  instance_class         = "db.t4g.micro"
  allocated_storage      = 20
  db_name                = "rails_docker_aws_production"
  username               = "postgres"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.app.name
  vpc_security_group_ids = [aws_security_group.db.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
}
