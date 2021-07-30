#SINTAXE CRIAÇÃO DE EC2_INSTANCE
resource "aws_instance" "ec2_teste" {
    ami                     = var.ami_value["sa-east-1"]  
    instance_type           = var.instance_type
    key_name                = var.keypair_name
    subnet_id               = data.aws_subnet.subnet3.id
    #vpc_security_group_ids = ["${aws_security_group.acessos_sh.id}"]  se for resource.
    vpc_security_group_ids  = [data.aws_security_group.ssh_acesso.id]  # se for data
    

    tags = {
        Name        = var.ec2_name1
        Environment = "CreatedTerraform"
    }
    
    depends_on = [
        aws_security_group.acesso_ssh,
        aws_s3_bucket.buck1
    ]

}

# CRIANDO EC2 EM AZ DIFERENTE
resource "aws_instance" "usa" {
    provider                = aws.us-east-1
    ami                     = var.ami_value["us-east-1"]  
    instance_type           = var.instance_type
    key_name                = "${aws_key_pair.terraform_key.key_name}"
    subnet_id               = data.aws_subnet.subnet_us.id
    vpc_security_group_ids  = ["${aws_security_group.acesso_ssh_us.id}"]
    #vpc_security_group_ids = [data.aws_security_group.ssh_acesso.id]  # se for data
    

    tags = {
        Name        = var.ec2_name2
        Environment = "CreatedTerraform"
    }
    
    depends_on = [
        aws_security_group.acesso_ssh_us,
        aws_dynamodb_table.db1
    ]
}

#SINTAXE PARA BUCKETS
resource "aws_s3_bucket" "buck1" {
    bucket = "andrelabs-buck1"
    acl    = "private"

    tags = {
        Name = "andrelabs-buck1"
    }
}

# CRIANDO DYNAMODB
resource "aws_dynamodb_table" "db1" {
  provider       = aws.us-east-1
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}