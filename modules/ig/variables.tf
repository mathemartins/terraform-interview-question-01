variable "vpc-id" {
  description = "The VPC ID from the vpc resource"
  type        = string
}

variable "tags" {
  description = "The tags for the internet gateway resource"
  type        = map(string)
}