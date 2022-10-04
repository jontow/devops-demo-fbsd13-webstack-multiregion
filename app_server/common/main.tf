data "aws_vpc" "target_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "target_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.target_vpc.id]
  }
}

data "aws_ami_ids" "selected" {
  owners = [var.ec2_ami_owner]

  filter {
    name   = "name"
    values = [var.ec2_ami_name]
  }
}

data "aws_lb_target_group" "target_group" {
  name = var.lb_tg_name
}

resource "aws_instance" "app_server" {
  count    = var.ec2_app_server_count

  ami           = data.aws_ami_ids.selected.ids[0]
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name

  subnet_id                   = "${element(data.aws_subnets.target_subnets.ids, count.index)}"
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.app_server.id
  ]

  tags = {
    Name = "${var.ec2_name_prefix}${count.index}${var.ec2_name_suffix}"
  }
}

resource "aws_lb_target_group_attachment" "app_server" {
  count = var.ec2_app_server_count

  target_group_arn = data.aws_lb_target_group.target_group.arn
  target_id        = "${aws_instance.app_server[count.index].id}"
  port             = var.ec2_app_server_port
}

resource "aws_security_group" "app_server" {
  name        = var.ec2_sg_name
  description = "Allow rules for app servers"
  vpc_id      = data.aws_vpc.target_vpc.id

  ingress {
    description      = "SSH from outside"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP-${var.ec2_app_server_port} from VPC"
    from_port        = var.ec2_app_server_port
    to_port          = var.ec2_app_server_port
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.target_vpc.cidr_block]
    #ipv6_cidr_blocks = [data.aws_vpc.target_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.ec2_sg_name
  }
}
