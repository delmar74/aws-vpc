variable "region" {
  description = "A region"
  type        = string
  default     = "us-east-1"
}

variable "env_id" {
  description = "Environment Name"
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type        = list(string)
  default     = []
}

variable "base_cidr_block" {
  description = "A /16 CIDR range definition"
  type        = string
  default     = "10.0.0.0/16"
}
