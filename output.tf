
output "instance_ip" {
  value       = "${aws_instance.ec2_backend_server.public_ip}"
  description = "Ec2 instance public IP"
}

output "private_key" {
  value       = "${tls_private_key.privatekey.private_key_pem}"
  description = "private_key content generated during session, you can also find in ./user-data"
  sensitive   = true
}

output "privatekey" {
  value       = "${aws_key_pair.keypair.key_name}"
  description = "Your private_key name during deployment"
}
