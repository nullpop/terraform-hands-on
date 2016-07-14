provider "aws" {
  region = "ap-northeast-1"
}

#VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = ""  ##
  tags {
        Name = "hands_on_vpc"
    }
}

# public and web subnet
resource "aws_subnet" "public1" {
  vpc_id = "${aws_vpc.demo_vpc.id}"
  cidr_block = "" ##
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "hands_on_subnet_a"
  }
}

resource "aws_subnet" "public2" {
  vpc_id = "${aws_vpc.demo_vpc.id}"
  cidr_block = "" ##
    availability_zone = "ap-northeast-1c"

  tags {
    Name = "hands_on_subnet_c"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.demo_vpc.id}"
    tags {
        Name = "hands_on_igw"
    }
}

# Route Tables
resource "aws_route_table" "route_public" {
    vpc_id = "${aws_vpc.demo_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags {
        Name = "hands_on_route_table"
    }
}

resource "aws_route_table_association" "route_public1_assoc" {
    subnet_id = "${aws_subnet.public1.id}"
    route_table_id = "${aws_route_table.route_public.id}"
}

resource "aws_route_table_association" "route_public2_assoc" {
    subnet_id = "${aws_subnet.public2.id}"
    route_table_id = "${aws_route_table.route_public.id}"
}

resource "aws_security_group" "allow_handson" {
  name = "SgHandsOn"
  description = "hands_on_sg"
  vpc_id = "${aws_vpc.demo_vpc.id}"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "sg_hands_on"
  }
}

#EC2
resource "aws_instance" "demo_ec2" {
  depends_on = ["aws_internet_gateway.igw"]
  ami = "" ##
  key_name = "" ##
  associate_public_ip_address = true
  subnet_id = "${aws_subnet.public1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_handson.id}"]
  instance_type = "" ##
  tags {
    Name = "" ##
  }
}
