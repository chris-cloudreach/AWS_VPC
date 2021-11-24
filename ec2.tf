#you must create security grup before creating instance
resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my server"
  vpc_id      = aws_vpc.main.id

  #inbound rules
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" #ssh always use tcp
    cidr_blocks      = ["86.15.241.215/32"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  #outbound rules
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

  tags = {
    Name = "my_app_sg"
  }
}

data "aws_ami" "my_aws_ami" {
  

  filter {
    name   = "name"
    values = ["amzn2-ami-amd-hvm-*"]
  }
  owners = ["679593333241"]
  most_recent = true
  
 
}

# resource "aws_instance" "myec2instance" {
#   ami = data.aws_ami.my_aws_ami
# }