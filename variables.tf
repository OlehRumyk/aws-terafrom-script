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
