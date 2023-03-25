# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "terrform-admin-user"
}

resource "aws_s3_bucket" "S3_Bucket_Basic" {
  bucket =  "s3-basic-bucket"
  
  tags = {
    Name = "s3-basic-bucket"
    Environment= "QA"
  }
}

resource "aws_instance" "Server_Web" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "Server_Web"
  }
}

resource "aws_instance" "Server_BD" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "Server_BD"
  }
}

resource "aws_instance" "Server_Backend" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"

  tags = {
    Name = "Server_Backend"
  }
}

resource "aws_sqs_queue" "basic_queue" {
  name                      = "basic_queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  
  tags = {
    Environment = "lab"
  }
}





