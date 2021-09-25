# AWS Region
variable "aws_region" {
    description = "Region in which AWS Resources are to be created"
    type = string
    default = "ap-southeast-2"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "sandbox"
}

# Business Division
variable "business_division" {
  description = "Business Division in this organisation"
  type = string
  default = "IT"
}