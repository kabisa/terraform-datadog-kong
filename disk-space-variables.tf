variable "disk_free_percent_enabled" {
  type    = bool
  default = true
}

variable "disk_free_percent_warning" {
  type    = number
  default = 20
}

variable "disk_free_percent_critical" {
  type    = number
  default = 15
}

variable "disk_free_percent_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "disk_free_percent_note" {
  type    = string
  default = ""
}

variable "disk_free_percent_docs" {
  type    = string
  default = ""
}

variable "disk_free_percent_filter_override" {
  type    = string
  default = ""
}

variable "disk_free_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "disk_free_percent_no_data_timeframe" {
  type    = number
  default = null
}

variable "disk_free_percent_notify_no_data" {
  type    = bool
  default = false
}

variable "disk_free_percent_ok_threshold" {
  type    = number
  default = null
}

variable "disk_free_percent_name_prefix" {
  type    = string
  default = ""
}

variable "disk_free_percent_name_suffix" {
  type    = string
  default = ""
}

variable "disk_free_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}