variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "key_name" {}
variable "env" {}

variable "allowed_ssh_sg_id" {
  description = "Security group allowed to SSH into this instance"
  type        = string
  default     = null
}