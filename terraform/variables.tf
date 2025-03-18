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

variable "inbound_cidr" {
  type        = string
  description = "CIDR block for inbound access"
  default     = "0.0.0.0/0"
}

variable "redis_ports" {
  type        = list(number)
  description = "Redis ports to allow (standard and SSL)"
  default     = [6379, 6380]
}
