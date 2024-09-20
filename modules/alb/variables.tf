# ALB Variables

variable "alb_sg" {
  type = string
  default = "dafault"
}

variable "vpc_id" {
  type = string
  default = "MyVPC"
}

variable "public_subnets" {
  type = list(string)
  default = [""]
}

# variable "certificate_arn" {
#   type = string
# }
