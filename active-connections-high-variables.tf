variable "active_connections_high_enabled" {
  type    = bool
  default = true
}

variable "active_connections_high_warning" {
  type    = number
  default = 1500
}

variable "active_connections_high_critical" {
  type    = number
  default = 2000
}

variable "active_connections_high_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "active_connections_high_note" {
  type    = string
  default = ""
}

variable "active_connections_high_docs" {
  type    = string
  default = ""
}

variable "active_connections_high_filter_override" {
  type    = string
  default = ""
}

variable "active_connections_high_alerting_enabled" {
  type    = bool
  default = true
}

variable "active_connections_high_no_data_timeframe" {
  type    = number
  default = null
}

variable "active_connections_high_notify_no_data" {
  type    = bool
  default = false
}

variable "active_connections_high_ok_threshold" {
  type    = number
  default = null
}

variable "active_connections_high_name_prefix" {
  type    = string
  default = ""
}

variable "active_connections_high_name_suffix" {
  type    = string
  default = ""
}

variable "active_connections_high_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
