# RDS Variables

variable "instance_class" {
  description = "Instance Class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_password" {
  type        = string
  default     = ""
}

variable "parameter_group" {
  type        = string
  default     = "default.mysql8.0"
}

variable "private_subnets" {
  type = list(string)
  default = [""]
}
