variable "env_prefix_name" {
  type        = "string"
  description = "please enter the environment name for example loadtest, adiltest etc this will be use as prefix for example loadtest.goabode.co or loadtestredis.goabode.com etc"
  default     = "ec2"

}
variable "region" {
  default     = "us-west-1"
  type        = "string"
  description = "Region for VPC."
}
variable "USER_DATA_DIR" {
  type        = "string"
  description = "To place user data in the folder such users keys etc, make sure your deployment system is secure"
  default     = "./user-data"
}
variable "aws_profile_name" {
  type        = "string"
  description = "please enter the AWS profile name by default will test"
  default     = "test"
}
# Nodejs Managed AMI list
# https://bitnami.com/stack/nodejs/cloud/aws/amis
variable "AMI_NODE_v12" {
  type        = "string"
  description = "To run EC2 Instance with Node v12"
  default     = "ami-0bb49f572ba714810"
}
variable "AMI_NODE_v10" {
  type        = "string"
  description = "To run EC2 Instance with Node v10"
  default     = "ami-0742b3fe66c008dce"
}
variable "aws_account_id" {
  type        = "string"
  description = "AWS account ID which will be used for deployment"
  default     = "164407249965"
}

variable "key_name" {
  type        = "string"
  description = "Private key that will use to connect with EC2 instances"
  default     = "ec2key"
}
variable "allowed_ssh_ips" {
  type    = "list"
  default = ["115.186.60.74/32", "115.186.156.246/32", "10.0.0.0/16"]
}
variable "allowed_public_http_traffic_ips" {
  type    = "list"
  default = ["0.0.0.0/0"]
}
variable "aws_ip_cidr_range" {
  default     = "10.0.0.0/16"
  type        = "string"
  description = "IP CIDR Range for VPC."
}

variable "availibility_zones" {
  type = "map"
  default = {
    zone1 = "us-west-2a"
    zone2 = "us-west-2b"
    zone3 = "us-west-2c"
    zone4 = "us-west-1a"
  }
}
