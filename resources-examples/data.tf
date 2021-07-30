#DATA SOURCE PARA VPC
data "aws_vpc" "default" {
    filter {
        name   = "tag:Name"
        values = ["vpc1"]
    }
}

#DATA SOURCE PARA SUBNET
data "aws_subnet" "subnet3" {
    filter {
        name   = "tag:Name"
        values = ["sub3"]
    }
}

data "aws_subnet" "subnet_us" {
    provider = aws.us-east-1

    filter {
        name   = "tag:Name"
        values = ["subnetus"]
    }
}

data "aws_security_group" "ssh_acesso" {
    name = "acesso-ssh"

    depends_on = [aws_security_group.acesso_ssh]
}
