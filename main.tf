data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "id"
    values = ["ami-00fb540f325b4761d"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
