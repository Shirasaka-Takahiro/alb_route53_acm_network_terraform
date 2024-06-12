variable "general_config" {
  type = map(any)
}
variable "vpc_id" {}
variable "vpc_cidr" {}
variable "internet_gateway_id" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "private_route_table_ids" {}