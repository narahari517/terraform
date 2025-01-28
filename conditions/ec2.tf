resource "aws_security_group" "allow_sshh_terraform" {
    name        = var.sg_name
    description = var.sg_description

    #we can allow all in egress as it is outgoing traffic
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

    tags = merge (
        var.common_tags,
        {
            Name = "allow-sshh"
        }
    )
}

resource "aws_instance" "expense" {
    
    ami           = var.ami_id
    instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_sshh_terraform.id]

    tags = {
    Name = "expense"
    }
}

