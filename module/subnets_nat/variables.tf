variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The name of the VPC"
  type        = string
}
variable "region" {
  description = "The region for the router and NAT"
  type        = string
}

variable "public_subnets" {
  description = "A map of public subnets with their CIDR blocks and regions"
  type = map(object({
    cidr_block = string
    region     = string
  }))
}

variable "private_subnets" {
  description = "A map of private subnets with their CIDR blocks and regions"
  type = map(object({
    cidr_block = string
    region     = string
  }))
}
