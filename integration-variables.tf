variable "integration_enabled" {
  type    = bool
  default = true
}

variable "integration_critical" {
  type    = number
  default = 1
}

variable "integration_evaluation_period" {
  type    = string
  default = "last(2)"
}

variable "integration_priority" {
  type    = number
  default = 2
}

variable "integration_note" {
  type    = string
  default = ""
}

variable "integration_docs" {
  type    = string
  default = "Returns CRITICAL if Datadog is unable to connect to the monitored Kong instance(s). Returns OK otherwise."
}

variable "integration_filter_override" {
  type    = string
  default = ""
}

variable "integration_alerting_enabled" {
  type    = bool
  default = true
}
