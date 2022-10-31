variable "db_user" {
  type    = string
  default = "testuser"
}

variable "db_pass" {
  type    = string
  default = "testuserpass"
}

variable "instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "db_region" {
  type    = string
  default = "us-east-2"
}