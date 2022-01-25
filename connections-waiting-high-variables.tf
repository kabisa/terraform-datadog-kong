variable "connections_waiting_high_enabled" {
  type    = bool
  default = true
}

variable "connections_waiting_high_warning" {
  type    = number
  default = 750
}

variable "connections_waiting_high_critical" {
  type    = number
  default = 1000
}

variable "connections_waiting_high_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "connections_waiting_high_note" {
  type    = string
  default = ""
}

variable "connections_waiting_high_docs" {
  type    = string
  default = ""
}

variable "connections_waiting_high_filter_override" {
  type    = string
  default = ""
}

variable "connections_waiting_high_alerting_enabled" {
  type    = bool
  default = true
}

variable "connections_waiting_high_no_data_timeframe" {
  type    = number
  default = null
}

variable "connections_waiting_high_notify_no_data" {
  type    = bool
  default = false
}

variable "connections_waiting_high_ok_threshold" {
  type    = number
  default = null
}

variable "connections_waiting_high_name_prefix" {
  type    = string
  default = ""
}

variable "connections_waiting_high_name_suffix" {
  type    = string
  default = ""
}

variable "connections_waiting_high_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}