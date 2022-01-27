variable "dns_response_time_enabled" {
  type    = bool
  default = true
}

variable "dns_response_time_warning" {
  type    = number
  default = 0.75
}

variable "dns_response_time_critical" {
  type    = number
  default = 1
}

variable "dns_response_time_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "dns_response_time_note" {
  type    = string
  default = ""
}

variable "dns_response_time_docs" {
  type    = string
  default = ""
}

variable "dns_response_time_filter_override" {
  type    = string
  default = ""
}

variable "dns_response_time_alerting_enabled" {
  type    = bool
  default = true
}

variable "dns_response_time_no_data_timeframe" {
  type    = number
  default = null
}

variable "dns_response_time_notify_no_data" {
  type    = bool
  default = false
}

variable "dns_response_time_ok_threshold" {
  type    = number
  default = null
}

variable "dns_response_time_name_prefix" {
  type    = string
  default = ""
}

variable "dns_response_time_name_suffix" {
  type    = string
  default = ""
}

variable "dns_response_time_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}