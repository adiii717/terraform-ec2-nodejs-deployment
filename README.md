# terraform-ec2-nodejs-deployment

![N|Solid](https://www.praqma.com/images/stories/logo_large-3e11db19.png)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


Deploy nodejs application using Terraform asiging public IP adress and domain






### Variables

```
variable "env_prefix_name" {
  type        = "string"
  description = "please enter the environment name for example demo, nodejsapp etc this will be use as prefix for example demo.example.com etc"
  default     = "demo"

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
  default     = "123456789"
}

variable "key_name" {
  type        = "string"
  description = "Private key that will use to connect with EC2 instances"
  default     = "ec2key"
}

# IP list for ssh
variable "allowed_ssh_ips" {
  type    = "list"
  default = ["110.10.10.10/32", "10.0.0.0/16"]
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
```

### Installation

All you need to the following command to deploy application

```sh
$ cd terraform-ec2-nodejs-deployment
$ terraform init
$ terraform plan
$ terraform apply
```


### Todos

 - Make it moduler
 - Add support for different platform

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
