provider "aws" {
  region = "ap-southeast-2"
}

# Upload your public SSH key to AWS
resource "aws_key_pair" "keypair1" {
  key_name   = "keypair1"
  public_key = file("../MyKeyPair.pub")  # must be a .pub file
}

# Security group to allow SSH and HTTP
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance that uses the key and security group
resource "aws_instance" "ec2_ansible1" {
  ami                    = "ami-00543daa0ad4d3ea4"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.keypair1.key_name
  security_groups        = [aws_security_group.allow_ssh_http.name]

  

  tags = {
    Name = "ec2-created-from-terraform for ansible 1"
  }
}
resource "aws_instance" "ec2_ansible2" {
  ami                    = "ami-00543daa0ad4d3ea4"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.keypair1.key_name
  security_groups        = [aws_security_group.allow_ssh_http.name]

  

  tags = {
    Name = "ec2-created-from-terraform 2"
  }
}
resource "aws_instance" "mec2_ansible3" {
  ami                    = "ami-00543daa0ad4d3ea4"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.keypair1.key_name
  security_groups        = [aws_security_group.allow_ssh_http.name]

  

  tags = {
    Name = "ec2-created-from-terraform 3"
  }
}
resource "aws_instance" "ec2_ansible4" {
  ami                    = "ami-00543daa0ad4d3ea4"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.keypair1.key_name
  security_groups        = [aws_security_group.allow_ssh_http.name]

  

  tags = {
    Name = "ec2-created-from-terraform 4"
  }
}
