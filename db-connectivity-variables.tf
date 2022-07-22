variable "db_connectivity_enabled" {
  type    = bool
  default = true
}

variable "db_connectivity_warning" {
  type    = number
  default = null
}

variable "db_connectivity_critical" {
  type    = number
  default = 0.5
}

variable "db_connectivity_evaluation_period" {
  type    = string
  default = "last_10m"
}

variable "db_connectivity_note" {
  type    = string
  default = ""
}

variable "db_connectivity_docs" {
  type    = string
  default = ""
}

variable "db_connectivity_filter_override" {
  type    = string
  default = ""
}

variable "db_connectivity_alerting_enabled" {
  type    = bool
  default = true
}

variable "db_connectivity_no_data_timeframe" {
  type    = number
  default = null
}

variable "db_connectivity_notify_no_data" {
  type    = bool
  default = false
}

variable "db_connectivity_ok_threshold" {
  type    = number
  default = null
}

variable "db_connectivity_name_prefix" {
  type    = string
  default = ""
}

variable "db_connectivity_name_suffix" {
  type    = string
  default = ""
}

variable "db_connectivity_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
