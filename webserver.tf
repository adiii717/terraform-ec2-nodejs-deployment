resource "aws_instance" "ec2_backend_server" {
  ami           = "${var.AMI_NODE_v10}"
  key_name      = "${aws_key_pair.keypair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.sg_backend_server.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.PubSubnet2a.id}"
  user_data                   = "${data.template_file.backend_cloud_init.rendered}"
  instance_type = "t2.micro"
  tags = {
    Name = "${var.env_prefix_name}-backend_server"
  }
}

# Creating Kay Pairs ...
# for EC2 Instance


resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "${var.env_prefix_name}-ec2key"
  public_key = "${tls_private_key.privatekey.public_key_openssh}"
}


resource "local_file" "ec2key" {
  content  = "${tls_private_key.privatekey.private_key_pem}"
  filename = "${var.USER_DATA_DIR}/${aws_key_pair.keypair.key_name}.pem"
}



# run user data
resource "aws_route53_record" "r53_backend_record" {
  name    = "demo.example.com"
  zone_id = "${data.aws_route53_zone.primary.zone_id}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ec2_backend_server.public_ip}"]
}

data "template_file" "backend_cloud_init" {
  template = "${file("cloud_init/cloud_init.sh")}"
  vars = {
    HOSTED_ON = "EC2 Machine",
    DEM_INFO  = "Demo App deployment against ${var.env_prefix_name}",
  }
}