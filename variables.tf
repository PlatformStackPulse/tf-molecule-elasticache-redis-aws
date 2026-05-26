variable "subnet_ids" {
  description = "Subnet IDs for Redis placement"
  type        = list(string)
  validation {
    condition     = length(var.subnet_ids) >= 1
    error_message = "At least one subnet ID is required."
  }
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_clusters" {
  description = "Number of cache clusters (nodes)"
  type        = number
  default     = 2
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "parameter_group_family" {
  description = "Parameter group family"
  type        = string
  default     = "redis7"
}

variable "parameters" {
  description = "Custom Redis parameters"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = true
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ"
  type        = bool
  default     = true
}

variable "auth_token" {
  description = "Auth token (password) for Redis"
  type        = string
  sensitive   = true
  default     = null
}

variable "snapshot_retention_limit" {
  description = "Snapshot retention in days"
  type        = number
  default     = 7
}

variable "snapshot_window" {
  description = "Daily snapshot window"
  type        = string
  default     = "03:00-05:00"
}

variable "maintenance_window" {
  description = "Weekly maintenance window"
  type        = string
  default     = "mon:05:00-mon:06:00"
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = false
}
