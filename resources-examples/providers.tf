terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    
    # SINTAXE PARA SEC. CREDENTIALS
    access_key = "my-acess-key"
    secret_key = "my-secret-key"
    region     = "sa-east-1"
  
}

provider "aws" {
    
    # SINTAXE PARA SEC. CREDENTIALS
    alias = "us-east-1"
    access_key = "my-acess-key"
    secret_key = "my-secret-key"
    region     = "us-east-1"
  
}