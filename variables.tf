variable project_name {
  description = "The project name"
  type        = string
  default     = "project"
}

variable environment {
  description = "The name environment"
  type        = string
  default     = "dev"
}

variable aws_region {
  description = "The AWS region"
  type        = string
  default     = ""
}

variable aws_access_key {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable aws_secret_key {
  description = "AWS secret key"
  type        = string
  default     = ""
}

variable aws_key_pair {
  description = "SSH public key"
  type        = string
  default     = ""
}

variable cidr_network {
  description = "Options to create VPC"
  type        = map
  default     = {
    "dev"   = "10.20"
    "prod"  = "10.30"
  }
}

variable your_first_name {
  description = "Your first name"
  type        = string
  default     = ""
}

variable your_last_name {
  description = "Your last name"
  type        = string
  default     = ""
}

variable ip_access_list {
  description = "IP whitelist"
  type        = list
  default     = []
}
