# ASG Variables

variable "name" {
  description = "Resource name"
  type        = string
  default     = "asg"
}

variable "instance_type" {
  description = "Type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  type        = number
  description = "Number of instances to launch"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Max Number of instances"
  default     = 5
}

variable "min_size" {
  type        = number
  description = "Min Number of instances"
  default     = 1
}


variable "private_subnets" {
  type        = list(string)
  default     = [""]
}