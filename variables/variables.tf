# 1-command line
# 2-terraform.tfvars
# 3-environment variables, TF_VAR_variable_name
# 4-default
# 5-prompt

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This is AMI ID of devops-practice instance"
}

variable "instance_type" {
    type = string
    # default = "t3.micro"
}

variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable sg_name {
    type = string
    default = "allow-sshh"
}

variable "sg_description" {
    default = "Allow port number 22 for ssh access"
}

variable "from_port" {
    default = 22
    type = number
}

variable "to_port" {
    default = 22
    type = number
}

variable "protocol" {
    default = "tcp"
    type = string
}

variable "ingress_cidr" {
    default = ["0.0.0.0/0"]
    type = list(string)
}

