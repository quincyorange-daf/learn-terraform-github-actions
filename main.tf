terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-2"
  #new line added here
access_key = “AKIA42WBAX5B2OO7QT4K”
secret_key = “uyNsXHMkZlnINXCfySDvsfRoCKTB+Huu97nDdTYd”
}

terraform {
  cloud {
    organization = "q-test"

    workspaces {
      name = "Demo-github-actions"
    }
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
