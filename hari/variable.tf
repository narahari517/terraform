variable "sg_name" {
  default = "allow-sshh"
}

variable "sg_description" {
  default = "security group for terraform instance"
}

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "ingress_cidr" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}

variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    terraform   = "true"
  }
}

variable "zone_id" {
  default = "Z05871131JCJ34SEUMLUJ"
}

variable "domain_name" {
  default = "nhari.online"
}

