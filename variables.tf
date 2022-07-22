variable "filter_str" {
  type = string
}

variable "env" {
  type = string
}

variable "service" {
  type    = string
  default = "Kong"
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "locked" {
  type    = bool
  default = false
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}

variable "service_check_include_tags" {
  description = "Tags to be included in the \"over\" section of a service check query"
  type        = list(string)
}

variable "service_check_exclude_tags" {
  description = "Tags to be included in the \"exclude\" section of a service check query"

  type    = list(string)
  default = []
}

variable "docker_container_monitoring_enabled" {
  type = bool
}

variable "docker_filter_str" {
  type    = string
  default = null
}

variable "runs_in_k8s" {
  type = bool
}

variable "priority_offset" {
  description = "For non production workloads we can +1 on the priorities"
  default     = 0
}
