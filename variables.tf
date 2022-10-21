variable "AWS_DEFAULT_REGION" {
  description = "AWS region"
  type    = string
  default = "ap-southeast-2"
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "repo" {
  type = string
}

variable "managed_by" {
  type    = string
  default = "terraform"
}

variable "notification_email" {
  type    = string
}

variable "per_account_limits" {
  description = "Per account budget threshold in USD. Tag accounts with \"env\" in order to populate these values"
  type        = map
  default     = {
    untagged = "30"
    sandbox  = "10",
    dev      = "30",
    prod     = "30"
  }
}
