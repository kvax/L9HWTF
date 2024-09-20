# RDS Main

resource "aws_db_instance" "mysql" {
  identifier              = "rds-mysql-instance"
  engine                  = "mysql"
  instance_class          = var.instance_class
  allocated_storage       = 20
  max_allocated_storage   = 100
  db_name                 = "mydb"
  username                = "admin"
  password                = var.db_password
  parameter_group_name    = var.parameter_group
  multi_az                = true
  publicly_accessible     = false
  storage_encrypted       = true
  //vpc_security_group_ids  = [var.rds_sg]
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnets
}
