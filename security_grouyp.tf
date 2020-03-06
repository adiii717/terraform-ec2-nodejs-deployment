resource "aws_security_group" "sg_backend_server" {
  name   = "${var.env_prefix_name}-bastionsg"
  vpc_id = "${aws_vpc.VPC.id}"
  tags = {
    Name = "${var.env_prefix_name}-backend-sg"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = "${var.allowed_ssh_ips}"
    description = "Allow ssh access to specefic IPs only"

  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = "${var.allowed_public_http_traffic_ips}"
    description = "Allow HTTP traffic to the instance"
  }
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
