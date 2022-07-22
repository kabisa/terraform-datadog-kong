locals {
  dns_response_time_filter = coalesce(
    var.dns_response_time_filter_override,
    var.filter_str
  )
}

module "dns_response_time" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "DNS response time"
  query = "avg(${var.dns_response_time_evaluation_period}):avg:dns.response_time{${local.dns_response_time_filter}} by {host} > ${var.dns_response_time_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "DNS response time ({{ value }}) in {{ service }} exceed {{ threshold }}"
  recovery_message    = "DNS response time ({{ value }}) in {{ service }} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.dns_response_time_enabled
  alerting_enabled   = var.dns_response_time_alerting_enabled
  warning_threshold  = var.dns_response_time_warning
  critical_threshold = var.dns_response_time_critical
  priority           = min(var.dns_response_time_priority + var.priority_offset, 5)
  docs               = var.dns_response_time_docs
  note               = var.dns_response_time_note
}
