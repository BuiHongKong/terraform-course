
resource "aws_instance" "compute" {
  ami                         = "ami-0c1be799d13cbf40e"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, {
    Name = "06-resources-compute"
  })
}

resource "aws_security_group" "public_http_traffic" {
 description = "Security group for public HTTP traffic allow on port 80 and 443"
 name = "public_http_traffic"
 vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "httpss" {
  security_group_id = aws_security_group.public_http_traffic.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}
