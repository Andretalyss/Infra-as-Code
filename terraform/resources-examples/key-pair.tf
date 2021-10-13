resource "aws_key_pair" "terraform_key" {
    provider = aws.us-east-1
    key_name = "terraform-aws"
    public_key = "my-public-key"