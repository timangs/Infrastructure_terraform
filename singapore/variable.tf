provider "aws" {
  alias = "singa"
  region = "ap-southeast-1"
}

provider "aws" {
  alias = "seoul"
  region = "ap-northeast-2"
}


# key pair
variable "seoulkey" {
  description = "Seoul Key pair name"
  type = string
  default = "soldesk-key"
}
variable "singakey" {
  description = "singapore Key pair name"
  type = string
  default = "soldesk-key-singapore"
}

# ami
variable "seoul-nat-ami" {
  type = string
  default = "ami-0c2d3e23e757b5d84"
}
variable "seoul-ami" {
  type = string
  default = "ami-04c535bac3bf07b9a"
}
variable "singa-nat-ami" {
  type = string
  default = "ami-097c9351ea0aa8d71"
}
variable "singa-ami" {
  type = string
  default = "ami-0de20ddce8ba98c24"
}


