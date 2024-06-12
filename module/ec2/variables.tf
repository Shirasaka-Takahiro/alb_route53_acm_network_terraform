variable "general_config" {
  type = map(any)
}
variable "ami" {}
variable "public_subnets" {}
variable "public_subnet_ids" {}
variable "internal_sg_id" {}
variable "operation_sg_1_id" {}
variable "operation_sg_2_id" {}
variable "operation_sg_3_id" {}
variable "ec2_role" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "public_key_path" {}