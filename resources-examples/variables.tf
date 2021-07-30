variable "ami_value" {
    type    = map
    default = {
        "us-east-1" = "ami-0c2b8ca1dad447f8a"
        "sa-east-1" = "ami-0f8243a5175208e08"
    }
}

variable "cdirs_acesso" {
    type = list(string)
    default = ["ip-range"] # ex: 192.120.12.14/32
}

/*
variable "ami_value1" {
    type   = string
    default = "ami-0f8243a5175208e08"
}
*/

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "keypair_name" {
    type    = string
    default = "terraform-aws"
}

variable "ec2_name1" {
    type    = string
    default = "EC2-testing"
}

variable "ec2_name2" {
    type    = string
    default = "EC2-testing-us"
}
