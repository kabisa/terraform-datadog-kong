variable "error_response_percentage_offset" {
  description = "An off set to make sure if only a single requests gets in we don't immediately compute error rate to 100%. The formula is: error_count * 100 / (error_count + success_count + offset)"
  default     = 100
}

variable "error_response_percentage_enabled" {
  type    = bool
  default = true
}

variable "error_response_percentage_warning" {
  type    = number
  default = 2
}

variable "error_response_percentage_critical" {
  type    = number
  default = 3
}

variable "error_response_percentage_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "error_response_percentage_note" {
  type    = string
  default = ""
}

variable "error_response_percentage_docs" {
  type    = string
  default = ""
}

variable "error_response_percentage_filter_override" {
  type    = string
  default = ""
}

variable "error_response_percentage_alerting_enabled" {
  type    = bool
  default = true
}

variable "error_response_percentage_no_data_timeframe" {
  type    = number
  default = null
}

variable "error_response_percentage_notify_no_data" {
  type    = bool
  default = false
}

variable "error_response_percentage_ok_threshold" {
  type    = number
  default = null
}

variable "error_response_percentage_name_prefix" {
  type    = string
  default = ""
}

variable "error_response_percentage_name_suffix" {
  type    = string
  default = ""
}

variable "error_response_percentage_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
