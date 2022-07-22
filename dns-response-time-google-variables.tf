variable "dns_response_time_google_enabled" {
  type    = bool
  default = true
}

variable "dns_response_time_google_warning" {
  type    = number
  default = 1.5
}

variable "dns_response_time_google_critical" {
  type    = number
  default = 2
}

variable "dns_response_time_google_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "dns_response_time_google_note" {
  type    = string
  default = ""
}

variable "dns_response_time_google_docs" {
  type    = string
  default = ""
}

variable "dns_response_time_google_filter_override" {
  type    = string
  default = ""
}

variable "dns_response_time_google_alerting_enabled" {
  type    = bool
  default = true
}

variable "dns_response_time_google_no_data_timeframe" {
  type    = number
  default = null
}

variable "dns_response_time_google_notify_no_data" {
  type    = bool
  default = false
}

variable "dns_response_time_google_ok_threshold" {
  type    = number
  default = null
}

variable "dns_response_time_google_name_prefix" {
  type    = string
  default = ""
}

variable "dns_response_time_google_name_suffix" {
  type    = string
  default = ""
}

variable "dns_response_time_google_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
