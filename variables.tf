variable project_name {
  description = "The project name"
  type        = string
  default     = "project"
}

variable environment {
  description = "The name environment"
  type        = string
  default     = ""
}

variable aws_region {
  description = "The region in AWS"
  type        = string
  default     = ""
}

variable your_first_name {
  description = ""
  type        = string
  default     = ""
}

variable your_last_name {
  description = ""
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
  description = ""
  type        = string
  default     = ""
}

variable cidr_network {
  description = ""
  type        = map
  default     = {
    "dev"   = "10.20"
    "prod"  = "10.30"
  }
}

variable ip_access_list {
  description = ""
  type        = list
  default     = []
}

