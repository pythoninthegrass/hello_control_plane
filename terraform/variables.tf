variable "org" {
  type    = string
  default = "pythoninthegrass"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "token" {
  type      = string
  sensitive = true
}

variable "gvc" {
  type        = string
  default     = "dev"
  description = "Global Virtual Cloud name"
}

# variable "refresh_token" {
#   type = string
#   default = "refresh_token"
# }
