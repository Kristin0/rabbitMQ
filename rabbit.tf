provider "aws" {
    region = "us-east-1"
    
}

resource "aws_instance" "rmq" {
    ami = "ami-07ebfd5b3428b6f4d"
    instance_type = "t2.micro"
    key_name = "A4L"
    vpc_security_group_ids = ["sg-0e9ca0f3d589f7bbb"]

    tags = {
        Name = "rabbit"
    }
}