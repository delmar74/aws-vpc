variable "region" {
  description = "Region of VPC"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type        = list(string)
  default     = ["us-east-1b", "us-east-1d"]
}

variable "base_cidr_block" {
  description = "A /16 CIDR range definition"
  type        = string
  default     = "10.0.0.0/16"
}
