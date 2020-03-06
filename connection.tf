provider "aws" {
  # do not need to provide hard coded path
  #You can use an AWS credentials file to specify your credentials.
  #The default location is $HOME/.aws/credentials on Linux and OS X, or "%USERPROFILE%\.aws\credentials" for Windows users
  #shared_credentials_file = "$HOME/.aws/credentials"
  version             = "~> 2.14"
  region              = "${var.region}"
  profile             = "${var.aws_profile_name}"

  # to allow specific IPs
  # allowed_account_ids = ["1234567890"]
}


provider "archive" {
  version = "~> 1.2"
}

provider "local" {
  version = "~> 1.3"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}

provider "tls" {
  version = "~> 2.0"
}

