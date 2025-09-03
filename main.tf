provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-02d26659fd82cf299"
  availability_zone      = "ap-south-1b"
  instance_type          = "t2.medium"
  key_name               = "Auto"
  vpc_security_group_ids = ["sg-07ede7518dd4357a0"]
  subnet_id              = "subnet-03bc7422d699ff7b4"
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
