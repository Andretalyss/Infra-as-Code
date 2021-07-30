resource "aws_security_group" "acesso_ssh" {
    name        = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = var.cdirs_acesso
    }

    tags = {
        Name = "ssh"
    }    
}

resource "aws_security_group" "acesso_ssh_us" {
    provider    = aws.us-east-1
    name        = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = var.cdirs_acesso
    }

    tags = {
        Name = "ssh"
    }    
}