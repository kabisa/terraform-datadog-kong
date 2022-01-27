variable "system_entropy_enabled" {
  type    = bool
  default = true
}

variable "system_entropy_warning" {
  type    = number
  default = 500
}

variable "system_entropy_critical" {
  type    = number
  default = 250
}

variable "system_entropy_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "system_entropy_note" {
  type    = string
  default = ""
}

variable "system_entropy_docs" {
  type    = string
  default = "Entropy is the randomness collected by an operating system or application for use in cryptography or other uses that require random data. This randomness is often collected from hardware sources (variance in fan noise or HDD), either pre-existing ones such as mouse movements or specially provided randomness generators. A lack of entropy can have a negative impact on performance and security."
}

variable "system_entropy_filter_override" {
  type    = string
  default = ""
}

variable "system_entropy_alerting_enabled" {
  type    = bool
  default = true
}

variable "system_entropy_no_data_timeframe" {
  type    = number
  default = null
}

variable "system_entropy_notify_no_data" {
  type    = bool
  default = false
}

variable "system_entropy_ok_threshold" {
  type    = number
  default = null
}

variable "system_entropy_name_prefix" {
  type    = string
  default = ""
}

variable "system_entropy_name_suffix" {
  type    = string
  default = ""
}

variable "system_entropy_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}
