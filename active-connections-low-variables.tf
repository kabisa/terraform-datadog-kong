variable "active_connections_low_enabled" {
  type    = bool
  default = true
}

variable "active_connections_low_warning" {
  type    = number
  default = 5
}

variable "active_connections_low_critical" {
  type    = number
  default = 2
}

variable "active_connections_low_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "active_connections_low_note" {
  type    = string
  default = ""
}

variable "active_connections_low_docs" {
  type    = string
  default = ""
}

variable "active_connections_low_filter_override" {
  type    = string
  default = ""
}

variable "active_connections_low_alerting_enabled" {
  type    = bool
  default = true
}

variable "active_connections_low_no_data_timeframe" {
  type    = number
  default = null
}

variable "active_connections_low_notify_no_data" {
  type    = bool
  default = false
}

variable "active_connections_low_ok_threshold" {
  type    = number
  default = null
}

variable "active_connections_low_name_prefix" {
  type    = string
  default = ""
}

variable "active_connections_low_name_suffix" {
  type    = string
  default = ""
}

variable "active_connections_low_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
