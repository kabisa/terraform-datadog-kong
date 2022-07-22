variable "datadog_agent_enabled" {
  type    = bool
  default = true
}

variable "datadog_agent_critical" {
  type    = number
  default = 1
}

variable "datadog_agent_evaluation_period" {
  type    = string
  default = "last(2)"
}

variable "datadog_agent_priority" {
  type    = number
  default = 2
}

variable "datadog_agent_note" {
  type    = string
  default = ""
}

variable "datadog_agent_docs" {
  type    = string
  default = "Returns CRITICAL if Datadog is agent is not running or reporting data for %d minutes"
}

variable "datadog_agent_filter_override" {
  type    = string
  default = ""
}

variable "datadog_agent_alerting_enabled" {
  type    = bool
  default = true
}

variable "datadog_agent_no_data_timeframe" {
  description = "Timeframe in minutes after which we send alerts if a host is unavailable"
  type        = number
  default     = 2
}
