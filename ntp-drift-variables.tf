variable "ntp_drift_enabled" {
  type    = bool
  default = true
}

variable "ntp_drift_warning" {
  type    = number
  default = 20
}

variable "ntp_drift_critical" {
  type    = number
  default = 30
}

variable "ntp_drift_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "ntp_drift_note" {
  type    = string
  default = ""
}

variable "ntp_drift_docs" {
  type    = string
  default = ""
}

variable "ntp_drift_filter_override" {
  type    = string
  default = ""
}

variable "ntp_drift_alerting_enabled" {
  type    = bool
  default = true
}

variable "ntp_drift_no_data_timeframe" {
  type    = number
  default = null
}

variable "ntp_drift_notify_no_data" {
  type    = bool
  default = false
}

variable "ntp_drift_ok_threshold" {
  type    = number
  default = null
}

variable "ntp_drift_name_prefix" {
  type    = string
  default = ""
}

variable "ntp_drift_name_suffix" {
  type    = string
  default = ""
}

variable "ntp_drift_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
