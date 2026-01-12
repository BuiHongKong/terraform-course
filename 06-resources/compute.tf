resource "aws_instance" "compute" {
  ami                         = "ami-0f74c08b8b5effa56"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, {
    Name = "06-resources-compute"
  })
}


