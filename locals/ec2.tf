resource "aws_security_group" "sg_terraform" {
  name        = var.sg_name
  description = var.sg_description

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform security group"
  }
}

resource "aws_instance" "terraform" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_terraform.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t2.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )
}


resource "aws_instance" "elasticsearch" {
  ami                    = data.aws_ami.ami_terraform.id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]

  tags = merge(
    var.common_tags,
    {
      Name = "elasticsearch"
    }
  )
}
