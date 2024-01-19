variable "subnet-id" {
  description = "The subnet-id to put the nat gateway on"
  type        = string
}


variable "allocation-id" {
  description = "The allocation-id EIP for the nat gateway to use"
  type        = string
}


variable "tags" {
  description = "The tags for the nat gateway"
  type        = map(string)
}